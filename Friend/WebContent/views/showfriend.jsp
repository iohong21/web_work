<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>친구 목록</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<div class="container">
			<h3 class="text-center">친구 목록</h3><br />
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>성명</th>
						<th>전화번호</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="friend" items="${dto}">
						<tr>
							<td>${friend.num }</td>
							<td>${friend.name }</td>
							<td>${friend.phone }</td>
							<td>${friend.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>
