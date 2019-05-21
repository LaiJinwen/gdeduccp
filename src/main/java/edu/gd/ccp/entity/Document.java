package edu.gd.ccp.entity;

import java.util.Date;

public class Document {
	private Integer documentid;

	private Integer documenttaskid;

	private Integer documenttypeid;

	private String documentno;

	private String title;

	private Date submitdate;

	private Integer organizationid;

	private String organizationno;

	private String submituserid;

	private String documentstate;

	private Integer remind;

	private String approvalresult;

	private String suggest;

	private String approveruserid;

	private Date approvaldate;

	private String accessory;

	private String templateaccessory;

	public Integer getDocumentid() {
		return documentid;
	}

	public void setDocumentid(Integer documentid) {
		this.documentid = documentid;
	}

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

	public String getDocumentno() {
		return documentno;
	}

	public void setDocumentno(String documentno) {
		this.documentno = documentno == null ? null : documentno.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Date getSubmitdate() {
		return submitdate;
	}

	public void setSubmitdate(Date submitdate) {
		this.submitdate = submitdate;
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

	public String getSubmituserid() {
		return submituserid;
	}

	public void setSubmituserid(String submituserid) {
		this.submituserid = submituserid == null ? null : submituserid.trim();
	}

	public String getDocumentstate() {
		return documentstate;
	}

	public void setDocumentstate(String documentstate) {
		this.documentstate = documentstate == null ? null : documentstate.trim();
	}

	public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}

	public String getApprovalresult() {
		return approvalresult;
	}

	public void setApprovalresult(String approvalresult) {
		this.approvalresult = approvalresult == null ? null : approvalresult.trim();
	}

	public String getSuggest() {
		return suggest;
	}

	public void setSuggest(String suggest) {
		this.suggest = suggest == null ? null : suggest.trim();
	}

	public String getApproveruserid() {
		return approveruserid;
	}

	public void setApproveruserid(String approveruserid) {
		this.approveruserid = approveruserid == null ? null : approveruserid.trim();
	}

	public Date getApprovaldate() {
		return approvaldate;
	}

	public void setApprovaldate(Date approvaldate) {
		this.approvaldate = approvaldate;
	}

	public String getAccessory() {
		return accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory == null ? null : accessory.trim();
	}

	public String getTemplateaccessory() {
		return templateaccessory;
	}

	public void setTemplateaccessory(String templateaccessory) {
		this.templateaccessory = templateaccessory == null ? null : templateaccessory.trim();
	}
}