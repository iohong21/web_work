<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	new File(fileName).delete();
	String cPath = request.getContextPath();
	response.sendRedirect(cPath + "/file/list.jsp");
%>    
