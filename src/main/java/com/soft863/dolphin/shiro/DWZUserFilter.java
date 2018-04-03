package com.soft863.dolphin.shiro;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;

public class DWZUserFilter extends UserFilter {
	public static final String X_R = "X-Requested-With";
	public static final String X_R_VALUE = "XMLHttpRequest";

	protected void redirectToLogin(ServletRequest request,
			ServletResponse response) throws IOException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String xrv = httpServletRequest.getHeader("X-Requested-With");
		if ((xrv != null) && (xrv.equalsIgnoreCase("XMLHttpRequest"))) {
			Map<String, String> queryParams = new HashMap<String, String>();
			queryParams.put("ajax", "true");
			WebUtils.issueRedirect(request, response, getLoginUrl(),
					queryParams);
		} else {
			super.redirectToLogin(request, response);
		}
	}
}
