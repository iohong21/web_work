<%@page import="com.shong.util.shongUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.shong.dto.BoardGuestDto"%>
<%@page import="com.shong.dao.BoardGuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 		String cPath = request.getContextPath();
 		String id = (String)session.getAttribute("id");
 		if(id == null) {
 			id = "";
 		}
 		int displayPerPage = 5;
 		List<BoardGuestDto> allList = BoardGuestDao.getInstance().getList();
 		int maxRow = allList.size();
 		int pages = ((int)(maxRow / displayPerPage)) + (maxRow % displayPerPage == 0 ? 0 : 1);
 		
 		int currentPage = 1;
 		String currPage = (String)request.getParameter("currentPage");
 		if(currPage != null) {
 			currentPage = Integer.parseInt(currPage);
 		}
 		List<BoardGuestDto> guestList = new shongUtil().pageList(allList, displayPerPage, currentPage);
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
  	<%
  			request.setAttribute("menu", "board");
  	%>
		<jsp:include page="../menus/navbar.jsp" flush="true" />
		<h3 class="text-center">게시판</h3>
		<br />
		<a href="private/writeForm.jsp?currentPage=<%=currentPage %>"title="글작성">
			<i class="glyphicon glyphicon-pencil" style="font-size: 20px; margin-left:20px;"></i>
		</a>
		<hr />
		<table class="table table-hover">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">순번</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		      <th style="display:none;">내용</th>
		      <th scope="col">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		    <%for(int i=0; i<displayPerPage; i++) {
		    	boolean isNext = i < guestList.size();%>
		    	<%if(isNext) {
						BoardGuestDto tmp = guestList.get(i);%>
			    	<tr class='tableRow''>
			    		<td id="num"><%=tmp.getNum() %></td>
			    		<td><%=tmp.getTitle() %></td>
			    		<td><%=tmp.getWriter() %></td>
			    		<td><%=tmp.getRegdate() %></td>
			    		<td style="display:none;"><%=tmp.getContent() %></td>
			    		<td>
			    			<a <%if(tmp.getWriter().equals(id)) { %>
			    				href="private/deleteForm.jsp?num=<%=tmp.getNum() %>&currentPage=<%=currentPage %>" 
			    			<%}else{%>
			    				href="javascript:"
			    			<%} %> 
			    				 title="삭제">
			    				<i class="glyphicon glyphicon-trash" style="font-size: 20px; margin-left:20px;"></i>
		    				</a>
			    		</td>
			    	</tr>
			    <%} else {%>
			    	<tr>
				    	<td style="text-indent: -1000px;">-1</td>
				    	<td style="text-indent: -1000px;">&nbsp;</td>
				    	<td style="text-indent: -1000px;">&nbsp;</td>
				    	<td style="text-indent: -1000px;">&nbsp;</td>
				    	<td style="text-indent: -1000px;">&nbsp;</td>
			    <%} %>
		    <%} %>
		  </tbody>
		</table>
		<p class="text-center"></p>
		<%for(int i=0; i<pages; i++) {%>
			<%if(i+1 == currentPage) {%>
				<a href=""><strong>[<%=i+1 %>]</strong></a>
			<%} else {%>
				<a href="<%=cPath %>/board/board.jsp?currentPage=<%=i+1%>">[<%=i+1 %>]</a>
			<%} %>
		<%}%>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$(".tableRow").click(function(){
				if(this.cells[4] != -1) {
					<%if(id != null && !id.equals("")) {%>
							if(this.cells[2].innerText == <%=id%>){
								location.href = "private/detail.jsp?num=" + this.cells[0].innerText + "&currentPage="+<%=currentPage%>;
							} else {
								location.href = "private/detailView.jsp?num=" + this.cells[0].innerText + "&currentPage="+<%=currentPage%>;
							}
					<%} else {%>
						location.href = "private/detailView.jsp?num=" + this.cells[0].innerText + "&currentPage="+<%=currentPage%>;
					<%}%>
				}
			});
		</script>
	</body>
</html>