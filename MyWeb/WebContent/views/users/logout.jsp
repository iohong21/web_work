<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 모든 정보 삭제
	session.invalidate();
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath);
%>
