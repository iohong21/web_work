<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>    
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			// 아이디 저장 여부
			String isSave = request.getParameter("isSave");
			
			if(isSave != null) {
				Cookie cook = new Cookie("saveId", id);
				cook.setMaxAge(60*60*24);
				response.addCookie(cook);
			}
		%>    
		<p><strong><%=id %></strong> 님 로그인 되었습니다.</p>
		<a href="../index.jsp">확인</a>
	</body>
</html>
