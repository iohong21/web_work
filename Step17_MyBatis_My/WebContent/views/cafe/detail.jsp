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
				box-shadow: 5px 5px #888888;
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
				&nbsp;&nbsp;
				<c:set var="isNotDelete" value="yes" />
				<a href="javascript: deleteConfirm()">삭제</a>
				<script>
					function deleteConfirm() {
						var isDelete = confirm("글을 삭제 하시겠습니까?");
						if(isDelete) {
							${isNotDelete }="no";
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
			<c:if test="${isNotDelete eq 'yes' }">
				<a href="list.do?pageNum=${pageNum }&condition=${condition }&keyword=${keyword }">글 목록 보기</a>
			</c:if>
			<!-- 댓글에 관련된 UI -->
			<div class="comments">
				<c:forEach var="tmp" items="${commentList }">
					<div class="comment" style="border: 1px solid gray; margin-left: ${tmp.num eq tmp.comment_group ? 0 : 20}px">
						<p>${tmp.writer }</p>
						<p>${tmp.content }</p>
					</div>
				</c:forEach>
				<br /><br />
				<!-- 원글에 댓글을 작성할수 있는 폼 -->
				<div class="comment_form">
					<form action="comment_insert.do" method="post" id="commentForm">
						<input type="hidden" name="writer" value="${id }" />
						<input type="hidden" name="ref_group" value="${dto.num }" />
						<input type="hidden" name="target_id" value="${dto.writer }" />
						<textarea name="content" cols="70" rows="3" style="resize: none;"></textarea>
						<button type="submit">등록</button>
					</form>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			// 로그인 했는지 여부
			//var isLogin = ${empty id ? false : true };
			var isLogin = ${isLogin};
			
			// 댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
			$("#commentForm").on("submit", function(){
				if(!isLogin) {
					var isGoLogin = confirm("로그인 하시겠습니까?");
					if(isGoLogin) {
						location.href = "${pageContext.request.contextPath }/users/loginform.do?url=" 
								          + "${pageContext.request.contextPath}"
								          + "/cafe/detail.do?num=${dto.num}&pageNum=${pageNum}";
					}
					return false;
				}
			});
		</script>
	</body>
</html>