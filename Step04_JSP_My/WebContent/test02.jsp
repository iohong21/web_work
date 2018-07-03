<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jsp 테스트</h3>
	<%
		MemberDto dto = new MemberDto(1, "김구라", "노량진");
	%>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=dto.getNum() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.toArray()[2] %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>