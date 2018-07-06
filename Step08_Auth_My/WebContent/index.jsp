<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>index.jsp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <style>
    	body {
    		box-sizing: border-box;
    		margin: 0;
    		padding: 0;
    	}
    	.container{
				/* width: 800px; */
				margin: 0 auto;
    	}
    	#mainmenu{
				background-color: black;
				overflow: auto;
				color: white;
			}
			#mainmenu ul {
				list-style-type: none;
				padding: 0;
				margin: 0;
			}
    	#mainmenu ul li{
				float: left;
				text-align: center;
			}
			#mainmenu a {
				text-decoration: none;
				color: white;
				display: block;
				padding: 10px 20px;
			}
			#mainmenu a:hover, #mainmenu a:focus{
				color: #fff;
				background-color: #cecece;
			}
    </style>
  </head>
  <body>
    <%
  		String cPath = request.getContextPath();
    
    	// session 에 "id" 라는 키값으로 담겨 있는 문자열을 읽어와 본다.
			String id = (String)session.getAttribute("id");
    	/*
    		로그인된 상태면 id 에는 로그인한 회원의 아이디가 들어있고
    		로그인이 되지 않은 상태면 id 에는 null 이 들어 있다.
    	*/
  	%>
  	<%-- 
  	<h3>인덱스 페이지 입니다.</h3>
		<%if(id != null) {%>
			<p><strong><a href="users/private/info.jsp"><%=id %></a></strong> 님 로그인중...</p>
			<a href="users/logout.jsp">로그아웃</a>  		
		<%} %>
  	--%>
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<nav id="mainmenu">
						<ul>
							<li><a class="menulink" href="users/loginform.jsp?url=<%=cPath %>/index.jsp">로그인</a></li>
							<li><a class="menulink" href="users/signup_form.jsp?url=<%=cPath %>/index.jsp">회원가입</a></li>
							<li><a class="menulink" href="market/buy.jsp">상품 구입</a></li>
							<li><a class="menulink" href="market/buy2.jsp">상품 구입2</a></li>
							<li><a class="menulink" href="market/buy3.jsp">상품 구입3</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-sm-3">
					<%if(id != null) {%>
						<strong><a href="users/private/info.jsp"><%=id %></a></strong> 님 로그인중.
						<br />
						<a href="users/logout.jsp">로그아웃</a>  		
					<%} %>
				</div>
			</div>
		</div>
  </body>
</html>