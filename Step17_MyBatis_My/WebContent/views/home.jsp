<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/home.jsp</title>
	</head>
	<body>
		<h3>홈페이지 입니다.</h3>
		
		<c:if test="${not empty sessionScope.id }">
			<strong><a href="users/private/info.do">${sessionScope.id }</a></strong> 님 로그인중.
			<br />
			<a href="users/logout.do">로그아웃</a>  		
		</c:if>
		
		<ul>
			<%--
			<li><a href="users/signup_form.do">회원가입</a></li>
			--%>
			<li><a href="users/loginform.do">로그인</a></li>
		</ul>		
		
		<ul>
			<li><a href="member/list.do">회원 목록 보기</a></li>
		</ul>
		
		<ul>
			<li><a href="file/list.do">자료실 목록 보기</a></li>
		</ul>
		
		<ul>
			<li><a href="cafe/list.do">카페글 목록 보기</a></li>
		</ul>
		
		
		<h3>오늘의 공지 사항</h3>
		<ul>
			<c:forEach var="tmp" items="${msgs }">
				<li>${tmp }</li>
			</c:forEach>
		</ul>
	</body>
</html>