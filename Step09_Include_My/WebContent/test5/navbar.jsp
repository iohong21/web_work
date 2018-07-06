<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		String active = (String)request.getAttribute("active");
		String s1 = "", s2 = "", s3="";
		
		if(active.equals("home")) {
			s1 = "class='active'";
		}
		if(active.equals("game")) {
			s2 = "class='active'";
		}
		if(active.equals("contact")) {
			s3 = "class='active'";
		}
%>
	<div class="navbar navbar-inverse">
 		<div class="navbar-header">
 			<ul class="nav navbar-nav">
 				<li <%=s1 %>><a href="home.jsp">Home</a></li>
 				<li <%=s2 %>><a href="game.jsp">Game</a></li>
 				<li <%=s3 %>><a href="contact.jsp">Contact</a></li>
 			</ul>
 		</div>
 	</div>
