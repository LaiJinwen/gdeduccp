package edu.gd.ccp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.AdminMessageService;
import edu.gd.ccp.service.AdminOrgazationService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;

@Controller
@Scope(value = "prototype")
@RequestMapping("/adminMessage")
public class MessageAdminController {
	@Resource
	private UserAccountService userAccountService;
	@Resource
    private UserDocumentManageService userDocumentManageService;
	@Resource
	private AdminMessageService adminMessageService;
	@Resource
	private AdminMessageService messageService;
	@Resource
	private AdminOrgazationService adminOrganService;
 	
	@RequestMapping("intoSendingMessage.do")
	public String intoSendingMessage(HttpServletRequest request, Model model, HttpSession session) {
		List<Organization> organizationList = adminMessageService.listAllSchool();
		model.addAttribute("organizationList",organizationList);
		return "admin/message-sending";
	}
	
	@RequestMapping("/intoMessage")
	public String intoMessage() {
		return "/admin/sendMessage";
	}
	
	@RequestMapping("/intoMessageList")
	public String intoMessageList(ModelMap model,			
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=false,defaultValue="15") Integer pageSize) {

		PageHelper.startPage(page,pageSize);
		List<Map> messages=messageService.getAllMessages();		
		PageInfo<Map> pageInfo = new PageInfo<Map>(messages);
		model.addAttribute("list", messages);
		model.addAttribute("page", pageInfo); 
		//消息id，回复该消息id的回复消息列表
		Map<Integer,List<Map>> replyMessages=new HashMap<Integer,List<Map>>();
		for(Map message:messages) {
			Integer msgId=Integer.parseInt(message.get("msgId").toString());
			List<Map> replys=this.messageService.getReplyMessageInfoByReplyId(msgId);
			replyMessages.put(msgId, replys);
		}
		model.addAttribute("replyMessages", replyMessages);
		return "/admin/messageList";
	}
	
	@RequestMapping(value="/handleFindSchoolWithBelongLevelType",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<List<Organization>> handleFindSchoolWithBelongLevelType(
			@RequestParam(value="belong[]",required=false)String[] belong, @RequestParam(value="level[]",required=false)String[] level,
			@RequestParam(value="type[]",required=false) String[] type
			){
		System.out.println(type);
		ResponseResult<List<Organization>> result = new ResponseResult<List<Organization>>();
		result.setData(adminOrganService.getOrganNameByBelongLevelType(belong, level, type));
		if(result.getData()!= null)
			result.setState(ResponseResult.State_OK);
		else
			result.setState(ResponseResult.State_ERR);
		return result;
	}
	
	@RequestMapping(value="/doPublishMessage.do",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult<String> doPublishMessage(
			@RequestParam(value="title",required=true) String title, @RequestParam(value= "cont",required=true)String content,
			@RequestParam(value="arr[]",required=true) String[] arr, HttpSession session
			){
		ResponseResult<String> result = new ResponseResult<String>();
		//0表示未读
		String OrgIds=StringUtils.join(arr,":0,");
		OrgIds=OrgIds+":0";
		String userId = (String) session.getAttribute("userId");
//		System.out.println("userId="+userId);
//		System.out.println("title="+title);
//		System.out.println("OrgIds="+OrgIds);
		//Map<String,Integer> noAndId = userAccountService.getOrganizationNoAndIdByUserId("99999");
		//获取管理员
		List<User> admins=userAccountService.selectAdmins();
 		Integer fromOrganizationId = admins.get(0).getOrganizationid();//noAndId.get("organizationId");
		Date sendTime = new Date();
		String state = "未读";
		Message message = new Message();
		message.setTitle(title);
		message.setContent(content);
		message.setFromuserid(userId);
		message.setFromorganizationno(admins.get(0).getOrganizationno());//String.valueOf(noAndId.get("organizationNo")));
		message.setFromorganizationid(fromOrganizationId);
		
		message.setSendtime(sendTime);
		message.setState(state);
		int publishResult =  messageService.addMessage(message, OrgIds);
		if(publishResult >= 1)
		{
			result.setState(ResponseResult.State_OK);
			result.setMessage("成功发布消息！");
		}
		else{
			result.setState(ResponseResult.State_ERR);
			result.setMessage("发布消息失败！");
		}
		return result;
		
	}	
	@RequestMapping(value="/readMessage",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> readMessage(Integer msgId){
		 
		ResponseResult<Void> result = new ResponseResult<Void>();
		int row=this.messageService.updateMessageStatus(msgId);
		 System.out.println(msgId+" "+row);
		if(row>0)
			result.setState(ResponseResult.State_OK);
		else
			result.setState(ResponseResult.State_ERR);
		return result;
	}

	@RequestMapping(value="/replyMessage",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> replyMessage(Integer msgId,String msg, HttpSession session){
		String userId = (String) session.getAttribute("userId"); 
		int organizationId = userDocumentManageService.getOrganizationId(userId);
		ResponseResult<Void> result = new ResponseResult<Void>();
		Message message = new Message();
		message.setContent(msg);	
		message.setFromorganizationid(organizationId);
		message.setReplyid(msgId);
		message.setSendtime(new Date());
		message.setFromuserid(userId);
		System.out.println(msgId+" "+userId);
		int row=this.messageService.replyMessage(message);
		 System.out.println(msgId+" "+row);
		if(row>0)
			result.setState(ResponseResult.State_OK);
		else
			result.setState(ResponseResult.State_ERR);
		return result;
	}	
}
