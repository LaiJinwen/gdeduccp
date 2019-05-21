package edu.gd.ccp.service;
//发送和接收消息

import java.util.List;
import java.util.Map;

import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.MessageList;

public interface UserMessageService {
 
	// 2018.12.21
	// 由组织id获取其余信息
	public Organization getOrganizationByOrganizationId(int organizationId);
	
	public Message getMessageByMsgId(int msgId);
	
	// 发送消息给管理员
	public int sendMessageToAdmin(Message message);
	
	// 统计信息总数
	public Integer countMessage(String userId, String organizationNo, 
			int organizationId, int replyId);

	public List<MessageList> listMessageByOrganizationId(int offset, int limit,
			String userId, String organizationNo,int organizationId, int replyId);
	
	// 设置消息已读
	public int updateMessageStatus(int msgId);
	
	// 列出该系列的消息的回复
	public List<Map> listReplyMessage(int replyId);
	
	// 列出该系列的消息的回复
	public List<Message> getReplyMessageByReplyId(int replyId);
	// 列出某单位所有相关的消息
	public List<Map> selectAllMessagsByOrganizationId(Integer organizationId);
	
    Integer countUnreadMessageNum(String userId, 
    		String organizationNo,
    		Integer organizationId,
    		Integer replyId,String idReadState);
    
    int schoolUpdateMessageStatus(String str1,String str2,int msgId);
}
