<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<br />
		<div class="container">
			<h3 class="text-center">인덱스 페이지 입니다.</h3>
			<ul type="square">
				<li><a href="hello.jsp">Hello Expression Language</a></li>
				<li><a href="scope/test01.jsp">scope 테스트1</a></li>
				<li><a href="fortune.do">오늘의 운세</a></li>
				<li><a href="person.do">오늘의 인물 보기</a></li>
				<li><a href="info.do">회원 한명의 정보 보기</a></li>
				<li><a href="test.do?num=1&name=gura">요청 param 테스트</a></li>
				<li><a href="test.do?num=2&name=monkey">요청 param 테스트2</a></li>
			</ul>
			<p>컨텍스트 경로를 EL 로 출력하기</p>
			<p>현재 context path : <span style="color:red; font-size: 20px">${pageContext.request.contextPath }</span></p>
			
		</div>
	</body>
</html>