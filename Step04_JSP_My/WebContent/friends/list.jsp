<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@page import="java.util.List"%>
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
			FriendsDao dao = FriendsDao.getInstance();
			List<FriendsDto> lists = dao.getList();
		%>
		<div class="container">
			<br />
			<%-- <h3 class="text-center">친구 목록</h3> --%>
			<p class="text-center" style="font-size: 25px;">친구 목록</p>
			<h4 class="text-right"><a href="insertform.jsp">친구 추가</a></h4>
			<!-- 
			<div class="row">
				<div class="col-6"></div>
				<div class="col-2">
					<h4 class="text-right"><a href="insertform.jsp">친구 추가</a></h4>
				</div>
				<div class="col-4"></div>
			</div>
			 -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>성명</th>
						<th>전화번호</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<% for(FriendsDto dto : lists) { %>
						<tr>
							<td><%=dto.getNum() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getPhone() %></td>
							<td><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></td>
							<td><a href="deleteconfirm.jsp?num=<%=dto.getNum() %>">삭제</a></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			<p>검색건수: <%=lists.size() %>건</p>
		</div>
	</body>
</html>