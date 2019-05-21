package edu.gd.ccp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.MessageMapper;
import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.MessageList;
import edu.gd.ccp.service.UserMessageService;

@Service("UserMessageService")
public class UserMessageServiceImpl implements UserMessageService {

	@Autowired
	OrganizationMapper organizationMapper;
	@Autowired
	MessageMapper messageMapper;
	
	@Override
	public Organization getOrganizationByOrganizationId(int organizationId) {
		// TODO 自动生成的方法存根
		return organizationMapper.selectByPrimaryKey(organizationId);
	}

	@Override
	public Message getMessageByMsgId(int msgId) {
		// TODO 自动生成的方法存根
		return messageMapper.selectByPrimaryKey(msgId);
	}
	
	@Override
	public int sendMessageToAdmin(Message message) {
		// TODO 自动生成的方法存根
		return messageMapper.sendMessageToAdmin(message);
	}
	
	@Override
	public Integer countMessage(String userId, String organizationNo, 
			int organizationId, int replyId) {
		// TODO 自动生成的方法存根
		return messageMapper.countMessageNum(userId, organizationNo, organizationId, replyId);
	}

	@Override
	public List<MessageList> listMessageByOrganizationId(int offset, int limit, 
			String userId, String organizationNo, int organizationId, int replyId) {
		// TODO 自动生成的方法存根
		return messageMapper.listAllMessage(offset, limit, userId, organizationNo, organizationId, replyId);
	}

	@Override
	public int updateMessageStatus(int msgId) {
		// TODO 自动生成的方法存根
		return messageMapper.updateMessageStatus(msgId);
	}

	@Override
	public List<Map> listReplyMessage(int replyId) {
		// TODO 自动生成的方法存根
		return messageMapper.listReplyMessage(replyId);
	}

	@Override
	public List<Message> getReplyMessageByReplyId(int replyId) {
		// TODO 自动生成的方法存根
		return messageMapper.getReplyMessageByReplyId(replyId);
	}

	@Override
	public List<Map> selectAllMessagsByOrganizationId(Integer organizationId) {
		// TODO Auto-generated method stub
		return messageMapper.selectAllMessagsByOrganizationId(organizationId);
	}
	@Override
	public Integer countUnreadMessageNum(String userId, String organizationNo, Integer organizationId,
			Integer replyId,String idReadState) {
		// TODO Auto-generated method stub
		return this.messageMapper.countUnreadMessageNum(userId, organizationNo, organizationId, replyId,idReadState);
	}

	@Override
	public int schoolUpdateMessageStatus( String str1, String str2,int msgId) {
		// TODO Auto-generated method stub
		return this.messageMapper.schoolUpdateMessageStatus(str1, str2,msgId);
	}

}
