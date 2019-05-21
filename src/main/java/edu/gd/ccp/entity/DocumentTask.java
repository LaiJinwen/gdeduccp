package edu.gd.ccp.entity;

import java.util.Date;

public class DocumentTask {
    private Integer documenttaskid;

    private Integer documenttypeid;

    private String publishuserid;

    private Date deadline;

    private Date publishdate;

    private String title;

    private String documentno;

    private String accessory;

    private String documents;

    private Integer remind;

    public Integer getDocumenttaskid() {
        return documenttaskid;
    }

    public void setDocumenttaskid(Integer documenttaskid) {
        this.documenttaskid = documenttaskid;
    }

    public Integer getDocumenttypeid() {
        return documenttypeid;
    }

    public void setDocumenttypeid(Integer documenttypeid) {
        this.documenttypeid = documenttypeid;
    }

    public String getPublishuserid() {
        return publishuserid;
    }

    public void setPublishuserid(String publishuserid) {
        this.publishuserid = publishuserid == null ? null : publishuserid.trim();
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Date getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(Date publishdate) {
        this.publishdate = publishdate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDocumentno() {
        return documentno;
    }

    public void setDocumentno(String documentno) {
        this.documentno = documentno == null ? null : documentno.trim();
    }

    public String getAccessory() {
        return accessory;
    }

    public void setAccessory(String accessory) {
        this.accessory = accessory == null ? null : accessory.trim();
    }

    public String getDocuments() {
        return documents;
    }

    public void setDocuments(String documents) {
        this.documents = documents == null ? null : documents.trim();
    }

    public Integer getRemind() {
        return remind;
    }

    public void setRemind(Integer remind) {
        this.remind = remind;
    }
}