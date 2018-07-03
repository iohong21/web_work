<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insert.jsp</title>
	</head>
	<body>
		<%
			// post 방식 전송 파라미터 한글 인코딩 설정
			request.setCharacterEncoding("utf-8");
		
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			FriendsDto dto = new FriendsDto();
			dto.setName(name);
			dto.setPhone(phone);
			
			FriendsDao dao = FriendsDao.getInstance();
			dao.insert(dto);
			response.sendRedirect("list.jsp");
		%>
		<%--
		<a href="list.jsp">목록 보기</a>
		 --%>
	</body>
</html>