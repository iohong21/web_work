<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String cPath = request.getContextPath();
		String id = (String)session.getAttribute("id");
		if(id == null) {
			response.sendRedirect(cPath);
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		GalleryDto dto = GalleryDao.getInstance().getData(num); 
		
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<style>
			.myFont {
				font-size: 15px;
			}
			#myPic:hover {
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<div class="container"> 
			<%if(dto != null) {%>
				<div class="row">
					<div class="col-sm-12">
						<%-- 
						<img src="<%=cPath + dto.getImagePath() %>" width="300" height="300" draggable="false" id="myPic"/><br />
						--%>
						<img src="<%=cPath + dto.getImagePath() %>" 
								 class="img-responsive img-thumbnail" 
								 draggable="false" 
								 id="myPic"/><br />
					</div>
				</div>
				<dir class="row"><div class="col-sm-12"> </div></dir>
				<div class="row">
					<div class="col-sm-1"><label class="label label-default myFont">제&nbsp;&nbsp;&nbsp; 목</label></div>
					<div class="col-sm-3 myFont"><%=dto.getCaption() %></div>
				</div>
				<dir class="row"><div class="col-sm-12"> </div></dir>			
				<div class="row">
					<div class="col-sm-1"><label class="label label-default myFont">작성자</label></div>
					<div class="col-sm-3 myFont"><%=dto.getWriter() %></div>
				</div>	
				<dir class="row"><div class="col-sm-12"> </div></dir>		
				<div class="row">
					<div class="col-sm-1"><label class="label label-default myFont">등록일</label></div>
					<div class="col-sm-3 myFont"><%=dto.getRegdate() %></div>
				</div>			
				
				<%--	
				<label class="label label-default">제&nbsp;&nbsp;&nbsp;&nbsp;목: </label><%=dto.getCaption() %><br />
				<label class="label label-default">작성자: </label><%=dto.getWriter() %><br />
				<label class="label label-default">등록일: </label><%=dto.getRegdate() %><br />
				--%>
				<dir class="row"><div class="col-sm-12"> </div></dir>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-3">
						<a class="label label-primary text-center myFont" href="<%=cPath %>/gallery/list.jsp">목록보기</a>
					</div>
				</div>
			<%} %>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#myPic").on("click", function(){
					window.open("popup_page.jsp?fileName=<%=cPath + dto.getImagePath() %>",
											"팝업창",
											"width=500,height=500,top=100,left=100");
			});
		</script>
	</body>
</html>