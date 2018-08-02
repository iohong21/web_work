<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/gallery/private/upload_form.jsp</title>
	</head>
	<body>
		<h3>사진 업로드 폼</h3>
			<form action="upload.do" method="post" enctype="multipart/form-data">
				<label for="caption">설명</label>
				<input type="text" name="caption" id="caption"/><br />
				<label for="image">이미지</label>
				<input type="file" name="image" id="image"/><br />
				<button type="submit">업로드</button>
			</form>
	</body>
</html>