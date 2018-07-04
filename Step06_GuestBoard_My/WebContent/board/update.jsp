<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/borad/update.jsp</title>
  </head>
  <body>
		<%
			request.setCharacterEncoding("utf-8");
		
			int num = Integer.parseInt(request.getParameter("num"));
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			boolean isSuccess = BoardDao.getInstance().update(num, writer, title, content);
		%>
		<%if(isSuccess) {%>
			<p><strong><%=writer %></strong> 님 글 정보를 수정했습니다.</p>
		<%} else {%>
			<p>글 수정 실패!</p>
		<%}%>
		<a href="list.jsp">글 목록 보기</a>
  </body>
</html>