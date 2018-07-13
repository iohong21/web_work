<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 		String cPath = request.getContextPath();

 		// 업로드한 클라이언트의 아이디
		String writer = (String)session.getAttribute("id");
 		
 		String realPath = application.getRealPath("/upload");
 		int sizeLimit = 1024 * 1024 * 50;
		MultipartRequest mr = new MultipartRequest(request, 
																							 realPath, 
																							 sizeLimit, 
																							 "utf-8", 
																							 new DefaultFileRenamePolicy());
		
		System.out.println("path: " + realPath);
		
		// 파일 시스템에 저장된 파일명
		String saveFileName = mr.getFilesystemName("image");
		String imagePath = cPath + "/upload/" + saveFileName;
 %>    
 {"imagePath":"<%=imagePath %>"}
