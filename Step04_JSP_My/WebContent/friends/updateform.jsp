<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>updateform.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			int num = Integer.parseInt(request.getParameter("num"));
			FriendsDao dao = FriendsDao.getInstance();
			FriendsDto dto = dao.getData(num);
		%>
		<div class="container">
			<div class="row">
				<div class="col-sm-offset-5 col-sm-7">
					<h3>친구정보 수정</h3>
				</div>
			</div>
			<div class="row">
				<form class="form-horizontal" action="update.jsp" method="post">
					<input type="hidden" name="num" id="num" value="<%=num %>" />
					<div class="form-group">
						<label class="control-label col-sm-2" for="num">번호: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" value="<%=num %>" autocomplete="off" disabled />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">이름: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="name" id="name" autocomplete="off" value="<%=dto.getName() %>" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="addr">전화번호: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="phone" id="phone" autocomplete="off" value="<%=dto.getPhone() %>" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="text" class="btn btn-primary">수정확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>