<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
	</head>
	<body>
		<%
				String id = (String)session.getAttribute("id");
		%>
		<%if(id != null) {%>
			<p><strong><%=id %></strong> 님 로그인중...</p>
			<a href="users/logout.jsp">로그아웃</a>
		<%} else {%>
			<a href="users/loginform.jsp">로그인</a>
		<%} %>
		<h3>인텍스 페이지 입니다.</h3>
		<li><a href="users/signup_form.jsp">회원가입</a></li>
		<li><a href="file/list.jsp">자료실</a></li>
		<li><a href="gallery/list.jsp">사진갤러리</a></li>
	</body>
</html>