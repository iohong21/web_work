<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/borad/delete.jsp</title>
  </head>
  <body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			boolean isSuccess = BoardDao.getInstance().delete(num);	
		%>
		
		<%-- 
		<%if(isSuccess) {%>
			<script>
				alert("<%=num %> 님 글을 삭제 했습니다.");
				location.href = "list.jsp";
			</script>
		<%} else {%>
			<script>
				alert("삭제 실패");
				location.href = "list.jsp";
			</script>
		<%} %>
		--%>
		
		<script>
			<%if(isSuccess) {%>
				alert("<%=num %> 번 글 삭제.");
			<%} else {%>
				alert("삭제 실패");
			<%} %>
			location.href = "list.jsp";
		</script>
		
  </body>
</html>