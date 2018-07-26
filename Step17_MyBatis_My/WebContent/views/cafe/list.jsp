<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/views/cafe/list.jsp</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
		<style>
			.page_display a{
				font-size: 20px;
				text-decoration: none;
				color: #000;
			}
			.page_display a.active{
				font-size: 20px;
				font-weight: bold;
				color: red;
				text-decoration: underline;
			}
			.page_display a.muted{
				color: #cecece;
			}
			.page_display a.fontSize20{
				font-size: 20px;
			}
		</style>
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
			
			<a href="private/insertform.do">새글 작성</a>
			<h3>카페글 목록 입니다.</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.num }</td>
							<td>${dto.writer }</td>
							<td><a href="detail.do?num=${dto.num }&condition=${condition }&keyword=${keyword }">${dto.title }</a></td>
							<td>${dto.viewCount }</td>
							<td>${dto.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징 처리 -->
			<nav class="text-center" aria-label="...">
				 <ul class="pagination">
				 	<c:choose>
				 		<c:when test="${startPageNum ne 1 }">
						 	<li class="page-item">
		      			<a class="page-link" href="list.do?pageNum=${startPageNum-1}&condition=${condition }&keyword=${keyword}">&laquo;<span class="sr-only">Previous</span></a>
		    			</li>
				 		</c:when>
				 		<c:otherwise>
						 	<li class="page-item  disabled">
		      			<a class="page-link" href="javascript:">&laquo;<span class="sr-only">Previous</span></a>
		    			</li>
				 		</c:otherwise>
				 	</c:choose>
				 	
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
						<c:choose>
							<c:when test="${i eq pageNum }">
								<li class="page-item active">
						      <a class="page-link" href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i } <span class="sr-only">(current)</span></a>
						    </li>								
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>				 	
				 	
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount }">
							<li class="page-item">
					      <a class="page-link" href="list.do?pageNum=${endPageNum+1}&condition=${condition}&keyword=${keyword}">&raquo;<span class="sr-only">Next</span></a>
					    </li>				 	
						</c:when>
						<c:otherwise>
							<li class="page-item disabled">
					      <a class="page-link" href="javascript:">&raquo;<span class="sr-only">Next</span></a>
					    </li>				 	
						</c:otherwise>
					</c:choose>
				 </ul>
			</nav>
			
			<!-- keyword 검색어 form -->
			<form action="list.do" method="post">
				<label for="condition">검색조건</label>
				<select name="condition" id="condition"">
					<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
					<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어..." value="${keyword }" />
				<button type="submit">검색</button>		
			</form>
			<c:choose>
				<c:when test="${not empty keyword }">
					<p><strong>${keyword }</strong> 검색어로 검색된<strong>${totalRow }</strong> 개의 글이 있습니다.</p>
				</c:when>
				<c:otherwise>
					<p><strong>${totalRow }</strong> 개의 글이 있습니다.</p>
				</c:otherwise>
			</c:choose>
		</div>
		
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