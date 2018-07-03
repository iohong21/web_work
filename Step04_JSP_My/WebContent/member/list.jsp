<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>list.jsp</title>
		<link rel="stylesheet" href="../resources/css/bootstrap.css" />
	</head>
	<body>
		<%
			MemberDao dao = MemberDao.getInstance();
			List<MemberDto> lists = dao.getList();
		%>
		<a href="insertform.jsp">회원 추가</a>
		<h3>회원목록 입니다</h3>
		<br />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>성명</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for(MemberDto dto : lists) { %>
					<tr>
						<td><%=dto.getNum() %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getAddr() %></td>
						<td><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></td>
						<td><a href="delete.jsp?num=<%=dto.getNum() %>">삭제</a></td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</body>
</html>