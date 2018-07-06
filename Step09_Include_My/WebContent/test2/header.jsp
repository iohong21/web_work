<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 		String myName = (String)request.getAttribute("myName");
 %>
<div class="header">
	<h3>header 입니다.</h3>
	<p>내이름은 : <%=myName %></p>
</div>