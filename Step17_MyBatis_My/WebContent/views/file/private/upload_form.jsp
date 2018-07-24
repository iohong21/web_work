<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/file/private/upload_form.jsp</title>
	</head>
	<body>
		<p><strong>${id }</strong> 님 로그인중...</p>
		<h3>파일 업로드 폼 입니다.</h3>
		<form action="upload.do" method="post" enctype="multipart/form-data" id="upload">
			<label for="title">제목</label>
			<input type="text" name="title" id="title"/>
			<label for="myFile">첨부파일</label>
			<input type="file" name="myFile" id="myFile"/>
			<button type="submit">업로드</button>
		</form>
	</body>
</html>