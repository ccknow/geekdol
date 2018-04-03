package com.soft863.dolphin.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

public class CaptchaUsernamePasswordToken extends UsernamePasswordToken {
	private static final long serialVersionUID = -3178260335127476542L;
	private String captcha;
	private String flag;

	public String getCaptcha() {
		return this.captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public CaptchaUsernamePasswordToken() {
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public CaptchaUsernamePasswordToken(String username, String password,
			boolean rememberMe, String host, String captcha, String flag) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
		this.flag = flag;
	}
}
