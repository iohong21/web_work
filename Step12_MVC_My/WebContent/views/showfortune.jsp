<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/showfortune.jsp</title>
	</head>
	<body>
	  <%
	 			String fortuneToday = (String)request.getAttribute("fortuneToday");
	  %>
		<h3>오늘의 운세 페이지</h3>
		<p>오늘의 운세 : <strong><%=fortuneToday %></strong></p>
	</body>
</html>