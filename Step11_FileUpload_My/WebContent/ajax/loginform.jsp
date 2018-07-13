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
				String id = (String)session.getAttribute("id");
		%>
		<%if(id != null) {%>
			<p>
				<strong><%=id %></strong> 님 로그인중...
				<a href="logout.jsp">로그아웃</a>
			</p>
		<%} %>
		<h3>JQuery 를 활용한 ajax form 전송</h3>
		<form action="login.jsp" method="post" id="myForm">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" />
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" />
			<button type="submit">로그인</button>
			<div class="result"></p>
		</form>
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#myForm").on("submit", function(){
				// 폼에 입력한 값을 serialize 문자열로 읽어내기
				// id = xxx?pwd=xxx
				var param = $(this).serialize();
				// ajax request 를 이용해서 폼에 입력한 내용 서버에 전송
				$.ajax({
					method: "post",				// 요청 메소드
					url: "login.jsp",			// 요청 경로
					data: param,					// 요청 파라메터
					success: function(responseData){
						console.log(responseData);
						$(".result").text(responseData.isSuccess 
												? function() { 
														location.reload();
														return "로그인 되었습니다"; 
													} 
												: "로그인 실패" );
						//if(responseData.isSuccess) {
						//	location.href = "../index.jsp";
						//}
					},
					error: function(xhr) {
						console.log(xhr);
						$(".result").text(xhr.status + " - " + xhr.statusText);
					}
				});
				
				return false;	// 폼 전송 막기 (페이지 전환 방지)
			});
		</script>
	</body>
</html>