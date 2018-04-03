package com.soft863.dolphin.model;

import com.google.common.collect.Lists;
import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;
import java.util.List;

public class Organization extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -5128696307983782374L;
	private Long orgId;
	private Long parentId;
	private String name;
	private String description;
	private Organization parent;
	private List<Organization> children = Lists.newArrayList();

	public Long getOrgId() {
		return this.orgId;
	}

	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

	public Long getParentId() {
		return this.parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
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

	public Organization getParent() {
		return this.parent;
	}

	public void setParent(Organization parent) {
		this.parent = parent;
	}

	public List<Organization> getChildren() {
		return this.children;
	}

	public void setChildren(List<Organization> children) {
		this.children = children;
	}
}
