package com.soft863.dolphin.model;

import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;

public class UserRole extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -4160577957367456494L;
	private Long userId;
	private Long roleId;

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}
