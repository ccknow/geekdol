package com.soft863.dolphin.shiro;

import org.apache.shiro.authc.AuthenticationException;

public class IncorrectCaptchaException extends AuthenticationException {
	private static final long serialVersionUID = 6146451562810994591L;

	public IncorrectCaptchaException() {
	}

	public IncorrectCaptchaException(String message, Throwable cause) {
		super(message, cause);
	}

	public IncorrectCaptchaException(String message) {
		super(message);
	}

	public IncorrectCaptchaException(Throwable cause) {
		super(cause);
	}
}
