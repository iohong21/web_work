<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/file/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	</head>
	<body>
		<div class="container">
			<c:choose>
				<c:when test="${not empty id }">
					<p><strong>${id } </strong> 로그인중...</p>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
				</c:otherwise>
			</c:choose>
			
			<a href="private/upload_form.do">새파일 업로드</a>
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
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.num }</td>
							<td>${dto.writer }</td>
							<td>${dto.title }</td>
							<td>${dto.orgFileName }
								<a href="download.do?num=${dto.num }">
									<i class="glyphicon glyphicon-download pull-right"></i>
								</a>
							</td>
							<td>${dto.downCount }</td>
							<td>${dto.regdate }</td>
							<td>
								<c:if test="${dto.writer eq id }">
									<a href="javascript: deleteConfirm(${dto.num });">삭제</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<p>
				<c:set var="snum" value="1" />
				<c:if test="${startPageNum ne snum }">
					<a href="list.do?pageNum=${startPageNum-1}"><span style="font-size: 20px">&lt;</span>&nbsp;&nbsp;</a>
				</c:if>
				<c:forEach var="page" begin="${startPageNum }" end="${endPageNum }" step="1">
					<c:choose>
						<c:when test="${page eq pageNum }">
							<span style="color: red; font-size: 20px">${page }</span>
						</c:when>
						<c:otherwise>
							<a href="list.do?pageNum=${page }"><span style="font-size: 20px">${page }</span></a>
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;
				</c:forEach>
				<c:if test="${endPageNum ne totalPageCount }">
					<a href="list.do?pageNum=${endPageNum+1}"><span style="font-size: 20px">&gt;</span></a>
				</c:if>
			</p>
		</div>
		<p id="deleteInfo"></p>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			function deleteConfirm(num) {
				var isDelete = confirm(num + "번 파일을 삭제 하시겠습니까?");
				if(isDelete) {
					location.href = "private/delete.do?num=" + num;
				}
			}
		</script>
	</body>
</html>