<%@page import="test.util.myUtil"%>
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
				String cPath = request.getContextPath();
				
				String myUrl = new myUtil().getCurrentPage(request);
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
		<li><a href="ajax/loginform.jsp">ajax 로그인</a></li>
		<li><a href="ajax2/loginform.jsp?url=<%=myUrl%>">ajax 로그인2</a></li>
		<li><a href="ajax3/upload_form.jsp">ajax 파일 업로드</a></li>
		<li><a href="dragdrop/test1.jsp">drag 테스트1</a></li>
		<li><a href="dragdrop/test2.jsp">drag 테스트2</a></li>
		<li><a href="dropzone/upload_form.jsp">drop_zone 테스트</a></li>
		<li><a href="dragdrop/test3.html"></a></li>
	</body>
</html>