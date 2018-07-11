<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		FileDto dto = FileDao.getInstance().getData(num);
		if(dto == null) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "잘못된 인수 입니다.");
			return;
		}
		
		String id = (String)session.getAttribute("id");
		
		System.out.println("id: " + id);
		
		if(!id.equals(dto.getWriter())) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 파일이 아닙니다.");
			return;
		}
		
		String saveFileName = dto.getSaveFileName();
		
		boolean isDelete = FileDao.getInstance().delete(num);
		String path = application.getRealPath("/upload") + File.separator + saveFileName;
		new File(path).delete();
		
		String cPath = request.getContextPath();
		//response.sendRedirect(cPath + "/file/index.jsp");
%>
<%if(isDelete) {%>
	<p><storng><%=num %></storng> 번 파일을 삭제 했습니다.</p>
<%} else {%>
	<p><storng><%=num %></storng> 번 파일 삭제 실패!</p>
<%} %>
<a href="<%=cPath %>/file/list.jsp">목록</a>

<%--
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/file/private/delete.jsp</title>
	</head>
	<body>
	
	</body>
</html>
--%>