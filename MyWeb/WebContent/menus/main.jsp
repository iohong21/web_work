<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
  	<%
  			request.setAttribute("menu", "login");
  	%>
		<jsp:include page="navbar.jsp" flush="true" />
	</body>
</html>
