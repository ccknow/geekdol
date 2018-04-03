package com.soft863.dolphin.model;

import com.google.common.collect.Lists;
import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;
import java.util.List;

public class Module extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -4160577957367456494L;
	private Long moduleId;
	private Long parentId;
	private String name;
	private String url;
	private String ordering;
	private Module parent;
	private List<Module> children = Lists.newArrayList();
	private List<Permission> permissions = Lists.newArrayList();

	public Long getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
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

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getOrdering() {
		return this.ordering;
	}

	public void setOrdering(String ordering) {
		this.ordering = ordering;
	}

	public Module getParent() {
		return this.parent;
	}

	public void setParent(Module parent) {
		this.parent = parent;
	}

	public List<Module> getChildren() {
		return this.children;
	}

	public void setChildren(List<Module> children) {
		this.children = children;
	}

	public List<Permission> getPermissions() {
		return this.permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
}
