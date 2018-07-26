<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
  	<c:choose>
  		<c:when test="${empty id }">
				<h3>로그인 폼 입니다.</h3>
				<form action="login.do?url=${url }&pageNum=${pageNum }" method="post">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" />
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" />
					<button type="submit">로그인</button>
					<button type="reset" onclick="javascript:location.href='${pageContext.request.contextPath }'">취소</button>
				</form>
  		</c:when>
  		<c:otherwise>
  			<script>
  				alert("이미 로그인 되었습니다.");
  				location.href= "${pageContext.request.contextPath }/";
  			</script>
  		</c:otherwise>
  	</c:choose>	
	</body>
</html>