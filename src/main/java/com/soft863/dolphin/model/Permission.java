package com.soft863.dolphin.model;

import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;

public class Permission extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -4160577957367456494L;
	private Long perId;
	private Long moduleId;
	private String name;
	private String value;
	private Module module;

	public Long getPerId() {
		return this.perId;
	}

	public void setPerId(Long perId) {
		this.perId = perId;
	}

	public Long getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}
}
