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
			<div class="col-sm-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="text-center">상세 내용</h3>
					</div>
					<div class="panel-body">
						<label>글번호:</label>&nbsp;&nbsp;<%=dto.getNum() %><br />
						<label>글제목:</label>&nbsp;&nbsp;<%=dto.getTitle() %><br />
						<label>작성자:</label>&nbsp;&nbsp;<%=dto.getWriter() %><br />
						<label>작성일:</label>&nbsp;&nbsp;<%=dto.getRegdate() %><br />
						<label>내용 </label><br />
						<textarea name="content" cols="80" rows="5" style="resize: none;" disabled="disable"><%=dto.getContent() %></textarea>
					</div> 
					<div class="panel-footer pull-right">
						<button id="btnOK" class="btn btn-primary pull-right">확인 <i class="glyphicon glyphicon-ok"></i></button>
					</div>
				</div>
			</div>				
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#btnOK").on("click", function(event){
				location.href = "../board.jsp?currentPage=" + <%=currentPage%>;
			});
		</script>	
	</body>
</html>