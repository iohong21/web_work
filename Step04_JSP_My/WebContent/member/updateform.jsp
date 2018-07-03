<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>updateform.jsp</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.getData(num);
		%>
		<form action="update.jsp" method="post">
			<label for="num">번호</label>
			<input type="hidden" name="num" id="num" value="<%=num %>" />
			<input type="text" value="<%=num %>" disabled/><br />
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=dto.getName() %>" /><br />
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" value="<%=dto.getAddr() %>" /><br />
			<button type="text">수정확인</button>
		</form>
	</body>
</html>