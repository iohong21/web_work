<%@page import="com.shong.dao.UsersDao"%>
<%@page import="com.shong.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 아이디 비밀번호를 읽어와서
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// DB 의
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isLoginSuccess = UsersDao.getInstance().isValid(dto);
	if(isLoginSuccess) {
		session.setAttribute("id", id);
	}
	// 유효한 정보이면 로그인 처리를 하고, 로그인 성공이라고 응답
	// 유효한 정보가 아니면 아이디 혹은 비밀 번호가 잘못되었다고 응답
%>    
{"success":<%=isLoginSuccess %>}