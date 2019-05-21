package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Message;
import edu.gd.ccp.pojo.MessageList;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer msgid);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer msgid);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
    // 用户发送消息
    int sendMessageToAdmin(Message message);
    
    Integer countMessageNum(@Param("userId")String userId, 
    		@Param("organizationNo")String organizationNo,
			@Param("organizationId")int organizationId,
			@Param("replyId")int replyId);
    //未读消息数
    Integer countUnreadMessageNum(@Param("userId")String userId, 
    		@Param("organizationNo")String organizationNo,
			@Param("organizationId")Integer organizationId,
			@Param("replyId")Integer replyId,@Param("idReadState")String idReadState);
    
    
	List<MessageList> listAllMessage(@Param("offset")int offset, @Param("limit")int limit, 
			@Param("userId")String userId, @Param("organizationNo")String organizationNo,
			@Param("organizationId")int organizationId,
			@Param("replyId")int replyId);

	int updateMessageStatus(int msgId);
	
	// 这里为了在页面显示出回复系列的消息而列出
	List<Map> listReplyMessage(int replyId);
	
	// 这里为了更新消息状态而列出
	List<Message> getReplyMessageByReplyId(int replyId);
    /**
     * 发布消息
     * @param message message 实体
     * @param map 封装了 要通知对象的 NO编号 和 id
     * @return  >1：成功 0：失败
     */
 //    int insertMessages(@Param(value="message")Message message,@Param(value="map") Map<String,String> map);
    
    /**
     * 根据不同的状态查找消息
     * @param state 
     * @return List<Message>
     */
    List<Message> selectMessageWithState(String state);
    
    /**
     * 获取message表中的所有数据
     * @return List<Message>
     */
    List<Map> selectAllMessags();	
	// 获取回复信息，包括用户信息
	List<Map> getReplyMessageInfoByReplyId(int replyId);
    //获取某单位相关的message表中的所有数据，发送或接收到的消息
	List<Map> selectAllMessagsByOrganizationId(Integer organizationId);
	//高校端阅读,
	int schoolUpdateMessageStatus(@Param(value="str1") String str1,@Param(value="str2") String str2,@Param(value="msgId") Integer msgId);
	
}