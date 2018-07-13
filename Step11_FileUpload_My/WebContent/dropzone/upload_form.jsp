<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/dropzone/upload_form.jsp</title>
		<link rel="stylesheet" href="../resources/css/dropzone.css" />
		<script src="../resources/js/dropzone.js"></script>
	</head>
	<body>
		<h3>dropzone js 테스트</h3>
		<form action="upload.jsp" method="post" class="dropzone" id="myForm">
			<input type="file" name="myFile"/>
		</form>
	</body>
</html>