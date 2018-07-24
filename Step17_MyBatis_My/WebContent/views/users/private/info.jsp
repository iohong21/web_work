<%@page import="test.dao.UsersDao"%>
<%@page import="test.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<c:choose>
					<c:when test="${not empty dto }">
						<tr>
							<td>아이디: &nbsp;&nbsp;</td>
							<td>${dto.id}</td>
						</tr>
						<tr>
							<td>이메일: &nbsp;&nbsp;</td>
							<td>${dto.email }</td>
						</tr>
						<tr>						
							<td>가입일: &nbsp;&nbsp;</td>
							<td>${dto.regdate }</td>
						</tr>					
					</c:when>
					<c:otherwise>
						<tr>
							<td>No &nbsp;&nbsp;</td>
							<td>data</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br />
		<a href="updateform.do">회원정보 수정</a><br /><br />
		<a href="javascript:deleteConfirm();">회원 탈퇴</a>&nbsp;&nbsp;
		<a href="javascript:goHome();">취소</a>
		<script>
			function deleteConfirm() {
				var isDelete = confirm("회원 탈퇴를 하시겠습니까?");
				if(isDelete) {
					location.href = "delete.do";
				}
			}
			function goHome() {
				location.href = "${pageContext.request.contextPath }/index.jsp";
			}
		</script>
  </body>
</html>