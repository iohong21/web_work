<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 		String cPath = request.getContextPath();
 		String id = (String)session.getAttribute("id");
 		int displayPerPage = 5;
 		String currPage = (String)request.getParameter("currentPage");
 		int currentPage = 1;
 		if(currPage != null) {
 			currentPage = Integer.parseInt(currPage);
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
		<h3>게시판 글 쓰기</h3>
		<%if(id == null) {%>
			<p id="msg">로그인 안했다. 로그인 먼저 해라...</p>
		<%} %>			
		<form action="write.jsp" method="post" id="writeForm">
			<label for="title">제목</label>
			<input type="text" name="title" id="title"/><br />
			<label for="writer">작성자</label>
			<input type="hidden" name="writer" id="writer" value="<%=id%>"/>
			<input type="text" value="<%=id%>" disabled="diable"/><br />
			<label for="content">내용</label><br />
			<textarea name="content" cols="80" rows="5" style="resize: none;"></textarea>
			<br></br>
			<button type="submit" class="btn btn-primary">확인 <i class="glyphicon glyphicon-ok"></i></button>
			&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-primary">취소 <i class="glyphicon glyphicon-remove"></i></button>
		</form>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#detailForm").on("reset", function(event){
				event.preventDefault();
				location.href = "../board.jsp?currentPage=" + <%=currentPage%>;
			});
		</script>
	</body>
</html>