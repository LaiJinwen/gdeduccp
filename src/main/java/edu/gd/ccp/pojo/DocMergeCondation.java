package edu.gd.ccp.pojo;

public class DocMergeCondation {
	String documentNo,title,schoolType,mergeflag,newDocType;
	Integer documentTaskId;
	public String getDocumentNo() {
		return documentNo;
	}
	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	public String getMergeflag() {
		return mergeflag;
	}
	public void setMergeflag(String mergeflag) {
		this.mergeflag = mergeflag;
	}
	public String getNewDocType() {
		return newDocType;
	}
	public void setNewDocType(String newDocType) {
		this.newDocType = newDocType;
	}
	public Integer getDocumentTaskId() {
		return documentTaskId;
	}
	public void setDocumentTaskId(Integer documentTaskId) {
		this.documentTaskId = documentTaskId;
	}
	@Override
	public String toString() {
		return "DocMergeCondation [documentNo=" + documentNo + ", title=" + title + ", schoolType=" + schoolType
				+ ", mergeflag=" + mergeflag + ", newDocType=" + newDocType + ", documentTaskId=" + documentTaskId
				+ "]";
	}
	
}
