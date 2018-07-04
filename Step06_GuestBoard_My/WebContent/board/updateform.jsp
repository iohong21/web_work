<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto dto = BoardDao.getInstance().getData(num); 
	boolean isSuccess = dto != null;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/board/updateform.jsp</title>
  </head>
  <body>
  	<h3>글 내용 수정</h3>
  	<%if(isSuccess) {%>
	  	<form action="update.jsp" method="post">
	  		<label for="num">글번호</label>
	  		<input type="hidden" name="num" id="num" value="<%=num %>"/>
	  		<input type="text" value="<%=num %>" disabled /><br />
	  		<label for="writer">작성자</label>
	  		<input type="text" name="writer" id="writer" value="<%=dto.getWriter() %>"/><br />
	  		<label for="title">제목</label>
	  		<input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/><br />
	  		<label for="content">내용</label>
	  		<textarea name="content" id="content" cols="30" rows="5"><%=dto.getContent() %></textarea><br />
	  		<label for="regdate">등록일</label>
	  		<input type="text" value=<%=dto.getRegdate() %> disabled/><br />
	  		<button type="submit">수정 확인</button>
	  	</form>
  	<%} %>
  </body>
</html>