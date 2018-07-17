<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>hello.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<br />
		<div class="container">
			<h3 class="text-center">Expression Language 테스트</h3>
			<h4><u>el 로 산술 연산하기</u></h4>
			<p>1+1=<strong>${1+1 }</strong></p>
			
			<p>10-9 = <strong>${10-9 }</strong></p>
			<p>10*10 = <strong>${10*10 }</strong></p>
			<p>10/3 = <strong>${10/3 }</strong></p>
			
			<br />
			<h4><u>el 로 비교하기</u></h4>
			<p>10 은 2 보다 커요 : <strong>${10 > 2 }</strong></p>
			<p>10 은 2 보다 커요 : <strong>${10 gt 2 }</strong></p>
			<p>10 은 2 보다 같거나 커요 : <strong>${10 >= 2 }</strong></p>
			<p>10 은 2 보다 같거나 커요 : <strong>${10 ge 2 }</strong></p>
			<p>10 은 2 보다 작아요 : <strong>${10 < 2 }</strong></p>
			<p>10 은 2 보다 작아요 : <strong>${10 lt 2 }</strong></p>
			<p>10 은 2 보다 같거나 작아요 : <strong>${10 <= 2 }</strong></p>
			<p>10 은 2 보다 같거나 작아요 : <strong>${10 le 2 }</strong></p>
			
			<br />
			<h4><u>논리연산</u></h4>
			<p>true || false : ${true || false }</p>
			<p>true or false : ${true or false }</p>
			<p>true && false : ${true && false }</p>
			<p>true and false : ${true and false }</p>
			<p>!true : ${!true }</p>
			<p>not true : ${not true }</p>
			
			<br />
			<h4><u>empty 연산자 (자주 사용됨)</u></h4>
			<p>empty null : <strong>${empty null }</strong></p>
			<p>empty "" : <strong>${empty "" }</strong></p>
			<p>not empty null : <strong>${not empty null }</strong></p>
			<p>not empty "" : <strong>${not empty "" }</strong></p>
		</div>
	</body>
</html>