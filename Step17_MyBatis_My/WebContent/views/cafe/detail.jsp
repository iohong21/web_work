<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/cafe/listdetail.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<style>
			.content{
				width: 766px;
				border: 1px solid #888888;
				box-shadow: 5px 10px #888888;
				padding-left: 10px;
				padding-top: 5px;
			}
			.content img{
				max-width: 100%;
			}
			.table-bordered th{
				background-color: #A9A9A9;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<c:if test="${not empty keyword }">
				<p> 검색어 : <strong>${keyword }</strong> 에 대한 자세히 보기</p>
			</c:if>
			<ul class="pagination">
				<c:choose>
					<c:when test="${dto.prevNum eq 0}">
					 	<li class="page-item  disabled">
	      			<a class="page-link" href="javascript:">이전 글<span class="sr-only">Previous</span></a>
	    			</li>
					</c:when>
					<c:otherwise>
					 	<li class="page-item">
	      			<a class="page-link" href="detail.do?num=${dto.prevNum }&condition=${condition }&keyword=${keyword }">이전 글<span class="sr-only">Previous</span></a>
	    			</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.nextNum eq 0}">
					 	<li class="page-item  disabled">
	      			<a class="page-link" href="javascript:">다음 글<span class="sr-only">Next</span></a>
	    			</li>
					</c:when>
					<c:otherwise>
					 	<li class="page-item">
	      			<a class="page-link" href="detail.do?num=${dto.nextNum }&condition=${condition }&keyword=${keyword }">다음 글<span class="sr-only">Next</span></a>
	    			</li>
					</c:otherwise>
				</c:choose>
			</ul>
		
			<h3 class="text-center">글 자세히 보기 페이지</h3>
			
			<c:if test="${id eq dto.writer }">
				<a href="private/updateform.do?num=${dto.num }&condition=${condition }&keyword=${keyword }">수정</a>
				<a href="javascript: deleteConfirm()">삭제</a>
				<script>
					function deleteConfirm() {
						var isDelete = confirm("글을 삭제 하시겠습니까?");
						if(isDelete) {
							location.href = "private/delete.do?num=${dto.num}";
						}
					}
				</script>
			</c:if>
			
			<br />

			<table class="table table-bordered">
				<th>글번호</th>
				<td>${dto.num }</td>
				<tr></tr>
				<th>작성자</th>
				<td>${dto.writer}</td>
				<tr></tr>
				<th>제목</th>
				<td>${dto.title }</td>
				<tr></tr>
				<th>작성일</th>
				<td>${dto.regdate }</td>
				<tr></tr>
			</table>
			<div class="content">${dto.content }</div>			
			<br />
			<br />
			<a href="list.do">글 목록 보기</a>
			<br />
			<br />
		</div>
	</body>
</html>