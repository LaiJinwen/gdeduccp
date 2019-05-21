package edu.gd.ccp.service;
//发送消息、短信和邮件发送、介绍消息

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
//发送消息、短信和邮件发送、介绍消息
public interface AdminMessageService {
 
	// 2019.01.01
	// 列出所有学校
	List<Organization> listAllSchool();
	
	/**
	 * 发布消息
	 * @param message 信息的实体
	 * @param noAndId 要发布组织对象  的自编号 NO 和 id 的Map封装
	 * @return 1：成功 0：失败
	 */
	
	public int addMessage(Message message,String organIds);
	
	/**
	 * 获得message表中的所有记录
	 * @return List<Message>
	 */
	public List<Map> getAllMessages();	
	//更新状态
	int updateMessageStatus(int msgId);
	//回复
	int replyMessage(Message record);
	//获取回复详细信息
	List<Map> getReplyMessageInfoByReplyId(int replyId);
 
}
