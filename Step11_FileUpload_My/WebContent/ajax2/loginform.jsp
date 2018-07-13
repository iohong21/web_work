<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/ajax/loginform.jsp</title>
		<style>
			.result {
				background-color: #000;
				color: #fff;
				border-radius: 10px;
				margin-top: 10px;
				font-weight: bold;
				font-size: 20px;
			}
		</style>
	</head>
	<body>
		<%
				String url = (String)request.getParameter("url");
				String id = (String)session.getAttribute("id");
		%>
		<%if(id != null) {%>
			<p>
				<strong><%=id %></strong> 님 로그인중...
				<a href="logout.jsp?url=<%=url %>">로그아웃</a>
				&nbsp;&nbsp;&nbsp;<a href="<%=url%>">초기화면</a>
			</p>
		<%} else { %>
			<h3>JQuery 를 활용한 ajax form 전송</h3>
			<form action="login.jsp" method="post" id="myForm">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" />
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
				<button type="submit">로그인</button>
				<div class="result"></p>
			</form>		
		<%} %>
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
		<script>
			$("#myForm").ajaxForm(function(responseData){
				console.log(responseData);
				$(".result").text(responseData.isSuccess 
						? function() { 
								//location.reload();
								//return "로그인 되었습니다"
								location.href = "<%=url%>";
							} 
						: "아이디 또는 비밀번호가 틀립니다." );				
			});
		</script>
	</body>
</html>