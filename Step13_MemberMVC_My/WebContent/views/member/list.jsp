<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/member/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%-- 
		<%
				// 
				List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
		%>
		--%>
		<div class="container">
			<br />
			<a href="insertform.do">회원 추가&nbsp;<i class="glyphicon glyphicon-plus"></i></a>
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
					<%-- 
					<%for(MemberDto dto : list) {%>
						<tr>
							<td><%=dto.getNum() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getAddr() %></td>
							<td><a href="updateform.do?num=<%=dto.getNum() %>">수정</a></td>
							<td><a href="javascript:deleteConfirm(<%=dto.getNum() %>)">삭제</a></td>
						</tr>
					<%} %>
					--%>
					<c:forEach var="dto" items="${list }" >
						<tr>
							<td>${dto.num }</td>
							<td>${dto.name }</td>
							<td>${dto.addr }</td>
							<td><a href="updateform.do?num=${dto.num }">수정</a></td>
							<td><a href="javascript:deleteConfirm(${dto.num })">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%-- 
			<a href="../home.do">home2</a>
			--%>
			<%--
			<a href="<%=request.getContextPath() %>/home.do">home</a>
			--%>
			<a href="${pageContext.request.contextPath }/home.do">home</a>
		</div>
		<script>
			function deleteConfirm(num) {
				var isDelete = confirm(num + " 번 파일을 삭제 하시겠습니까?");
				if(isDelete) {
					location.href = "delete.do?num="+num;
				}
			}
		</script>
	</body>
</html>