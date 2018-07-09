<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/read_cookie.jsp</title>
</head>
<body>
	<%
		Cookie[] cooks = request.getCookies();
		String savedMsg=null;
		if(cooks != null && cooks.length > 0) {
			for(Cookie tmp : cooks) {
				if(tmp.getName().equals("savedMsg")) {
					savedMsg=tmp.getValue();
				}
			}
		}
	%>
</body>
</html>