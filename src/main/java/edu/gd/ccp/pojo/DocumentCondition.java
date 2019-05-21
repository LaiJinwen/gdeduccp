package edu.gd.ccp.pojo;

public class DocumentCondition {
	String documentNo;
	String title;
	String documentType;
	String schoolName;
	String schoolType;//学校类型
    String documentState;//文档状态
    String schoolLevel;//办学层次
    String belong;//组织关系
	public String getSchoolLevel() {
		return schoolLevel;
	}
	public void setSchoolLevel(String schoolLevel) {
		this.schoolLevel = schoolLevel;
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
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
	public String getDocumentType() {
		return documentType;
	}
	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	
	public String getDocumentState() {
		return documentState;
	}
	public void setDocumentState(String documentState) {
		this.documentState = documentState;
	}
	@Override
	public String toString() {
		return "DocumentCondition [documentNo=" + documentNo + ", title=" + title + ", documentType=" + documentType
				+ ", schoolName=" + schoolName + ", schoolType=" + schoolType + ", documentState=" + documentState
				+ ", schoolLevel=" + schoolLevel + ", belong=" + belong + "]";
	}
 

}
