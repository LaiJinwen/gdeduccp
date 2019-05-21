package edu.gd.ccp.entity;

import java.util.Date;

public class Message {
    private Integer msgid;
    
    private Integer replyid;

    private String title;

    private String content;

    private String fromuserid;

    private String fromorganizationno;

    private Integer fromorganizationid;

    private Date sendtime;

    private Date readtime;

    private String touserid;

    private String state;

    private String toorganizationno;

    private Integer toorganizationid;
    private String toorganizationnos;
    private String toorganizationids;
    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }
    
    public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getFromuserid() {
        return fromuserid;
    }

    public void setFromuserid(String fromuserid) {
        this.fromuserid = fromuserid == null ? null : fromuserid.trim();
    }

    public String getFromorganizationno() {
        return fromorganizationno;
    }

    public void setFromorganizationno(String fromorganizationno) {
        this.fromorganizationno = fromorganizationno == null ? null : fromorganizationno.trim();
    }

    public Integer getFromorganizationid() {
        return fromorganizationid;
    }

    public void setFromorganizationid(Integer fromorganizationid) {
        this.fromorganizationid = fromorganizationid;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Date getReadtime() {
        return readtime;
    }

    public void setReadtime(Date readtime) {
        this.readtime = readtime;
    }

    public String getTouserid() {
        return touserid;
    }

    public void setTouserid(String touserid) {
        this.touserid = touserid == null ? null : touserid.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getToorganizationno() {
        return toorganizationno;
    }

    public void setToorganizationno(String toorganizationno) {
        this.toorganizationno = toorganizationno == null ? null : toorganizationno.trim();
    }

    public Integer getToorganizationid() {
        return toorganizationid;
    }

    public void setToorganizationid(Integer toorganizationid) {
        this.toorganizationid = toorganizationid;
    }

	public String getToorganizationnos() {
		return toorganizationnos;
	}

	public void setToorganizationnos(String toorganizationnos) {
		this.toorganizationnos = toorganizationnos;
	}

	public String getToorganizationids() {
		return toorganizationids;
	}

	public void setToorganizationids(String toorganizationids) {
		this.toorganizationids = toorganizationids;
	}
    
}