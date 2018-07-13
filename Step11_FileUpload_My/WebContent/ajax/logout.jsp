<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = (String)session.getAttribute("id");
		session.invalidate();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/ajax/logout.jsp</title>
	</head>
	<body>
		<p><%=id %> 님 로그 아웃 되었습니다.</p>
		<a href="loginform.jsp">로그인 폼</a>
	</body>
</html>