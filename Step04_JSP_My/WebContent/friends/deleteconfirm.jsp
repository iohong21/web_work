<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>deleteconfirm.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			FriendsDao dao = FriendsDao.getInstance();
			FriendsDto dto = dao.getData(num);
		%>
		<div class="container">
			<br />
			<h3>친구 정보</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>성명</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=num %></td>
						<td><%=dto.getName() %></td>
						<td><%=dto.getPhone() %></td>
					</tr>
				</tbody>
			</table>
			<strong>친구 정보를 정말로 삭제 하시겠습니까?</strong>&nbsp;&nbsp;&nbsp;
			<button id="btnYes" class="btn btn-danger" type="text">&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;</button>
			&nbsp;&nbsp;
			<button id="btnNo" class="btn btn-info" type="text">아니오</button>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#btnYes").click(function(){
				location.href = "delete.jsp?num=<%=num%>";
			});
			$("#btnNo").click(function(){
				location.href = "list.jsp";
			});
		</script>
	</body>
</html>