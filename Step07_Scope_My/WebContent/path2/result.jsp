<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/path2/result.jsp</title>
  </head>
  <body>
		<%
			// session 영역 (session scope) 에 myName 이라는 키값으로
			// 저장된 String type 데이터 읽어오기
			String myName = (String)session.getAttribute("myName");
		
		%>
		<%-- 
		<p>세션 영역에 저장된 myName : <strong><%=myName %></strong></p>
		--%>
		<p>세션 영역에 저장된 myName : <strong>${myName}</strong></p>
		<a href="remove.jsp">세션에 저장된 정보 삭제</a>
  </body>
</html>