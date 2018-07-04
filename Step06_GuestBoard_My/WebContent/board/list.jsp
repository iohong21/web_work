<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/board/list.jsp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  </head>
  <body>
  	<%
  		// 글 목록 불러오기
  		List<BoardDto> lists = BoardDao.getInstance().getList();
  	%>
		<div class="container">
			<a href="insertform.jsp">새글 작성</a>
			<div class="text-center">
				<h3>게시글 목록 입니다.</h3>
			</div>
			<table class="table table-boardered">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<%-- 
						<th>수정</th>
						<th>삭제</th>
						--%>
					</tr>
				</thead>
				<tbody>
					<%for(BoardDto dto : lists) {%>
						<tr>
							<td><%=dto.getNum() %></td>
							<td><a href="detail.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.getWriter() %></td>
							<td><%=dto.getRegdate() %></td>
							<%-- 
							<td><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></td>
							<td><a href="deleteform.jsp?num=<%=dto.getNum() %>">삭제</a></td>
							--%>
						</tr>
					<%} %>
				</tbody>
			</table>
		</div>
  </body>
</html>