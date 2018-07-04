<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>/board/deleteform.jsp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  </head>
  <body>
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDto dto = BoardDao.getInstance().getData(num);
			boolean isSuccess = dto != null;
		%>
  
  	<div class="text-center">
			<h3>글 삭제 페이지</h3>
		</div>
		<%if(isSuccess) {%>
			<%--
			<p>글번호: <%=num %></p>
			<p>작성자: <%=dto.getWriter() %></p>
			<p>제목: <%=dto.getTitle() %></p>
			<p>내용: <textarea id="" cols="80" rows="5" disabled><%=dto.getContent() %></textarea></p>
			<p>등록일: <%=dto.getRegdate() %></p>
			<br />
			삭제하시겠습니까? &nbsp;&nbsp;
			<button id="btnDelete" class="btn btn-primary">삭제</button>
			<button id="btnCancel" class="btn btn-warning">취소</button>
			--%>
			
			<br /><br />
			<div class="container">
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4 text-right"><strong>글번호: </strong></div>
					<div class="col-sm-7"><%=num %></div>
				</div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4 text-right"><strong>작성자: </strong></div>
					<div class="col-sm-7"><%=dto.getWriter() %></div>
				</div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4 text-right"><strong>제목: </strong></div>
					<div class="col-sm-7"><%=dto.getTitle() %></div>
				</div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4 text-right"><strong>내용: </strong></div>
					<div class="col-sm-7"><%=dto.getContent() %></div>
				</div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4 text-right"><strong>등록일: </strong></div>
					<div class="col-sm-7"><%=dto.getRegdate() %></div>
				</div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row"><div class="col">&nbsp; </div></div>
				<div class="row">
					<div class="col-sm-1 col-sm-offset-4">
						<button id="btnDelete" class="btn btn-primary">삭제</button>
					</div>
					<div class="col-sm-1">
						<button id="btnCancel" class="btn btn-warning">취소</button>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
			
		<%} else {%>
			<script>
				alert("삭제할 자료가 없습니다.");
				location.href = "list.jsp";
			</script>
		<%} %>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#btnDelete").click(function(){
				location.href = "delete.jsp?num=<%=num%>";
			})
			$("#btnCancel").click(function(){
				location.href = "list.jsp";
			});
		</script>
  </body>
</html>