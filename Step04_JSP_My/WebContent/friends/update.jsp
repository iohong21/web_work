<%@page import="test.friends.dao.FriendsDao"%>
<%@page import="test.friends.dto.FriendsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			
			FriendsDto oldDto = FriendsDao.getInstance().getData(num);
			
			FriendsDto dto = new FriendsDto(num,name,phone);
			FriendsDao.getInstance().update(dto);
			
			boolean isNotChanged = oldDto.getName().equals(dto.getName()) && oldDto.getPhone().equals(dto.getPhone());
			
			String nameColor = oldDto.getName().equals(dto.getName()) ? "black" : "red";
			String phoneColor = oldDto.getPhone().equals(dto.getPhone()) ? "black" : "red";
			
			if(isNotChanged) {
				response.sendRedirect("list.jsp");
			}
		%>
		
		<div class="container">
			<br />
			<!--  <h3 class="text-center">친구 정보</h3>  -->
			<p class="text-center" style="font-size: 25px;">친구 정보</p>
			<br />
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan=3 style="text-align: center;">변경 전</th>
						<th></th>
						<th colspan=3 style="text-align: center;">변경 후</th>
					</tr>
					<tr>
						<th>번호</th>
						<th>성명</th>
						<th>전화번호</th>
						<th style="text-align: center;">>>></th>
						<th>번호</th>
						<th>성명</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr></tr>
					<tr>
						<td><%=num %></td>
						<td><%=oldDto.getName() %></td>
						<td><%=oldDto.getPhone() %></td>
						<td></td>
						<td><%=num %></td>
						<td style="color:<%=nameColor %>"><%=dto.getName() %></td>
						<td style="color: <%=phoneColor %>"><%=dto.getPhone() %></td>
					</tr>
				</tbody>
			</table>

			<strong><%=num %></strong> 번 친구의 정보를 수정했습니다.&nbsp;&nbsp;
			<button class="btn btn-primary" id="btnList">목록보기</button>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#btnList").click(function(){
				location.href = "list.jsp";
			});
		</script>
	</body>
</html>