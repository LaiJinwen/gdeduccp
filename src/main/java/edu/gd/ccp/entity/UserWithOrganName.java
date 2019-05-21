package edu.gd.ccp.entity;

import java.io.Serializable;

public class UserWithOrganName implements Serializable {
	  /**
		 * 
		 */
		private static final long serialVersionUID = -2616220505586998527L;
		
		private String organizationName;

		private String userid;

	    private String username;

	    private String password;

	    private String usertype;

	    private String sex;

	    private String mobile;

	    private String email;

	    private Integer organizationid;

	    private String position;

	    private String photo;
	    
		public String getOrganizationName() {
			return organizationName;
		}

		public void setOrganizationName(String organizationName) {
			this.organizationName = organizationName;
		}


	    public String getUserid() {
	        return userid;
	    }

	    public void setUserid(String userid) {
	        this.userid = userid == null ? null : userid.trim();
	    }

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username == null ? null : username.trim();
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password == null ? null : password.trim();
	    }

	    public String getUsertype() {
	        return usertype;
	    }

	    public void setUsertype(String usertype) {
	        this.usertype = usertype == null ? null : usertype.trim();
	    }

	    public String getSex() {
	        return sex;
	    }

	    public void setSex(String sex) {
	        this.sex = sex == null ? null : sex.trim();
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

	    public Integer getOrganizationid() {
	        return organizationid;
	    }

	    public void setOrganizationid(Integer organizationid) {
	        this.organizationid = organizationid;
	    }

	    public String getPosition() {
	        return position;
	    }

	    public void setPosition(String position) {
	        this.position = position == null ? null : position.trim();
	    }

	    public String getPhoto() {
	        return photo;
	    }

	    public void setPhoto(String photo) {
	        this.photo = photo == null ? null : photo.trim();
	    }
}
