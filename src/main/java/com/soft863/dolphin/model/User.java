package com.soft863.dolphin.model;

import com.google.common.collect.Lists;
import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;
import java.util.List;

public class User extends CommonEntity implements Serializable {
	private static final long serialVersionUID = 5435766581335783802L;
	private Long userId;
	private Long userInfoId;
	private String username;
	private String realname;
	private String password;
	private String phone;
	private String email;
	private String description;
	private String repasswdTime;
	private Organization organization;
	private List<Role> userRoles = Lists.newArrayList();

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserInfoId() {
		return this.userInfoId;
	}

	public void setUserInfoId(Long userInfoId) {
		this.userInfoId = userInfoId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Organization getOrganization() {
		return this.organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<Role> getUserRoles() {
		return this.userRoles;
	}

	public void setUserRoles(List<Role> userRoles) {
		this.userRoles = userRoles;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRepasswdTime() {
		return this.repasswdTime;
	}

	public void setRepasswdTime(String repasswdTime) {
		this.repasswdTime = repasswdTime;
	}
}
