<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getParameter("url");
	if(url == null) {
		url = request.getContextPath() + "/index.jsp";
	}
	String id = (String)session.getAttribute("id");
	String cPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/users/loginform.jsp</title>
  </head>
  <body>
  	<%if(id == null) {%> 
			<h3>로그인 폼 입니다.</h3>
			<form action="login.jsp?url=<%=url %>" method="post">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" />
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
				<button type="submit">로그인</button>
				<button type="reset" onclick="javascript:location.href='<%=cPath%>'">취소</button>
			</form>
		<%} else {%>
			<script>
				alert("이미 로그인 되었습니다.");
				location.href = "<%=cPath %>/";
			</script>
		<%} %>
  </body>
</html>