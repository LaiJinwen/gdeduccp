package edu.gd.ccp.pojo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import edu.gd.ccp.entity.Message;

public class MessageList {
	private Integer msgId;

	private Integer replyId;

	private String title;

	private String content;

	private String fromUserId;

	private String fromOrganizationNo;

	private Integer fromOrganizationId;

	private Date sendTime;

	private Date readTime;

	private String toUserId;

	private String state;

	private String toOrganizationNo;

	private Integer toOrganizationId;
	
	private List<Map> messages;
	
	private String userId;
	
	private String userName;
	
	private Date lastReplyTime;

	public Date getLastReplyTime() {
		return lastReplyTime;
	}

	public void setLastReplyTime(Date lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(String fromUserId) {
		this.fromUserId = fromUserId;
	}

	public String getFromOrganizationNo() {
		return fromOrganizationNo;
	}

	public void setFromOrganizationNo(String fromOrganizationNo) {
		this.fromOrganizationNo = fromOrganizationNo;
	}

	public Integer getFromOrganizationId() {
		return fromOrganizationId;
	}

	public void setFromOrganizationId(Integer fromOrganizationId) {
		this.fromOrganizationId = fromOrganizationId;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getReadTime() {
		return readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	public String getToUserId() {
		return toUserId;
	}

	public void setToUserId(String toUserId) {
		this.toUserId = toUserId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getToOrganizationNo() {
		return toOrganizationNo;
	}

	public void setToOrganizationNo(String toOrganizationNo) {
		this.toOrganizationNo = toOrganizationNo;
	}

	public Integer getToOrganizationId() {
		return toOrganizationId;
	}

	public void setToOrganizationId(Integer toOrganizationId) {
		this.toOrganizationId = toOrganizationId;
	}

	public List<Map> getMessages() {
		return messages;
	}

	public void setMessages(List<Map> messages) {
		this.messages = messages;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
