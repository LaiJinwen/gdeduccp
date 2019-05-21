package edu.gd.ccp.controller;

import java.util.List;
import java.util.Map;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingAttendees;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.AdminMeetingManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.service.UserMeetingManageService;
import edu.gd.ccp.service.UserMessageService;
import edu.gd.ccp.service.VoteUserService;
import net.sf.json.JSONObject;

@Controller
@Scope(value = "prototype")
@RequestMapping("/schoolMeeting")
public class MeetingUserController {

	@Resource
	private UserDocumentManageService userDocumentManageService;

	@Resource
	private UserMeetingManageService userMeetingManageService;

	@Resource
	private UserAccountService userAccountService;
	@Resource
	private AdminMeetingManageService adminMeetingManageService;
	@Resource
	VoteUserService voteUserService;	
	@Resource
	private UserMessageService userMessageService;
	// 增加于2018/11/23
	@RequestMapping("/listMeeting.do")
	public String listMeeting(HttpSession session, Model model, String attendanceState, String page) {

		// 判断查询参数,为all时查询全部，将查询状态设为空即可
		if (attendanceState != null && attendanceState.equals("all")) {
			attendanceState = null;
		}

		String userId = (String) session.getAttribute("userId");

		int organizationId = userDocumentManageService.getOrganizationId(userId);

		// 分页
		PageBean<Map> pageBean = new PageBean<Map>();

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
		pageBean.setPageSize(10);
		// 获取总记录数
		// 这里要根据查询状态来查询总数
		int meetingNums = userMeetingManageService.getMeetingCount(organizationId, attendanceState);
		System.out.println("会议记录数：" + meetingNums);

		// 封装总记录数
		int totalCount = meetingNums;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());

		List<Map> meeting = userMeetingManageService.listAllMeeting(
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(), organizationId,
				attendanceState);
		System.out.println("会议数：" + meeting.size());
		// 封装数据
		pageBean.setLists(meeting);

		model.addAttribute("meeting", pageBean);
		model.addAttribute("attendanceState", attendanceState);
		menuSide(session,model);
		return "school/meeting-list";
	}

	// 进入会议详细信息页面
	@RequestMapping("/intoMeetingDetail.do")
	public String intoMeetingDeatil(Model model, int taskId) {

		List<Map> meetingDetail = userMeetingManageService.listMeetingDetail(taskId);
		model.addAttribute("meetingDetail", meetingDetail);
		
		return "school/meeting-detail";
	}

	// 增加于2018/11/25
	/**
	 * 用户扫描 - 进入登录页面 - 登录 - 进入信息填写界面 - 提示签到成功
	 * 
	 */
	@RequestMapping("/intoMeetingLogin.do")
	public String goIntoMettingLogin(int meetingId, Model model, HttpServletRequest request) {
		// 测试用，清除所有session，方便后续登录
		HttpSession session = request.getSession(true);
		session.invalidate();
		List<Meeting> meetingMessage = userMeetingManageService.getMeetingMessageByMeetingId(meetingId);

		model.addAttribute("meetingMessage", meetingMessage);

		session = request.getSession(true);
		session.setAttribute("meetingId", meetingId);

		return "school/meeting-login";
	}

	// 会议签到流程中的登录模块,手机端
	@RequestMapping("/meetingLogin.do")
	public String login(User user, Model model, HttpServletRequest request, HttpSession session,
			RedirectAttributes redirectAttributes) {
		JSONObject result = this.userAccountService.userLogin(user.getUserid(), user.getPassword());
		if (result.getInt("status") == 1) {// 登录成功
			// 登录成功的话，先查询有无参会权限
			int organizationId = userDocumentManageService.getOrganizationId(user.getUserid());
			int meetingId = (int) session.getAttribute("meetingId");
			// 获取参会任务
			List<Map> signatureMeetingMsg = userMeetingManageService.getSignatureMessage(organizationId, meetingId);
			List<Meeting> meetingMessage = userMeetingManageService.getMeetingMessageByMeetingId(meetingId);
			model.addAttribute("meetingMessage", meetingMessage);
			// 当其为空时，说明会没有参会资格
			if (signatureMeetingMsg == null || signatureMeetingMsg.size() < 1) {
				System.out.println("您没有本次参会权限！");
				model.addAttribute("reason", "您没有本次参会权限！");
				// 返回个错误页面给他
				model.addAttribute("meetingId", meetingId);
				return "school/meeting-login";
			} else {
				System.out.println("参会任务" + signatureMeetingMsg);
				session = request.getSession(true);
				session.setAttribute("userId", user.getUserid());
				session.setAttribute("userName", result.opt("userName"));
				session.setAttribute("userType", result.opt("usertype"));
				redirectAttributes.addAttribute("organizationNo", signatureMeetingMsg.get(0).get("organizationNo"));
				redirectAttributes.addAttribute("taskId", signatureMeetingMsg.get(0).get("taskId"));
				redirectAttributes.addAttribute("meetingId", meetingId);
				return "redirect:/schoolMeeting/intoUserMeetingSignMobile.do";
			}
		} else {
			// 登录失败，返回登录
			model.addAttribute("reason", result.opt("reason"));
			return "school/meeting-login";

		}
	}

	// 进入参会信息填写界面，手机端，通过扫码进入(旧版本)
	@RequestMapping("/intoUserMeetingfillOutMessage.do")
	public String fillOutMeetingMessage(HttpServletRequest request, Model model, int meetingId,
			HttpSession session) {
		/**
		 * 这里不设置重复签到的处理，是为了方便信息二次填写 判断meetingId 和 organizationId 是否出现在数据库的同一行
		 * 不在同一行的话，提示不用出席会议
		 */
		String userId = (String) session.getAttribute("userId");
		int organizationId = userDocumentManageService.getOrganizationId(userId);

		System.out.println("登陆成功！userId " + userId + " meetingId" + meetingId + "organizationId" + organizationId);

		// 查询用户签到信息， 及列出会议的部分信息
		List<Map> signatureMeetingMsg = userMeetingManageService.getSignatureMessage(organizationId, meetingId);
		System.out.println(signatureMeetingMsg.size());
		
		if (signatureMeetingMsg.size() > 0) {
			model.addAttribute("signatureMeetingMsg", signatureMeetingMsg);
			// 二次签到的话，可以在页面上显示原信息，方便修改
			return "school/meeting-signin";
		} else {
			return "school/meeting-signnoneed";
		}
	}

	@RequestMapping("/userMeetingSignature.do")
	public String meetingSignature(HttpServletRequest request, Model model, HttpSession session, int attendeeNumber,
			String contacts, String Mobile, String email, String attendeesName, int meetingId) {
		// 上述参数为扫码登录后填写的信息

		String userId = (String) session.getAttribute("userId");
		// 找到组织Id
		int organizationId = userDocumentManageService.getOrganizationId(userId);

		// 更新数据库
		userMeetingManageService.userMeetingSignature(organizationId, meetingId, attendeeNumber, contacts, Mobile,
				email, attendeesName);

		return "school/meeting-signSuccess";
	}

	// 进入参会信息填写界面，web端，需先登录
	@RequestMapping("/intoUserMeetingfillMessageWeb.do")
	public String fillOutMeetingMessageWeb(HttpServletRequest request, Model model, Integer taskId, Integer meetingId,
			HttpSession session) {

		/**
		 * 这里不设置重复签到的处理，是为了方便信息二次填写 判断meetingId 和 organizationId 是否出现在数据库的同一行
		 * 不在同一行的话，提示不用出席会议
		 */
		String userId = (String) session.getAttribute("userId");
		// int organizationId = userDocumentManageService.getOrganizationId(userId);

		// System.out.println("登陆成功！userId "+userId+"
		// meetingId"+meetingId+"organizationId"+organizationId);
		MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
		List<MeetingAttendees> meetingAttendees = this.userMeetingManageService.getMeetAttendeesByTaskId(taskId);
		Meeting meeting = this.adminMeetingManageService.selectByPrimaryKey(meetingId);
		// 查询用户签到信息， 及列出会议的部分信息
		// List<Map> signatureMeetingMsg =
		// userMeetingManageService.getSignatureMessage(organizationId, meetingId);
		// System.out.println(signatureMeetingMsg.size());
		// if(meetingTask!=null) {
		model.addAttribute("meetingAttendees", meetingAttendees);
		model.addAttribute("meetingTask", meetingTask);
		model.addAttribute("meeting", meeting);
		// 二次签到的话，可以在页面上显示原信息，方便修改
		menuSide(session,model);
		return "school/meetingSinginWeb";
	}

	// 添加参会人员，web端
	@RequestMapping("/meetingSign")
	public String MeetingSignWeb(HttpServletRequest request, Model model, MeetingAttendees meetingAttendees,
			Integer taskId, Integer meetingId, HttpSession session) {
		meetingAttendees.setTaskid(taskId);
		meetingAttendees.setRegtime(new Date());
		int result = this.userMeetingManageService.insertSelective(meetingAttendees);
		MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
		meetingTask.setAttendancestate("已参加");
		int attendeenumber=meetingTask.getAttendeenumber()+1;
		meetingTask.setAttendeenumber(attendeenumber);
		int result2 = this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);
		return "redirect:/schoolMeeting/intoUserMeetingfillMessageWeb.do?taskId=" + taskId + "&meetingId=" + meetingId;

	}

	// 删除参会人
	@RequestMapping("/cancelSigninWeb")
	public String cancelSigninWeb(HttpServletRequest request, Model model, Integer taskId, Integer attendId,
			Integer meetingId, HttpSession session) {
		MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
		int attendeenumber=meetingTask.getAttendeenumber()-1;
		if(attendeenumber<0)
			attendeenumber=0;
		meetingTask.setAttendeenumber(attendeenumber);
		// 更新
		int row2 = this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);		
		int result2 = this.userMeetingManageService.deleteByPrimaryKey(attendId);
		return "redirect:/schoolMeeting/intoUserMeetingfillMessageWeb.do?taskId=" + taskId + "&meetingId=" + meetingId;
	}

	// 进入参会信息填写界面，手机端，通过扫码进入
	@RequestMapping("/intoUserMeetingSignMobile.do")
	public String intoUserMeetingSignMobile(HttpServletRequest request, Model model, int taskId, int meetingId,
			String organizationNo, HttpSession session) {

		MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
		Meeting meeting = this.adminMeetingManageService.selectByPrimaryKey(meetingId);
		List<MeetingAttendees> meetingAttendees = this.userMeetingManageService.getMeetAttendeesByTaskId(taskId);
		model.addAttribute("meetingAttendees", meetingAttendees);
		model.addAttribute("meetingTask", meetingTask);
		model.addAttribute("meeting", meeting);
		return "school/meetingSinginMobile";
	}

	// 添加参会人,手机端
	// @RequestMapping("/doAddMeetingAttendees")
	// @ResponseBody
	// public ResponseResult<Void> doAddMeetingAttendees(HttpServletRequest request,
	// Model model,
	// MeetingAttendees meetingAttendees, Integer taskId, Integer meetingId,
	// HttpSession session) {
	// ResponseResult<Void> result = new ResponseResult<Void>();
	// meetingAttendees.setTaskid(taskId);
	// meetingAttendees.setRegtime(new Date());
	// // 添加参会人
	// int row1 = this.userMeetingManageService.insertSelective(meetingAttendees);
	// if (row1 > 0) {//若插入成功
	// MeetingTask meetingTask =
	// this.userMeetingManageService.selectByPrimaryKey(taskId);
	// if (!meetingTask.getAttendancestate().equals("已参加")) {//首次添加参会人
	// meetingTask.setAttendancestate("已参加");
	// // 更新
	// int row2 =
	// this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);
	// if (row2 > 0) {//更新状态成功
	// result.setState(ResponseResult.State_OK);
	// // result.setData(list);
	// result.setMessage("成功返回数据~~");
	// return result;
	// }
	// }
	// }
	// //插入失败
	// result.setData(null);
	// result.setState(-1);
	// result.setMessage("添加参会人失败，请重试");
	// return result;
	// }
	// 添加参会人,手机端
	@RequestMapping("/doAddMeetingAttendees")
	@ResponseBody
	public ResponseResult<MeetingAttendees> doAddMeetingAttendees(HttpServletRequest request, Model model,
			MeetingAttendees meetingAttendees, Integer taskId, Integer meetingId, HttpSession session) {
		ResponseResult<MeetingAttendees> result = new ResponseResult<MeetingAttendees>();
		System.out.println(meetingAttendees.getAttendeename());
		meetingAttendees.setTaskid(taskId);
		meetingAttendees.setRegtime(new Date());
		// 添加参会人
		int row1 = this.userMeetingManageService.insertSelective(meetingAttendees);
		if (row1 > 0) {// 若插入成功
			result.setData(meetingAttendees);
			result.setState(1);
			MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
			//if (!meetingTask.getAttendancestate().equals("已参加")) {// 首次添加参会人
				meetingTask.setAttendancestate("已参加");
				int attendeenumber=meetingTask.getAttendeenumber()+1;
				meetingTask.setAttendeenumber(attendeenumber);
				// 更新
				int row2 = this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);
				if (row2 > 0) {// 更新状态成功
					// result.setData(list);
					result.setMessage("添加成功，状态更新成功！");
				}else {
					result.setMessage("添加成功，状态更新失败！");
				}
			//}
			//else {
			//	result.setMessage("添加成功！");
			//}
		} else {
			// 插入失败
			result.setData(null);
			result.setState(-1);
			result.setMessage("添加参会人失败，请重试");
		}
		return result;
	}
	// 删除参会人,手机端
	@RequestMapping("/cancelSigninMobile")
	@ResponseBody
	public ResponseResult<Void> cancelSigninMobile(HttpServletRequest request, Model model, Integer taskId, Integer attendId,
			Integer meetingId, HttpSession session) {
		ResponseResult<Void> result = new ResponseResult<Void>();
		System.out.println(attendId);
		MeetingTask meetingTask = this.userMeetingManageService.selectByPrimaryKey(taskId);
		int attendeenumber=meetingTask.getAttendeenumber();
		if(attendeenumber>0)
			attendeenumber=attendeenumber-1;
		meetingTask.setAttendeenumber(attendeenumber);
		// 更新
		int row2 = this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);
           
		int row= this.userMeetingManageService.deleteByPrimaryKey(attendId);
		
		if(row>0)
			result.setState(1);
		else
			result.setState(-1);
		return result;
	}

	public  void menuSide(HttpSession session,Model model) {
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
}
