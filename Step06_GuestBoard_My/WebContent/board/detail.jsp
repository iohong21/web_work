<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/board/detail.jsp</title>
  </head>
  <body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDto dto = BoardDao.getInstance().getData(num);
			boolean isSuccess = dto != null;
		%>
		<h3>글 자세히 보기 페이지</h3>
		<%if(isSuccess) {%>
			<table>
				<tr>
					<th>글번호: </th>
					<td><%=dto.getNum() %></td>
				</tr>
				<tr>
					<th>작성자: </th>
					<td><%=dto.getWriter() %></td>
				</tr>
				<tr>
					<th>제목: </th>
					<td><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="30" rows="10"><%=dto.getContent() %></textarea></td>
				</tr>
				<tr>
					<th>등록일: </th>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</table>
		<%} %>
		<br />
		<a href="updateform.jsp?num=<%=num%>">수정</a>
		<a href="javascript:deleteCheck();">삭제</a>
		<script>
			function deleteCheck() {
				var isDelete = confirm("글을 삭제 하시겠습니까?");
				if(isDelete) {
					location.href = "delete.jsp?num=<%=num %>";
				}
			}
		</script>
  </body>
</html>