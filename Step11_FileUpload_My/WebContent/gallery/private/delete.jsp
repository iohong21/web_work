<%@page import="java.io.File"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		GalleryDto dto = GalleryDao.getInstance().getData(num);
		if(dto == null) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "잘못된 인수 입니다.");
			return;
		}
		
		String id = (String)session.getAttribute("id");
		
		if(!id.equals(dto.getWriter())) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 파일이 아닙니다.");
			return;
		}
		
		String saveFileName = dto.getImagePath();
		
		boolean isDelete = GalleryDao.getInstance().delete(num);
		String path = application.getRealPath("/upload") + File.separator + saveFileName;
		new File(path).delete();
		
		String cPath = request.getContextPath();
%>
<%if(isDelete) {%>
	<p><storng><%=num %></storng> 번 파일을 삭제 했습니다.</p>
<%} else {%>
	<p><storng><%=num %></storng> 번 파일 삭제 실패!</p>
<%} %>
<a href="<%=cPath %>/gallery/list.jsp">목록</a>