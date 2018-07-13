<%@page import="com.shong.dao.BoardGuestDao"%>
<%@page import="com.shong.dto.BoardGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		BoardGuestDto dto = BoardGuestDao.getInstance().getData(num);
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
  	<%
  			request.setAttribute("menu", "board");
  	%>
		<jsp:include page="../../menus/navbar.jsp" flush="true" />
		<div class="contailer">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 ">
				<div class="panel panel-default">
					<div class="panel-heading">	
						<h3>글 수정</h3>
					</div>	
					<form action="update.jsp" id="detailForm" method="post">
						<div class="panel-body">
							<input type="hidden" name="currentPage" id="currentPage" value="<%=currentPage %>" />
							<input type="hidden" name="num" id="num" value="<%=dto.getNum() %>" />
							<input type="hidden" value="<%=dto.getWriter() %>" name="writer" id="writer" />
							<label for="num">글번호: 
								<input type="text" value="<%=dto.getNum() %>" disabled="disabled"/>
							</label><br />
							<label for="title">제&nbsp;&nbsp; 목: 
								<input type="text" value="<%=dto.getTitle() %>" name="title" id="title"/>
							</label><br />
							<label for="">작성자:
								<input type="text" value="<%=dto.getWriter() %>" disabled="disabled"/> 
							</label><br />
							<label for="">작성일:
								<input type="text" value="<%=dto.getRegdate() %>" disabled="disabled"/> 
							</label><br />
							<label for="content">내  용:
								<br /> 
								<textarea name="content" cols="80" rows="5" style="resize: none;"><%=dto.getContent() %></textarea> 
							</label><br />
						</div>
						<div class="panel-footer pull-right">
							<button type="submit" class="btn btn-primary">수정 <i class="glyphicon glyphicon-ok"></i></button>
							&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-primary">게시판 <i class="glyphicon glyphicon-remove"></i></button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#detailForm").on("reset", function(event){
				event.preventDefault();
				location.href = "../board.jsp?currentPage=" + <%=currentPage%>;
			});
		</script>
	</body>
</html>