<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/test.jsp</title>
	</head>
	<body>
		<h3>EL 로 요청 parameter 추출</h3>
		<p>num : <strong>${param.num }</strong></p>
		<p>name : <strong>${param.name }</strong></p>
		<p>Test: ${param.num == 1 ? "Ace" : param.num } 번</p>
	</body>
</html>