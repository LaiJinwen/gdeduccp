package edu.gd.ccp.entity;

import java.util.Date;

public class MeetingAttendees {
    private Integer attendeeid;

    private Integer taskid;

    private String organizationno;

    private String attendeename;

    private String email;

    private String telephone;

    private String sex;

    private String duty;

    private String department;

    private String jobtitle;

    private String invoicecontent;

    private String address;

    private String postcode;

    private String stay;

    private Date staystart;

    private Date stayend;

    private String note;

    private Date regtime;

    public Integer getAttendeeid() {
        return attendeeid;
    }

    public void setAttendeeid(Integer attendeeid) {
        this.attendeeid = attendeeid;
    }

    public Integer getTaskid() {
        return taskid;
    }

    public void setTaskid(Integer taskid) {
        this.taskid = taskid;
    }

    public String getOrganizationno() {
        return organizationno;
    }

    public void setOrganizationno(String organizationno) {
        this.organizationno = organizationno == null ? null : organizationno.trim();
    }

    public String getAttendeename() {
        return attendeename;
    }

    public void setAttendeename(String attendeename) {
        this.attendeename = attendeename == null ? null : attendeename.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty == null ? null : duty.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle == null ? null : jobtitle.trim();
    }

    public String getInvoicecontent() {
        return invoicecontent;
    }

    public void setInvoicecontent(String invoicecontent) {
        this.invoicecontent = invoicecontent == null ? null : invoicecontent.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getStay() {
        return stay;
    }

    public void setStay(String stay) {
        this.stay = stay == null ? null : stay.trim();
    }

    public Date getStaystart() {
        return staystart;
    }

    public void setStaystart(Date staystart) {
        this.staystart = staystart;
    }

    public Date getStayend() {
        return stayend;
    }

    public void setStayend(Date stayend) {
        this.stayend = stayend;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }
}