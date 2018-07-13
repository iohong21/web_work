<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
  	<%
  			request.setAttribute("menu", "login");
  	%>
		<jsp:include page="../menus/navbar.jsp"></jsp:include>
		<form class="form-horizontal" action="login.jsp" method="post" id="loginForm">
			<div class="form-group">
				<label class="control-label col-sm-2 text-right" for="id">아이디: </label>
				<div class="col-sm-3">
					<input type="text" name="id" id="id" size="30"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2 text-right" for="pwd">비밀번호: </label>
				<div class="col-sm-10">
					<input type="password" name="pwd" id="pwd" size="30"/>
				</div>
			</div>
			<br />
			<div class="col-sm-2"></div>
			<div class="col-sm-3">
				<button class="btn btn-primary" type="submit" id="submit">로그인</button>
			</div>
			<br />
			<br />
			<div class="col-sm-2"></div>
			<div class="col-sm-10">
				<label class="control-label text-left" id="isValidUser"></label>
			</div>
		</form>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#loginForm").on("submit", function(){
				// ajax 요청을 이용해서 서버에 보낸다. (페이지 이동없이 서버에 데이터 요청하고 받을 떄 사용)
				// ajax 로 요청하면 주소창에 표시 안된다. 
				// 즉, 페이지 이동이 없음
				
				var id = $("#id").val();
				var pwd = $("#pwd").val();
				$.ajax({
					url: "login.jsp",
					method: "post",
					data: {"id":id, "pwd":pwd},
					success: function(responseData){
						console.log(responseData);
						if(responseData.success) {
							location.href = "../index.jsp";
						} else {
							$("#isValidUser").text("아이디 또는 비밀번호가 틀립니다.").css("color", "black");
						}
					}
				});	
				
				return false;
			});
		</script>
	</body>
</html>