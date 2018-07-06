<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/market/buy3.jsp</title>
  </head>
  <body>
  	<%if(id == null) {
			String cPath = request.getContextPath();
			response.sendRedirect(cPath + "/users/loginform.jsp?url="+cPath+"/market/buy.jsp"); 
  	} %>
		<h3>물품 구매 페이지</h3>
		<a href="">구입 하기 3</a>
  </body>
</html>