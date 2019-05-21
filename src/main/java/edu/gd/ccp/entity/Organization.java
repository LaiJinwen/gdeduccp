package edu.gd.ccp.entity;

public class Organization {
    private Integer organizationid;

    private String organizationno;

    private String organizationname;

    private String supervisordepartment;

    private String supervisortype;

    private String belong;

    private String schoollevel;

    private String organizationtype;

    private String address;

    private String telephone;

    private String faxno;

    private String postcode;

    private String note;

    private String taxpayerid;

    private String invoicename;

    private Integer numberofstudent;

    private Integer numberofteacher;

    private Integer numberofstudentpartymember;

    private Integer numberofteacherpartymember;

    private Integer numberofretirepartymember;

    private Integer numberofsecondpartyorganization;

    private Integer numberofteacherpartybranch;

    private Integer numberofstudentpartybranch;

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

    public String getOrganizationname() {
        return organizationname;
    }

    public void setOrganizationname(String organizationname) {
        this.organizationname = organizationname == null ? null : organizationname.trim();
    }

    public String getSupervisordepartment() {
        return supervisordepartment;
    }

    public void setSupervisordepartment(String supervisordepartment) {
        this.supervisordepartment = supervisordepartment == null ? null : supervisordepartment.trim();
    }

    public String getSupervisortype() {
        return supervisortype;
    }

    public void setSupervisortype(String supervisortype) {
        this.supervisortype = supervisortype == null ? null : supervisortype.trim();
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong == null ? null : belong.trim();
    }

    public String getSchoollevel() {
        return schoollevel;
    }

    public void setSchoollevel(String schoollevel) {
        this.schoollevel = schoollevel == null ? null : schoollevel.trim();
    }

    public String getOrganizationtype() {
        return organizationtype;
    }

    public void setOrganizationtype(String organizationtype) {
        this.organizationtype = organizationtype == null ? null : organizationtype.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getFaxno() {
        return faxno;
    }

    public void setFaxno(String faxno) {
        this.faxno = faxno == null ? null : faxno.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getTaxpayerid() {
        return taxpayerid;
    }

    public void setTaxpayerid(String taxpayerid) {
        this.taxpayerid = taxpayerid == null ? null : taxpayerid.trim();
    }

    public String getInvoicename() {
        return invoicename;
    }

    public void setInvoicename(String invoicename) {
        this.invoicename = invoicename == null ? null : invoicename.trim();
    }

    public Integer getNumberofstudent() {
        return numberofstudent;
    }

    public void setNumberofstudent(Integer numberofstudent) {
        this.numberofstudent = numberofstudent;
    }

    public Integer getNumberofteacher() {
        return numberofteacher;
    }

    public void setNumberofteacher(Integer numberofteacher) {
        this.numberofteacher = numberofteacher;
    }

    public Integer getNumberofstudentpartymember() {
        return numberofstudentpartymember;
    }

    public void setNumberofstudentpartymember(Integer numberofstudentpartymember) {
        this.numberofstudentpartymember = numberofstudentpartymember;
    }

    public Integer getNumberofteacherpartymember() {
        return numberofteacherpartymember;
    }

    public void setNumberofteacherpartymember(Integer numberofteacherpartymember) {
        this.numberofteacherpartymember = numberofteacherpartymember;
    }

    public Integer getNumberofretirepartymember() {
        return numberofretirepartymember;
    }

    public void setNumberofretirepartymember(Integer numberofretirepartymember) {
        this.numberofretirepartymember = numberofretirepartymember;
    }

    public Integer getNumberofsecondpartyorganization() {
        return numberofsecondpartyorganization;
    }

    public void setNumberofsecondpartyorganization(Integer numberofsecondpartyorganization) {
        this.numberofsecondpartyorganization = numberofsecondpartyorganization;
    }

    public Integer getNumberofteacherpartybranch() {
        return numberofteacherpartybranch;
    }

    public void setNumberofteacherpartybranch(Integer numberofteacherpartybranch) {
        this.numberofteacherpartybranch = numberofteacherpartybranch;
    }

    public Integer getNumberofstudentpartybranch() {
        return numberofstudentpartybranch;
    }

    public void setNumberofstudentpartybranch(Integer numberofstudentpartybranch) {
        this.numberofstudentpartybranch = numberofstudentpartybranch;
    }
}