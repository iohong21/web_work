<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/users/signup_form.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
	  <c:choose>
	  	<c:when test="${empty url }">
	  		<c:set var="url" value="${pageContext.request.contextPath }/index.jsp" />
	  	</c:when>
	  	<c:otherwise>
	  		<c:set var="url" value="${url }" />
	  	</c:otherwise>
	  </c:choose>
	  
		<div class="container">
			<div class="col-sm-2"></div>
			<div class="col-sm-5 text-center">
				<h3>회원 가입 페이지</h3>
				<br />
			</div>
			<div class="clearfix"></div>
			<form class="form-horizontal" action="signup.do" method="post" id="signupForm">
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="id">아이디: </label>
					<div class="col-sm-3">
						<input type="text" name="id" id="id" size="30"/>
					</div>
					<label class="control-label col-sm-4 text-left" id="canUse"></label>
					<div class="col-sm-5"></div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="pwd">비밀번호: </label>
					<div class="col-sm-10">
						<input type="password" name="pwd" id="pwd" size="30"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="email">이메일: </label>
					<div class="col-sm-10">
						<input type="email" name="email" id="email" size="30"/>
					</div>
				</div>
				<br />
				<div class="col-sm-3"></div>
				<div class="col-sm-1">
					<button class="btn btn-primary" type="submit" id="submit">가입</button>
				</div>
				<div class="col-sm8">
					&nbsp;&nbsp;&nbsp;
					<button class="btn btn-warning" type="reset" onclick="javascript:location.href='${url }'">취소</button>
				</div>
			</form>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			var formValid = false;
			
			var passCheck = function() {
				var pwd = $("#pwd");
				var id = $("#id");
				var isNothingId = id.val().length < 1;
				var isNothingPwd = pwd.val().length < 1;
				if(isNothingId) {
					alert("id 는 반드시 입력해야 합니다.");
					return id;
				}
				if(isNothingPwd) {
					alert("password 는 반드시 입력해야 합니다.");
					return pwd;
				}
				return null;
			}
			
			$("#signupForm").submit(function(){
				if(!formValid) {
					return false;
				}
				
				var result = passCheck();
				if(result != null) {
					result.focus();
					return false;
				}
			});
			
			$("#id").on("input", function(){
				// 입력한 아이디를 읽어와서
				var inputId = $(this).val();
				
				// ajax 요청을 이용해서 서버에 보낸다. (페이지 이동없이 서버에 데이터 요청하고 받을 떄 사용)
				// ajax 로 요청하면 주소창에 표시 안된다. 
				// 즉, 페이지 이동이 없음
				$.ajax({
					url: "checkid.do",
					method: "post",
					data: {inputId:inputId},
					success: function(responseData){
						console.log(responseData);
						if(!responseData.canUse) {
							formValid = false;
							$("#canUse").text("이미 사용중인 ID").css("color", "red");
						} else {
							formValid = true;
							$("#canUse").text("").css("color", "black");
						}
					}
				});
			});
		</script>	
	</body>
</html>