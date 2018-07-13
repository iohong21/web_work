<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String cPath = request.getContextPath();
		String id = (String)session.getAttribute("id");
		String isMember = (String)session.getAttribute("isMember");
		String activeMenu = (String)request.getAttribute("menu");
		if(activeMenu==null){
			activeMenu = "";
		}
		if(isMember == null) {
			isMember = "";
		}
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<div class="navbar navbar-inverse">
	 		<div class="navbar-header">
	 			<ul class="nav navbar-nav">
 					<%if(id != null && !id.equals("")) {%>
 						<li style="color:yellow;"><strong><%=id %></strong> 님 로그인중..&nbsp;&nbsp;</li>
 					<%} %>
 					
 					<li class='<%=activeMenu.equals("login") ? "active" : "" %>'>
		 				<%if(id == null) {%>
		 					<%
		 							request.setAttribute("menu", "login");
		 					%>
	 						<a href="<%=cPath %>/users/loginForm.jsp">로그인</a>
		 				<%} else {%>
	 						<a href="<%=cPath %>/users/logout.jsp">로그아웃</a>
	 					<%} %>
 					</li>

					<%if(id != null && !id.equals("")) { %>
						<li class='<%=activeMenu.equals("member") ? "active" : "" %>'>
							<a href="<%=cPath %>/users/private/memberOutForm.jsp">회원탈퇴</a>
						</li>
					<%} else {%>
						<%if(isMember != null && !isMember.equals("")) {%>
							<li class='<%=activeMenu.equals("member") ? "active" : "" %>'>
								<a href="<%=cPath %>/users/private/memberOutForm.jsp">회원탈퇴</a>
							</li>
						<%} else { %> 
							<li class='<%=activeMenu.equals("member") ? "active" : "" %>'>
								<a href="<%=cPath %>/users/memberForm.jsp">회원가입</a>
							</li>
						<%} %>
					<%} %>

 					<li class='<%=activeMenu.equals("board") ? "active" : "" %>'>
 						<a href="<%=cPath %>/board/board.jsp?currentPage=1">게시판</a>
 					</li>

 					<li class='<%=activeMenu.equals("store") ? "active" : "" %>'>
 						<a href="<%=cPath %>/users/store.jsp">자료실</a>
 					</li>

	 			</ul>
	 		</div>
	 	</div>
	</body>
</html>