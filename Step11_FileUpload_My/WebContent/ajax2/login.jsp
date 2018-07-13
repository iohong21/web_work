<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		boolean isSuccess = UsersDao.getInstance().isValid(id, pwd);
		if(isSuccess) {
			session.setAttribute("id", id);
		}
%>
{"isSuccess":<%=isSuccess%>}
    
<%--     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
	
	</body>
</html>
--%>