<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/cafe/listdetail.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<div class="container">
			<c:choose>
				<c:when test="${not empty id }">
					<span class="badge badge-secondary">글번호: </span>${dto.num }
					<br />
					<span class="badge badge-secondary">작성자: </span>${dto.writer }
					<br />
					<span class="badge badge-secondary">글제목: </span>${dto.title }
					<br />
					<span class="badge badge-secondary">작성일: </span>${dto.regdate }
					<br />
					<span class="badge badge-secondary">글내용: </span>${dto.content }
					<br />
				</c:when>
				<c:otherwise>
					<p>로그인을 해야만 글을 볼 수 있습니다.</p>
					<a href="list.do">글 목록 보기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>