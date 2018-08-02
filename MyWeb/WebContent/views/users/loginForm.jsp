<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사용자 로그인</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myCSS/main.css" />
	</head>
	<body>
		<div class="container">
			<jsp:include page="/views/navbar.jsp" />
			<div style="display: inline">
	  		<span id="updown" class="glyphicon glyphicon-circle-arrow-down" />
	  	</div>
			<form action="login.do" id="loginform" method="post">
			  <div class="form-group">
			    <label for="id">사용자: </label>
			    <input type="text" class="form-control" id="id" name="id">
			    <label id="canUse"></label>
			  </div>
			  <div class="form-group">
			    <label for="pwd">비밀번호: </label>
			    <input type="password" class="form-control" id="pwd" name="pwd">
			  </div>
			  <div class="checkbox">
			    <label for="remember"><input type="checkbox" id="remember">아이디 저장</label>
			  </div>
			  <button type="submit" class="btn btn-default">로그인</button>
			</form>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			var formValid = false; 
			var idSuccess = false;
			var pwdSuccess = false;
			
			$(window).on("load", function(){
			  if(localStorage.getItem("id")) {
				  $("#id").val(localStorage["id"]);
				  $("#remember").attr("checked", "checked");
			  }
			});
			
			$("#updown").click(function(){
				if($(this).hasClass("glyphicon glyphicon-circle-arrow-down")) {
					$(this).removeClass().addClass("glyphicon glyphicon-circle-arrow-up");
					$("#id").attr("autocomplete", "off");
				} else {
					$(this).removeClass().addClass("glyphicon glyphicon-circle-arrow-down");
					$("#id").attr("autocomplete", "on");
				}
			});
			
			$("#loginform").on("submit", function(){
				if(!formValid){
					if($("#id").val().length < 1) {
						alert("아이디는 반드시 입력해야 합니다.")
					} else if($("#pwd").val().length < 1) {
						alert("비밀번호는 반드시 입력해야 합니다.")
					}
					return false;
				}
				var isSave = $("#remember").prop("checked");
				var isSavedID = localStorage.getItem("id");
				if(isSave) {
					var id = $("#id").val();
					localStorage["id"] = id;
				} else {
					if(isSavedID != null) {
						localStorage.removeItem("id");
					}					
				}
			});

			$("#id").on("input", function(){
				var id = $(this).val();

				if(id != "") {
					$.ajax({
						url: "checkid.do",
						method: "post",
						data: {id:id},
						success: function(responseData){
							if(responseData.canUse) {
								formValid = false;
								$("#canUse").text("존재하지 않는 ID").css("color", "red");
							} else {
								formValid = true;
								$("#canUse").text("").css("color", "black");
							}
						}					
					});					
				} else {
					formValid = false;
					$("#canUse").text("").css("color", "black");
				}
			});
		</script>
	</body>
</html>