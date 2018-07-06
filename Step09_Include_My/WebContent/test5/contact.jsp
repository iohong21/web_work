<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/test5/contact.jsp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  </head>
  <body>
  	<%
  			request.setAttribute("active", "contact");
  	%>
  	<jsp:include page="navbar.jsp" />

		<div class="container">
			<h1>Contact</h1>
			<p>Contact ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem eveniet nesciunt esse nemo aspernatur distinctio dolorum porro unde architecto qui nam ducimus eaque atque harum recusandae possimus soluta dolorem similique.</p>
		</div>
  </body>
</html>