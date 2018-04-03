package com.soft863.dolphin.shiro;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class BaseFormAuthenticationFilter extends FormAuthenticationFilter {
	private static final Logger log = LoggerFactory.getLogger(BaseFormAuthenticationFilter.class);
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		if (log.isDebugEnabled()) {
			Class<?> clazz = e.getClass();
			clazz.equals(AuthenticationException.class);
		}
		return super.onLoginFailure(token, e, request, response);
	}

	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) {
		try {
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return false;
			}
		} catch (Exception localException) {
		}
		return super.isAccessAllowed(request, response, mappedValue);
	}

	protected boolean onLoginSuccess(AuthenticationToken token,Subject subject, ServletRequest request, ServletResponse response)
			throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		if ((!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest
				.getHeader("X-Requested-With")))
				|| (request.getParameter("ajax") == null)) {
			httpServletResponse.sendRedirect(httpServletRequest
					.getContextPath() + getSuccessUrl());
		} else {
			httpServletResponse.sendRedirect(httpServletRequest
					.getContextPath() + "/login/timeout/success");
		}
		return false;
	}
}