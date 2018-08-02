<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<div class="container">
			<h3>사진 Gallery 입니다.</h3>
			<c:choose>
				<c:when test="${not empty id}">
					사진 올리기<a href="private/upload_form.do"><i class="glyphicon glyphicon-upload"></i></a><br/>
					<c:if test="${not empty list}">
						<c:forEach var="dto" items="${list}">
							<div class="col-xs-3 col-sm-3">
								<h4>${dto.caption }</h4>
								<img src="${pageContext.request.contextPath }/${dto.imagePath}" 
									   class="img-responsive img-thumbnail" 
									   draggable="false"/>
								<p>작성자: <strong>${dto.writer }</strong></p>
								<p>등록일: <strong>${dto.regdate }</strong></p>
							</div>
						</c:forEach>
					</c:if>				
				</c:when>
				<c:otherwise>
					<h3><a href="${pageContext.request.contextPath }/users/loginform.do">로그인을 하셔야 합니다.</a></h3>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>