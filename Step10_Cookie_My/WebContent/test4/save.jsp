<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// canPopup 이라는 파라메터로 넘어오는 문자열이 있는지 확인한다.
	String canPopup = (String)request.getParameter("canPopup");
	
// 만일 있으면 체크박스가 체크 되어서 폼이 전송된것이다.
	if(canPopup != null) {
		// 쿠키를 심는다.
		Cookie cook = new Cookie("canPopup", canPopup);
		cook.setMaxAge(60);	// 60초
		response.addCookie(cook);
	}
%>
<script>
	// 팝업창을 javascript 를 이용해서 닫는다.
	self.close();
</script>