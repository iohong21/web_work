package test.util;

import javax.servlet.http.HttpServletRequest;

public class myUtil {
	public String getCurrentPage(HttpServletRequest request) {

		String cPath = request.getContextPath();
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		String myUrl = cPath + "/" + pageName;
		
		return myUrl;
	}
}
