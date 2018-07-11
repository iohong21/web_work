<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/gallery/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<style>
			td:nth-of-type(4), th:nth-of-type(4) {
				display: none;
			}
		</style>
	</head>
	<body>
		<%
				String cPath = request.getContextPath();
				String id = (String)session.getAttribute("id");
				List<GalleryDto> list = null;
				if(id != null) {
					list = GalleryDao.getInstance().getList();
				}
		%>
		<div class="container">
			<h3>사진 Gallery 입니다.
				<%if(id != null) {%>
					&nbsp;&nbsp;&nbsp;사진올리기<a href="private/upload_form.jsp">
							<i class="glyphicon glyphicon-upload"></i>
					</a>
				<%} %>
			</h3>
			
			<%if(id != null) {%>
				<%if(list != null) { 
					for(GalleryDto dto : list) {%>
						<div class="col-xs-3 col-sm-3">
							<h4><%=dto.getCaption() %></h4>
							<img src="<%=cPath %><%=dto.getImagePath() %>" 
								   class="img-responsive img-thumbnail" 
								   draggable="false"/>
							<p>작성자: <strong><%=dto.getWriter() %></strong></p>
							<p>등록일: <strong><%=dto.getRegdate() %></strong></p>
						</div>	
					<%} %>
				<%} %>
			<%} %>															
						
													
			<%--
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>이미지 경로</th>
						<th>작성일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<%if(id != null) {%>
						<%if(list != null) { 
					 		for(GalleryDto dto : list) {%>
								<tr>
									<td><%=dto.getNum() %></td>
									<td><%=dto.getWriter() %></td>
									<td>
										<a href="private/detail.jsp?num=<%=dto.getNum() %>"><%=dto.getCaption() %></a>
									</td>
									<td><%=dto.getImagePath() %></td>
									<td><%=dto.getRegdate() %></td>
									<td>
										<%if(id.equals(dto.getWriter())) {%>
											<a href="javascript: deleteConfirm(<%=dto.getNum() %>);">삭제</a>
										<%} %>
									</td>
								</tr>
							<%} %>
						<%} %>
					<%} else {%>
						<a href="<%=cPath %>/users/loginform.jsp">로그인</a>
					<%} %>										
				</tbody>
			</table>
			--%>
		</div>
		<script>
			function deleteConfirm(num) {
				var isDelete = confirm(num + "번 파일을 삭제 하시겠습니까?");
				if(isDelete) {
					location.href = "private/delete.jsp?num=" + num;
				}				
			}
		</script>
	</body>
</html>