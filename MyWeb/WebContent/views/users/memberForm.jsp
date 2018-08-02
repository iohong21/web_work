<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/myCSS/main.css" />
		<style>
			.form-group.row .text-right{
				font-size: 16px;
			}		
		</style>
	</head>
	<body>
		<div class="container">
			<jsp:include page="/views/navbar.jsp" />
			
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title text-center">
							<h3>회원 가입</h3>
						</div>
						<div class="panel-title text-right">
							<label id="updown" class="glyphicon glyphicon-circle-arrow-down" />
						</div>
					</div>

					<div class="panel-body">
						<form action="member.do" id="memberform" method="post">
							<div class="form-group row">
						    <label for="id" class="col-sm-2 col-form-label text-right">사용자 ID: </label>
						    <div class="col-sm-6">
						    	<input type="text" class="form-control" id="id" name="id">
						    </div>
						    <label id="canUse" class="col-sm-4 col-form-label"></label>
							</div>
			
							<div class="form-group row">
						    <label for="pwd" class="col-sm-2 col-form-label text-right">비밀번호: </label>
						    <div class="col-sm-6">
						    	<input type="password" class="form-control" id="pwd" name="pwd">
						    </div>
							</div>
			
							<div class="form-group row">
						    <label for="name" class="col-sm-2 col-form-label text-right">성명: </label>
						    <div class="col-sm-6">
						    	<input type="text" class="form-control" id="name" name="name">
						    </div>
							</div>
			
							<div class="form-group row">
						    <label for="email" class="col-sm-2 col-form-label text-right">email: </label>
						    <div class="col-sm-6">
						    	<input type="email" class="form-control" id="email" name="email">
						    </div>
							</div>
			
							<div class="form-group row">
						    <label for="phone" class="col-sm-2 col-form-label text-right">전화번호: </label>
						    <div class="col-sm-6">
						    	<input type="tel" class="form-control" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" id="phone" name="phone">
						    </div>
							</div>
			
							<div class="form-group row">
						    <label for="gender" class="col-sm-2 col-form-label text-right">성별: </label>
						    <div class="col-sm-1">
							    <input type="radio" id="gender" name="gender" value="male" checked> 남자
						    </div>
						    <div class="col-sm-1">
							    <input type="radio" id="gender" name="gender" value="female"> 여자
						    </div>
							</div>
			
							<div class="form-group row">
						    <label for="nickname" class="col-sm-2 col-form-label text-right">별칭: </label>
						    <div class="col-sm-6">
						    	<input type="text" class="form-control" id="nickname" name="nickname">
						    </div>
							</div>
							
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-1">
									<button type="submit" class="btn btn-primary">가입</button>
								</div>
							</div>
						</form>					
					</div>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			var formValid = false;
			
			$("#updown").click(function(){
				if($(this).hasClass("glyphicon glyphicon-circle-arrow-down")) {
					$(this).removeClass().addClass("glyphicon glyphicon-circle-arrow-up");
					$("#memberform input").attr("autocomplete", "off");
				} else {
					$(this).removeClass().addClass("glyphicon glyphicon-circle-arrow-down");
					$("#memberform input").attr("autocomplete", "on");
				}
			});
			
			$("#id").input(function(){
				var id = $(this).val();
				$.ajax({
					url: "checkid.do",
					method: "post",
					data: {id:id},
					success: function(responseData){
						if(!responseData.canUse) {
							formValid = false;
							$("#canUse").text("사용할 수 없는 ID").css("color", "red");
						} else {
							formValid = true;
							$("#canUse").text("").css("color", "black");
						}
					}					
				});				
			});
			
			$("#memberform").submit(function(){
				if(!formValid) {
					return false;
				}
			});
		</script>
	</body>
</html>