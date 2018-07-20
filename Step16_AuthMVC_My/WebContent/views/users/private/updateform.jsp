<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/users/private/updateform.jsp</title>
  </head>
  <body>
		<h3>회원 정보 수정</h3>
		<form action="update.do" method="post" id="updateForm">
			<input type="hidden" name="id" id="id" value="${dto.id }" /><br />
			<label for="id">아이디: </label>
			<input type="text" value="${dto.id }" disabled="disabled"/>
			<label for="pwd">비밀번호: </label>
			<input type="password" name="pwd" id="pwd" value="${dto.pwd }" /><br />
			<label for="pwd2">비밀번호 확인: </label>
			<input type="password" name="pwd2" id="pwd2" value="${dto.pwd }" /><br />
			<label for="email">이메일: </label>
			<input type="text" name="email" id="email" value="${dto.email }" /><br />
			<button type="submit">수정 확인</button>
		</form>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#updateForm").on("submit", function(){
				String pwd1 = $("#pwd").val();
				String pwd2 = $("#pwd2").val();
				if(pwd1 != pwd2) {
					alert("비밀번호를 확인하세요.");
					$("#pwd").focus();
					return false;		// 폼 전송 막기
				}
			});
			
			/*
			document.querySelector("#updateForm").addEventListener("submit", function(event){
				String pwd1 = document.querySelector("#pwd").value;
				String pwd2 = document.querySelector("#pwd2").value;
				if(pwd1 != pwd2) {
					alert("비밀번호를 확인하세요.");
					event.preventDefault();	// 폼 전송 막기
				}
			});
			*/
		</script>
  </body>
</html>