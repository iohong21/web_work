<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 		String id = (String)session.getAttribute("id");
 		if(id == null) {
 			id = "";
 		}
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/file/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%
				List<FileDto> list = FileDao.getInstance().getList();
				String cPath = request.getContextPath();
		%>
		<div class="container">
			<%if(id != null && !id.equals("")) {%>
				<p><strong><%=id %></strong> 로그인중...</p>
			<%} else { %>
				<a href="<%=cPath %>/users/loginform.jsp">로그인</a>
			<%} %>
			<a href="private/upload_form.jsp">새파일 업로드</a>
			<h3>파일 목록 입니다.</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>파일명</th>
						<th>다운로드 횟수</th>
						<th>등록일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<% for(FileDto dto : list) {%>
						<tr>
							<td><%=dto.getNum() %></td>
							<td><%=dto.getWriter() %></td>
							<td><%=dto.getTitle() %></td>
							<td><%=dto.getOrgFileName() %>
								<a href="download.jsp?num=<%=dto.getNum()%>">
									<i class="glyphicon glyphicon-download pull-right">
									</i>
								</a>
							</td>								
							<td><%=dto.getDownCount() %></td>
							<td><%=dto.getRegdate() %></td>
							<td>
								<%if(id.equals(dto.getWriter())) {%>
									<a href="javascript: deleteConfirm(<%=dto.getNum() %>);">삭제</a>
								<%} %>
							</td>
						</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<p id="deleteInfo"></p>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			function deleteConfirm(num) {
				var isDelete = confirm(num + "번 파일을 삭제 하시겠습니까?");
				if(isDelete) {
					location.href = "private/delete.jsp?num=" + num;
					/*
					$.ajax({
						url: "private/deleteJSON.jsp",
						method: "post",
						data: {"num":num},
						success: function(responseData){
							if(!responseData.success) {
								$("#deleteInfo").text("삭제 되었습니다.");
								var fileName = responseData.fileName;
								location.href = "private/doDelete.jsp?fileName=" + fileName;
							} else {
								$("#deleteInfo").text("삭제 실패");
							}
						}
					});	
					*/
				}
			}
		</script>
	</body>
</html>