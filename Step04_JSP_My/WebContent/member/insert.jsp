<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
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
			String addr=request.getParameter("addr");
			
			MemberDto dto = new MemberDto();
			dto.setName(name);
			dto.setAddr(addr);
			
			MemberDao dao = MemberDao.getInstance();
			dao.insert(dto);
		%>
		<a href="list.jsp">목록 보기</a>
	</body>
</html>