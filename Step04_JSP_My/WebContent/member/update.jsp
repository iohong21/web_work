<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update.jsp</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			MemberDto dto = new MemberDto(num,name,addr);
			MemberDao.getInstance().update(dto);
		%>
		<p><strong><%=num %></strong> 번 회원의 정보를 수정했습니다.</p>
		<a href="list.jsp">목록보기</a>
	</body>
</html>