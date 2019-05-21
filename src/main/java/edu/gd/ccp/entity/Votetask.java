package edu.gd.ccp.entity;

import java.util.Date;

public class Votetask {
	private Integer votetaskid;

	private String title;

	private String introduction;

	private Integer candidatenumber;

	private Integer maxchoosenumber;

	private Integer maxvoternumber;

	private Date publishdate;

	private Date deadline;

	private String accessory;
	
	private Integer remind;

	public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}

	public Integer getVotetaskid() {
		return votetaskid;
	}

	public void setVotetaskid(Integer votetaskid) {
		this.votetaskid = votetaskid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction == null ? null : introduction.trim();
	}

	public Integer getCandidatenumber() {
		return candidatenumber;
	}

	public void setCandidatenumber(Integer candidatenumber) {
		this.candidatenumber = candidatenumber;
	}

	public Integer getMaxchoosenumber() {
		return maxchoosenumber;
	}

	public void setMaxchoosenumber(Integer maxchoosenumber) {
		this.maxchoosenumber = maxchoosenumber;
	}

	public Integer getMaxvoternumber() {
		return maxvoternumber;
	}

	public void setMaxvoternumber(Integer maxvoternumber) {
		this.maxvoternumber = maxvoternumber;
	}

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getAccessory() {
		return accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory == null ? null : accessory.trim();
	}
}