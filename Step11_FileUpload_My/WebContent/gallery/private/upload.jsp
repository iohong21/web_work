<%@page import="java.io.File"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 		request.setCharacterEncoding("utf-8");
 		String cPath = request.getContextPath();
 		String realPath = application.getRealPath("/upload");
 		int sizeLimit = 1024 * 1024 * 50;
		MultipartRequest mr = new MultipartRequest(request, 
																							 realPath, 
																							 sizeLimit, 
																							 "utf-8", 
																							 new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
		String caption = mr.getParameter("caption");
		
		//   imagePath => /upload/kim1.jpg
		// <img src="/Step11_xxx/upload/kim1.jpg"/>
		// 파일 시스템에 저장된 파일명
		String imagePath = "/upload/" + mr.getFilesystemName("image");
		
		// 업로드한 클라이언트의 아이디
		String writer = (String)session.getAttribute("id");
		
		GalleryDto dto = new GalleryDto();

		dto.setWriter(writer);
		dto.setCaption(caption);
		dto.setImagePath(imagePath);
		
		// DB 에 저장한다.
		boolean isSuccess = GalleryDao.getInstance().insert(dto); 		
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<%if(isSuccess) {%>
			<p>파일을 업로드 했습니다.</p>
		<%} else {%>
			<p>파일 업로드 실패</p>
		<%} %>
		<a href="<%=cPath %>/gallery/list.jsp">목록보기</a>
	</body>
</html>