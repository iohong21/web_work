<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/member/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%
				// 
				List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
		%>
		<div class="container">
			<a href="insertform.do">회원 추가</a>
			<h3 class="text-center">회원 목록 입니다.</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>주소</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<%for(MemberDto dto : list) {%>
						<tr>
							<td><%=dto.getNum() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getAddr() %></td>
							<td><a href="updateform.do?num=<%=dto.getNum() %>">수정</a></td>
							<td><a href="delete.do?num=<%=dto.getNum() %>">삭제</a></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</body>
</html>