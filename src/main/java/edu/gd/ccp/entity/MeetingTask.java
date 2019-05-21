package edu.gd.ccp.entity;

public class MeetingTask {
    private Integer taskid;

    private String meetingno;

    private Integer meetingid;

    private Integer organizationid;

    private String organizationno;

    private String attendancestate;

    private Integer attendeenumber;

    private String contacts;

    private String mobile;

    private String email;

    private Integer remind;
    
    public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}

	public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public String getMeetingno() {
        return meetingno;
    }

    public void setMeetingno(String meetingno) {
        this.meetingno = meetingno == null ? null : meetingno.trim();
    }

    public Integer getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    public Integer getOrganizationid() {
        return organizationid;
    }

    public void setOrganizationid(Integer organizationid) {
        this.organizationid = organizationid;
    }

    public String getOrganizationno() {
        return organizationno;
    }

    public void setOrganizationno(String organizationno) {
        this.organizationno = organizationno == null ? null : organizationno.trim();
    }

    public String getAttendancestate() {
        return attendancestate;
    }

    public void setAttendancestate(String attendancestate) {
        this.attendancestate = attendancestate == null ? null : attendancestate.trim();
    }

    public Integer getAttendeenumber() {
        return attendeenumber;
    }

    public void setAttendeenumber(Integer attendeenumber) {
        this.attendeenumber = attendeenumber;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }
}