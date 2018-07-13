<%@page import="com.shong.dao.UsersDao"%>
<%@page import="com.shong.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 회원 정보를 추출해서
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	// DB 에 저장하고
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean isSuccess = UsersDao.getInstance().insert(dto);
	if(!isSuccess) {
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "자료 저장 실패.");
		return;
	}
	session.setAttribute("isMember", "ok");
	String cPath = request.getContextPath();
	response.sendRedirect(cPath);
%>    
