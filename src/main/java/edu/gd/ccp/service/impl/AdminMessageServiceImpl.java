package edu.gd.ccp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gd.ccp.dao.MessageMapper;
import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.dao.UserMapper;
import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.service.AdminMessageService;
import edu.gd.ccp.util.EmailUtil;

@Service("AdminMessageService")
public class AdminMessageServiceImpl implements AdminMessageService {
	@Autowired
	OrganizationMapper organizationMapper;
	@Autowired
	MessageMapper messageMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<Organization> listAllSchool() {
		// TODO 自动生成的方法存根
		return organizationMapper.listAllOrganization();
	}

	@Transactional
	public int addMessage(Message message, String organIds) {
		int result = 0;
//		System.out.println(organId);
		String[] organId=organIds.split(",");
		for(String orId : organId)
		{ //获取所有用户
			//用户号：0  0表示是否阅读过
			String[] orgIdAndState=orId.split(":");
			Integer orgId= Integer.parseInt(orgIdAndState[0]);
			List<Map<String, String>> maps = userMapper.selectUserIdAndOrganNo(orgId);
			for(Map<String, String> map:maps){
			String organizationName=map.get("organizationName");
			String email=map.get("email");
			String content=message.getContent();
			content =organizationName+"，您有一条短消息！"+content;
			//发给单位的每个用户
			if(email!=null && !email.trim().equals("")) {
			EmailUtil.sendMail(message.getTitle(),email,content);
			 }
 			}
			//
		}
		// 接收单位以id列表形式记录,数据库里只保留发送一条记录
		message.setToorganizationids(organIds);
		result = messageMapper.insertSelective(message);
		return result;
		 
	}

	@Override
	public List<Map> getAllMessages() {
		
		return messageMapper.selectAllMessags();
	}

	@Override
	public int updateMessageStatus(int msgId) {
		// TODO Auto-generated method stub
		return this.messageMapper.updateMessageStatus(msgId);
	}

	@Override
	public int replyMessage(Message record) {
		// TODO Auto-generated method stub
		return this.messageMapper.insertSelective(record);
	}

	@Override
	public List<Map> getReplyMessageInfoByReplyId(int replyId) {
		// TODO Auto-generated method stub
		return this.messageMapper.getReplyMessageInfoByReplyId(replyId);
	}

 

}
