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
		<script>
			var isSuccess = ${isSuccess};
			if(isSuccess) {
				alert("회원 가입이 되었습니다.");
				location.href = "${pageContext.request.contextPath }/main.do";
			} else {
				alert("회원 가입에 실패 하였습니다.");
			}
		</script>
	</body>
</html>