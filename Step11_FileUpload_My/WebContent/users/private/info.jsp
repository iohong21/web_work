<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/users/private/info.jsp</title>
  </head>
  <body>
		<h3>개인 정보 입니다.</h3>
		<table>
			<thead>
				<tr>
					<th>항목</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<%if(dto != null) {%>
					<tr>
						<td>아이디: &nbsp;&nbsp;</td>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<td>이메일: &nbsp;&nbsp;</td>
						<td><%=dto.getEmail() %></td>
					</tr>
					<tr>						
						<td>가입일: &nbsp;&nbsp;</td>
						<td><%=dto.getRegdate() %></td>
					</tr>
				<%} else {%>
					<tr>
						<td>No &nbsp;&nbsp;</td>
						<td>data</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<br />
		<a href="updateform.jsp">회원정보 수정</a><br /><br />
		<a href="javascript:deleteConfirm();">회원 탈퇴</a>&nbsp;&nbsp;
		<a href="javascript:goHome();">취소</a>
		<script>
			function deleteConfirm() {
				var isDelete = confirm("회원 탈퇴를 하시겠습니까?");
				if(isDelete) {
					location.href = "delete.jsp";
				}
			}
			function goHome() {
				location.href = "<%=request.getContextPath()%>/index.jsp";
			}
		</script>
  </body>
</html>