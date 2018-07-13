<%@page import="com.shong.dao.BoardGuestDao"%>
<%@page import="com.shong.dto.BoardGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int num = Integer.parseInt(request.getParameter("num"));
		boolean isSuccess = BoardGuestDao.getInstance().delete(num);
		//response.sendRedirect("../board.jsp?currentPage=" + currentPage);
		response.sendRedirect("../board.jsp?currentPage=1");
%>    
