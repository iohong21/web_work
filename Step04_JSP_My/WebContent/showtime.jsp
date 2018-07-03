<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>showtime.jsp</title>
	</head>
	<body>
		<h3>현재 시간 페이지 입니다</h3>
		<% Date d = new Date(); %>
		<p>현재 시간: <strong><% out.println(d.toString()); %></strong></p>
	</body>
</html>