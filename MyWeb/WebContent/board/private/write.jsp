<%@page import="com.shong.dao.BoardGuestDao"%>
<%@page import="com.shong.dto.BoardGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		BoardGuestDto dto = new BoardGuestDto();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContent(content);
		boolean isSuccess = BoardGuestDao.getInstance().insert(dto);
		response.sendRedirect("../board.jsp?currentPage=1");
%>      
