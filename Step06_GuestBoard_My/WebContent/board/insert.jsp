<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	// BoardDao 객체의 참조값 얻어와서 DB 에 저장하기
	BoardDao dao = BoardDao.getInstance();
	
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/board/insert.jsp</title>
  </head>
  <body>
  	<%if(isSuccess) {%>
  		<p><strong><%=writer %></strong> 님의 글이 저장 되었습니다.</p>
  		<a href="list.jsp">글 목록 보기</a>
  	<%} else {%>
  		<p>글 정보 저장 실패</p>
  		<a href="insertform.jsp">새글 작성폼</a>
  	<%}%>
  </body>
</html>