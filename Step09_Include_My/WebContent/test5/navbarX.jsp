<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="navbar navbar-inverse">
 		<div class="navbar-header">
 			<ul class="nav navbar-nav">
 				<li id="item1"><a href="home.jsp">Home</a></li>
 				<li id="item2"><a href="game.jsp">Game</a></li>
 				<li id="item3"><a href="contact.jsp">Contact</a></li>
 			</ul>
 		</div>
 	</div>
<%
		String active = (String)request.getAttribute("active");
%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script>
	$("ul li").removeClass("active");
</script>

<%if(active.equals("home")) {%>
			<script>
				$("#item1").addClass("active");
			</script>
<%} %>			
<%if(active.equals("game")) {%>
			<script>
				$("#item2").addClass("active");
			</script>
<%} %>			
<%if(active.equals("contact")) {%>
			<script>
				$("#item3").addClass("active");
			</script>
<%} %>			
	
