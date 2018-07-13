<%@page import="com.shong.dao.BoardGuestDao"%>
<%@page import="com.shong.dto.BoardGuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String paramNum = request.getParameter("num");
		String paramPage = request.getParameter("currentPage");
		int num = -1;
		int currentPage = 1;
		BoardGuestDto dto = null;
		if(paramPage != null) {
			currentPage = Integer.parseInt(paramPage);
		}
		if(paramNum != null) {
			num = Integer.parseInt(paramNum);
			dto = BoardGuestDao.getInstance().getData(num); 
		}
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
		<div class="containert">
			<%if(dto != null) {%>
				<div class="col-sm-1"></div>
				<div class="col-sm-10 ">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">자료 삭제</h3>
						</div>
						<form action="delete.jsp" method="post" id="deleteForm">
							<div class="panel-body">
								<input type="hidden" name="currentPage" id="currentPage" value="<%=currentPage %>" />
								<input type="hidden" name="num" id="num" value="<%=dto.getNum() %>" />
								<labal><strong>순&nbsp;&nbsp;&nbsp;번: </strong></labal> <%=dto.getNum() %><br />
								<labal><strong>제&nbsp;&nbsp;&nbsp;목: </strong></labal><%=dto.getTitle() %><br />
								<labal><strong>작성자: </strong></labal><%=dto.getWriter() %><br />
								<labal><strong>작성일: </strong></labal><%=dto.getRegdate() %><br />
								<labal>내용:</labal><br /><%=dto.getContent() %>
							</div>
							<div class="panel-footer pull-right">
								<button type="submit" class="btn btn-primary">삭제 <i class="glyphicon glyphicon-ok"></i></button>
								&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-primary">취소 <i class="glyphicon glyphicon-remove"></i></button>
							</div>
						</form>
					</div>
				</div>
			<%} else {%>
				<div class="col-sm-1"></div>
				<div class="col-sm-10 ">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="text-center">자료 삭제</h3>
						</div>
						<div class="panel-body"></div>
						<div class="panel-footer pull-right"></div>
					</div>
				</div>			
			<%} %>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#deleteForm").on("reset", function(event){
				event.preventDefault();
				location.href = "../board.jsp?currentPage=" + <%=currentPage%>;
			});
			/*
			$("#deleteForm").on("submit", function(event){
				event.preventDefault();
				// 폼에 입력한 값을 serialize 문자열로 읽어내기
				var param = $(this).serialize();
				// ajax request 를 이용해서 폼에 입력한 내용 서버에 전송
				$.ajax({
					method: "post",				// 요청 메소드
					url: "delete.jsp",			// 요청 경로
					data: param,					// 요청 파라메터
					success: function(responseData){
						console.log(responseData);
						if(responseData.success) {
							location.href = "../board.jsp?currentPage=1";
						}
					},
					error: function(xhr) {
						alert(xhr.status + " - " + xhr.statusText);
					}
				});
			});		
			*/
		</script>
	</body>
</html>