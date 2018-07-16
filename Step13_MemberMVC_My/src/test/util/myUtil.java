package test.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class myUtil {
	public String getCurrentPage(HttpServletRequest request) {

		String cPath = request.getContextPath();
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		String myUrl = cPath + "/" + pageName;
		
		return myUrl;
	}
	
	public String getCurrentTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String currTime = sdf.format(new Date());
		
		return currTime;
	}
}
