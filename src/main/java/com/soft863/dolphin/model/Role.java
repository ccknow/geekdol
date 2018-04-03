package com.soft863.dolphin.model;

import com.google.common.collect.Lists;
import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;
import java.util.List;

public class Role extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -4160577957367456494L;
	private Long roleId;
	private String name;
	private String description;
	private String ordering;
	private List<Permission> permissions = Lists.newArrayList();

	public Long getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOrdering() {
		return this.ordering;
	}

	public void setOrdering(String ordering) {
		this.ordering = ordering;
	}

	public List<Permission> getPermissions() {
		return this.permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
}
