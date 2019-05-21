package edu.gd.ccp.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.MessageList;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminMessageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.service.UserMeetingManageService;
import edu.gd.ccp.service.UserMessageService;
import edu.gd.ccp.service.VoteUserService;
import edu.gd.ccp.util.EmailUtil;

@Controller
@Scope(value = "prototype")
@RequestMapping("/schoolMessage")
public class MessageUserController {
	@Resource
	private UserAccountService userAccountService;
	@Resource
	private UserMessageService userMessageService;
	@Resource
	private AdminMessageService messageService;
	@Resource
	VoteUserService voteUserService;
	@Resource
	private UserMeetingManageService userMeetingManageService;	
	@Resource
    private UserDocumentManageService userDocumentManageService;
	
	// 2018.12.21
	// 进入发送消息页面
	@RequestMapping("/intoSendingMessage.do")
	public String intoSendMessage(HttpSession session, ModelMap model) {
		menuSide(session,model);
		return "school/message-sending";
	}

	// 向管理员发送消息
	@RequestMapping("/sendingMessage.do")
	@ResponseBody
	public ResponseResult<String> sendingMessage(HttpSession session, Model model, HttpServletRequest request, String title,
			String content) {

		  System.out.println("##########发送消息中#########");
		ResponseResult<String> result = new ResponseResult<String>();
		String userId = (String) session.getAttribute("userId");

		User userinfo = userAccountService.getOneUserByPrimaryKey(userId);
		int organizationId = userinfo.getOrganizationid();

		Organization organizationInfo = userMessageService.getOrganizationByOrganizationId(organizationId);
		String organizationNo = organizationInfo.getOrganizationno();

		Message message = new Message();
		message.setTitle(title);
		// 初次发送设置为零
		message.setReplyid(0);
		message.setContent(content);
		message.setFromuserid(userId);
		message.setFromorganizationno(organizationNo);
		message.setFromorganizationid(organizationId);
		List<User> admins=userAccountService.selectAdmins();
		User admin=admins.get(0);
 		Integer toOrganizationId = admin.getOrganizationid();//noAndId.get("organizationId");
        String toOrganizationNo=admin.getOrganizationno();
		// // 发送给广东省教育工委
		message.setToorganizationid(toOrganizationId);
		message.setToorganizationno(toOrganizationNo);
		message.setToorganizationids(String.valueOf(toOrganizationId));
		message.setToorganizationnos(toOrganizationNo);
		// 获取所有用户;
		List<Map<String, String>> users = userAccountService.getUserIdAndOrganNo(toOrganizationId);
		for (Map<String, String> map : users) {
			String email = map.get("email");
		 
			// 发给单位的每个用户
			if (email != null && !email.trim().equals("")) {
				String msgcontent = userId + ",您有一条信息待处理！" + message.getContent();
				EmailUtil.sendMail(message.getTitle(), email, msgcontent);
			}
		}
		message.setState("未读");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		Timestamp sendTime = new Timestamp(System.currentTimeMillis());
		// sendTime =
		// Timestamp.valueOf(request.getParameter("meetingTime").replaceAll("T", "
		// ")+":00");

		message.setSendtime(sendTime);
 
		// 插入数据库
		try {
			int row=userMessageService.sendMessageToAdmin(message);
			System.out.println("插入结果"+row);
			if(row >= 1)
			{
				result.setState(ResponseResult.State_OK);
				result.setMessage("成功发布消息！");
			}
			else{
				result.setState(ResponseResult.State_ERR);
				result.setMessage("发布消息失败！");
			}
		} catch (Exception e) {
			result.setState(ResponseResult.State_ERR);
			result.setMessage("出现异常！");
			System.out.println(e.toString());
		}
		
		return result;
	}

	// 进入消息界面
	@RequestMapping("/intoListMessage-bak.do")
	public String listMessage(HttpServletRequest request, HttpSession session, String page, Model model,
			String action) {

		// 列出所有消息
		String userId = (String) session.getAttribute("userId");
		User user = userAccountService.getOneUserByPrimaryKey(userId);
		/** user暂未更新，先注释 */
		// String organizationNo = user.getOrganizationNo();
		String organizationNo = null;
		int organizationId = user.getOrganizationid();
		// 分页
		PageBean<MessageList> pageBean = new PageBean<MessageList>();

		int pageno = 1;
		if (page == null)
			pageno = 1;
		else
			pageno = Integer.parseInt(page);

		if (pageno < 1)
			pageno = 1;

		// 封装当前页数
		pageBean.setCurrPage(pageno);
		// 每页显示的数据条数
		pageBean.setPageSize(5);

		// 获取总记录数
		Integer messageNums = userMessageService.countMessage(userId, organizationNo, organizationId, 0);
		System.out.println("总页数：" + messageNums);
		if (messageNums == null)
			messageNums = 0;

		// 封装总记录数
		int totalCount = messageNums;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());

		// 0代表初次发送
		List<MessageList> message = userMessageService.listMessageByOrganizationId(
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(), userId, organizationNo,
				organizationId, 0);
		// 封装数据

		for (int i = 0; i < message.size(); i++) {
			// 查询所有针对该消息的回复
			int replyId = message.get(i).getMsgId();
			List<Map> replyMessages = userMessageService.listReplyMessage(replyId);
			message.get(i).setMessages(replyMessages);
			List<Message> stateOfReplyMessages = userMessageService.getReplyMessageByReplyId(replyId);
			String state = message.get(i).getState();

			//
			// 如果最近一条消息，不是我们发送的，且其状态是"已读"时，则该系列确认该系列已读
			// 因为是正序排序，所以从0开始，也就是最新回复的消息
			int size = stateOfReplyMessages.size();
			for (int j = size - 1; j >= 0; j--) {

				// 对方发送的消息且我们未读
				if (stateOfReplyMessages.get(j).getFromorganizationid() != organizationId
						&& stateOfReplyMessages.get(j).getState() != "未读") {
					state = "已读";

					break;
				}
			}

			// 如果只有一条消息，且是自己发的，我们也认为其是已读的
			if (stateOfReplyMessages.size() == 0 && message.get(i).getFromOrganizationId() == organizationId)
				state = "已读";

			message.get(i).setState(state);

			// 设置最后回复时间,方便重排序
			if (stateOfReplyMessages.size() > 0)
				message.get(i).setLastReplyTime(stateOfReplyMessages.get(size - 1).getSendtime());
			else {
				message.get(i).setLastReplyTime(message.get(i).getSendTime());
			}
		}

		// 根据该系列的最后的回复时间，对List<MessageList>重新排序
		// 把发送日期晚的放前面
		Collections.sort(message, new Comparator<MessageList>() {

			@Override
			public int compare(MessageList m1, MessageList m2) {
				return m2.getLastReplyTime().compareTo(m1.getLastReplyTime());
			}
		});

		pageBean.setLists(message);

		model.addAttribute("message", pageBean);
		return "school/message-list";
	}

	@RequestMapping("/replyMessage.do")
	@ResponseBody
	public boolean replyMessage(HttpSession session, HttpServletRequest request, String replyText, int msgId,
			Model model) {

		// System.out.println("##########回复消息中……");
		// System.out.println(replyText);
		// System.out.println(msgId);
		String userId = (String) session.getAttribute("userId");

		User userinfo = userAccountService.getOneUserByPrimaryKey(userId);
		int organizationId = userinfo.getOrganizationid();

		Organization organizationInfo = userMessageService.getOrganizationByOrganizationId(organizationId);
		String organizationNo = organizationInfo.getOrganizationno();

		Message message = new Message();

		message.setContent(replyText);
		// 回复该msgId
		message.setReplyid(msgId);
		message.setFromuserid(userId);
		message.setFromorganizationno(organizationNo);
		message.setFromorganizationid(organizationId);

		// // 发送给广东省教育工委
		List<User> admins=userAccountService.selectAdmins();
		User admin=admins.get(0);
		message.setToorganizationid(admin.getOrganizationid());
		message.setToorganizationno(admin.getOrganizationno());
		message.setState("未读");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		Timestamp sendTime = new Timestamp(System.currentTimeMillis());

		message.setSendtime(sendTime);

		boolean res = false;
		try {
			userMessageService.sendMessageToAdmin(message);
			res = true;
		} catch (Exception e) {
			res = false;
		}
		System.out.println("res:" + res);
		return res;
	}

	// 设置消息已读
	@RequestMapping("/updateMessageStatus.do")
	@ResponseBody
	public void readMessage(HttpServletRequest request, int msgId, HttpSession session) {
		System.out.println("消息已读#######");
		System.out.println("msgId:" + msgId);

		String userId = (String) session.getAttribute("userId");
		User user = userAccountService.getOneUserByPrimaryKey(userId);

		int organizationId = user.getOrganizationid();

		// 对方已读才叫已读

		Message initialMessage = userMessageService.getMessageByMsgId(msgId);
		int fromOrganizationId = initialMessage.getFromorganizationid();
		String state = initialMessage.getState();

		// 判断是否自己发出去的，若不是则不更新
		// 判断是否已经读过，若不是则不更新
		if (organizationId != fromOrganizationId && state != "已读") {
			// 更新初始发送的消息
			userMessageService.updateMessageStatus(msgId);
		}

		// 更新在这个系列下面的消息的状态
		List<Message> replyMessages = userMessageService.getReplyMessageByReplyId(msgId);
		System.out.println("查询到的条数" + replyMessages.size());
		for (int i = 0; i < replyMessages.size(); i++) {
			fromOrganizationId = replyMessages.get(i).getFromorganizationid();
			state = replyMessages.get(i).getState();

			if (organizationId != fromOrganizationId && state != "已读") {
				// 更新初始发送的消息
				userMessageService.updateMessageStatus(replyMessages.get(i).getMsgid());

			}
		}

	}

	@RequestMapping("/intoMessageList")
	public String intoMessageList(HttpSession session, ModelMap model,
			@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "15") Integer pageSize) {
		String userId = (String) session.getAttribute("userId");
		User user = userAccountService.getOneUserByPrimaryKey(userId);
		Integer organizationId = user.getOrganizationid();
		// 获取该单位所有相关信息
		PageHelper.startPage(page, pageSize);
		List<Map> messages = userMessageService.selectAllMessagsByOrganizationId(organizationId);
		PageInfo<Map> pageInfo = new PageInfo<Map>(messages);
		model.addAttribute("page", pageInfo);
		//首发的消息列表
		model.addAttribute("messageList", messages);
		model.addAttribute("organizationid", String.valueOf(user.getOrganizationid()));
		// 消息id，回复该消息id的回复消息列表
		Map<Integer, List<Map>> replyMessages = new HashMap<Integer, List<Map>>();
		for (Map message : messages) {
			Integer msgId = Integer.parseInt(message.get("msgId").toString());
			List<Map> replys = this.messageService.getReplyMessageInfoByReplyId(msgId);
			replyMessages.put(msgId, replys);
		}
		model.addAttribute("replyMessages", replyMessages);
		menuSide(session,model);
		return "/school/messageList";
	}

	public  void menuSide(HttpSession session,ModelMap model) {
		String userId = (String)session.getAttribute("userId");
		User user=this.userAccountService.getOneUserByPrimaryKey(userId);
		//待提交文档任务数量
		Integer documentNums = userDocumentManageService.getUnsubmitDocumentCounts(user.getOrganizationid());
		//未投票数
		int unvoteTaskNum=this.voteUserService.unvoteTaskCountByOrganizationNo(user.getOrganizationno());
		// 这里要根据查询状态来查询总数,待报名总数
		int meetingNums = userMeetingManageService.getMeetingCount(user.getOrganizationid(), "未参加");
		String idUnreadState=String.valueOf(user.getOrganizationid()+":0");
		int unReadMsg=this.userMessageService.countUnreadMessageNum(userId, user.getOrganizationno(), user.getOrganizationid(), 0,idUnreadState);
        model.addAttribute("documentNums", documentNums);
        model.addAttribute("unvoteTaskNum", unvoteTaskNum);
        model.addAttribute("meetingNums", meetingNums);
        model.addAttribute("unReadMsg", unReadMsg);
        //return "/school/navbar-side";
	}
	//阅读
	@RequestMapping(value="/readMessage",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> readMessage(HttpSession session,Integer msgId){
		String userId = (String)session.getAttribute("userId");
		User user=this.userAccountService.getOneUserByPrimaryKey(userId);
		ResponseResult<Void> result = new ResponseResult<Void>();
		String str1=String.valueOf(user.getOrganizationid())+":0";
		String str2=String.valueOf(user.getOrganizationid())+":1";
		int row=this.userMessageService.schoolUpdateMessageStatus(str1, str2,msgId);
		 System.out.println(msgId+" "+row);
		if(row>0)
			result.setState(ResponseResult.State_OK);
		else
			result.setState(ResponseResult.State_ERR);
		return result;
	}

}
