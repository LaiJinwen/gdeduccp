package edu.gd.ccp.entity;

import java.util.Date;

public class Meeting {
    private Integer meetingid;

    private String meetingno;

    private Integer meetingtypeid;

    private String publishuserid;

    private Date meetingtime;

    private String meetingaddresses;

    private Date publishdate;

    private Date enrolldeadline;

    private String meetingtitle;

    private String accessory1;

    private String accessory2;

    private String accessory3;

    private String accessory4;

    private String accessory5;

    private String accessory6;

    private Byte email;

    private Byte telephone;

    private Byte sex;

    private Byte duty;

    private Byte jobtitle;

    private Byte department;

    private Byte invoicecontent;

    private Byte address;

    private Byte postcode;

    private Byte stay;

    private Byte staystart;

    private Byte stayend;

    private Byte note;

    private String meetingcontent;

    public Integer getMeetingid() {
        return meetingid;
    }

    public void setMeetingid(Integer meetingid) {
        this.meetingid = meetingid;
    }

    public String getMeetingno() {
        return meetingno;
    }

    public void setMeetingno(String meetingno) {
        this.meetingno = meetingno == null ? null : meetingno.trim();
    }

    public Integer getMeetingtypeid() {
        return meetingtypeid;
    }

    public void setMeetingtypeid(Integer meetingtypeid) {
        this.meetingtypeid = meetingtypeid;
    }

    public String getPublishuserid() {
        return publishuserid;
    }

    public void setPublishuserid(String publishuserid) {
        this.publishuserid = publishuserid == null ? null : publishuserid.trim();
    }

    public Date getMeetingtime() {
        return meetingtime;
    }

    public void setMeetingtime(Date meetingtime) {
        this.meetingtime = meetingtime;
    }

    public String getMeetingaddresses() {
        return meetingaddresses;
    }

    public void setMeetingaddresses(String meetingaddresses) {
        this.meetingaddresses = meetingaddresses == null ? null : meetingaddresses.trim();
    }

    public Date getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(Date publishdate) {
        this.publishdate = publishdate;
    }

    public Date getEnrolldeadline() {
        return enrolldeadline;
    }

    public void setEnrolldeadline(Date enrolldeadline) {
        this.enrolldeadline = enrolldeadline;
    }

    public String getMeetingtitle() {
        return meetingtitle;
    }

    public void setMeetingtitle(String meetingtitle) {
        this.meetingtitle = meetingtitle == null ? null : meetingtitle.trim();
    }

    public String getAccessory1() {
        return accessory1;
    }

    public void setAccessory1(String accessory1) {
        this.accessory1 = accessory1 == null ? null : accessory1.trim();
    }

    public String getAccessory2() {
        return accessory2;
    }

    public void setAccessory2(String accessory2) {
        this.accessory2 = accessory2 == null ? null : accessory2.trim();
    }

    public String getAccessory3() {
        return accessory3;
    }

    public void setAccessory3(String accessory3) {
        this.accessory3 = accessory3 == null ? null : accessory3.trim();
    }

    public String getAccessory4() {
        return accessory4;
    }

    public void setAccessory4(String accessory4) {
        this.accessory4 = accessory4 == null ? null : accessory4.trim();
    }

    public String getAccessory5() {
        return accessory5;
    }

    public void setAccessory5(String accessory5) {
        this.accessory5 = accessory5 == null ? null : accessory5.trim();
    }

    public String getAccessory6() {
        return accessory6;
    }

    public void setAccessory6(String accessory6) {
        this.accessory6 = accessory6 == null ? null : accessory6.trim();
    }

    public Byte getEmail() {
        return email;
    }

    public void setEmail(Byte email) {
        this.email = email;
    }

    public Byte getTelephone() {
        return telephone;
    }

    public void setTelephone(Byte telephone) {
        this.telephone = telephone;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Byte getDuty() {
        return duty;
    }

    public void setDuty(Byte duty) {
        this.duty = duty;
    }

    public Byte getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(Byte jobtitle) {
        this.jobtitle = jobtitle;
    }

    public Byte getDepartment() {
        return department;
    }

    public void setDepartment(Byte department) {
        this.department = department;
    }

    public Byte getInvoicecontent() {
        return invoicecontent;
    }

    public void setInvoicecontent(Byte invoicecontent) {
        this.invoicecontent = invoicecontent;
    }

    public Byte getAddress() {
        return address;
    }

    public void setAddress(Byte address) {
        this.address = address;
    }

    public Byte getPostcode() {
        return postcode;
    }

    public void setPostcode(Byte postcode) {
        this.postcode = postcode;
    }

    public Byte getStay() {
        return stay;
    }

    public void setStay(Byte stay) {
        this.stay = stay;
    }

    public Byte getStaystart() {
        return staystart;
    }

    public void setStaystart(Byte staystart) {
        this.staystart = staystart;
    }

    public Byte getStayend() {
        return stayend;
    }

    public void setStayend(Byte stayend) {
        this.stayend = stayend;
    }

    public Byte getNote() {
        return note;
    }

    public void setNote(Byte note) {
        this.note = note;
    }

    public String getMeetingcontent() {
        return meetingcontent;
    }

    public void setMeetingcontent(String meetingcontent) {
        this.meetingcontent = meetingcontent == null ? null : meetingcontent.trim();
    }
}