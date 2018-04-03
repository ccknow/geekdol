package com.soft863.dolphin.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.web.util.WebUtils;

public class CaptchaFormAuthenticationFilter extends
		BaseFormAuthenticationFilter {
	private String captchaParam = "captcha_key";
	private String flagParam = "flag_key";

	public String getCaptchaParam() {
		return this.captchaParam;
	}

	public String getFlagParam() {
		return this.flagParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	protected String getFlag(ServletRequest request) {
		return WebUtils.getCleanParam(request, getFlagParam());
	}

	protected AuthenticationToken createToken(ServletRequest request,
			ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String captcha = getCaptcha(request);
		String flag = getFlag(request);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		return new CaptchaUsernamePasswordToken(username, password, rememberMe,
				host, captcha, flag);
	}
}
