<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	if(fileName == null) {
		fileName = "";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<img src="<%=fileName %>" alt="" />
		<a href="javascript: self.close()">닫기</a>
	</body>
</html>