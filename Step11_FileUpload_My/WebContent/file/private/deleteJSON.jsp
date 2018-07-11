<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		boolean isDelete = FileDao.getInstance().delete(num);
		System.out.println("isDelete: " + isDelete);
		if(isDelete) {
			String saveFileName = FileDao.getInstance().getData(num).getSaveFileName();
			String path = application.getRealPath("/upload") + File.separator + saveFileName;
			System.out.println("path: " + path);
		}
%>
{"success":<%=isDelete%>, "fileName":path}