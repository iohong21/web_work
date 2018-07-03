<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>test04.jsp</title>
		<link rel="stylesheet" href="css/bootstrap.css" />
	</head>
	<body>
		<%
			List<MemberDto> members = new ArrayList<>();
			members.add(new MemberDto(1, "김구라", "노량진"));
			members.add(new MemberDto(2, "해골", "행신동"));
			members.add(new MemberDto(3, "원숭이", "상도동"));
		%>
	</body>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto dto : members) {%>
				<tr>
					<td><%=dto.getNum() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getAddr() %></td>
				</tr>
			<%} %>
			
			<%for(MemberDto dto : members) {
				out.print("<tr>");
				out.print("<td>"+dto.getNum()+"</td>");
				out.print("<td>"+dto.getName()+"</td>");
				out.print("<td>"+dto.getAddr()+"</td>");
				out.print("</tr>");
			}%>
		</tbody>
	</table>
</html>