package com.soft863.dolphin.model;

import com.soft863.dolphin.common.CommonEntity;
import java.io.Serializable;

public class RolePermission extends CommonEntity implements Serializable {
	private static final long serialVersionUID = -7230054500541351498L;
	private Long roleId;
	private Long perId;

	public Long getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getPerId() {
		return this.perId;
	}

	public void setPerId(Long perId) {
		this.perId = perId;
	}
}
