<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertform.jsp</title>
	</head>
	<body>
		<form action="insert.jsp" method="post">
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
			<label for="addr">전화번호</label>
			<input type="text" name="phone" id="phone"/>
			<button type="submit">추가</button>
			<button type="submit">취소</button>
		</form>
	</body>
</html>