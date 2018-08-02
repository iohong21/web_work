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
			/* 댓글에 댓글을 다는 폼은 일단 숨겨 놓기*/
			.comment form{
				display: none;
			}
			
			.comment{
				position: relative;
			}
			
			/* 댓글의 댓글 이미지 배치 */
			.comment .reply_icon{
				width: 8px;
				height: 8px;
				position: absolute;
				top: 10px;
				left: -15px;
			}
			.muted {
				color: #888;
			}
			
			.deleteComment{
				color: red;
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
				<tr>
					<th>글번호</th>
					<td>${dto.num }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.writer}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.regdate }</td>
				</tr>
			</table>


			<div class="content">${dto.content }</div>			
			<br />
			
			<!-- 댓글에 관련된 UI -->   
			<div class="comments">
				<ul>
					<c:forEach var="tmp" items="${commentList }">
						<c:choose>
							<c:when test="${tmp.num eq tmp.comment_group }">
								<li class="comment">
							</c:when>
							<c:otherwise>
								<li class="comment" style="margin-left: 50px; list-style-type: none">
								<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
							</c:otherwise>
						</c:choose>
						<!--  
						<li class="comment" style="margin-left: ${tmp.num eq tmp.comment_group ? 0 : 50}px">
							<c:if test="${tmp.num ne tmp.comment_group }">
								<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
							</c:if>
						-->
							
							<dl>
								<dt>
									<img src="${pageContext.request.contextPath }/resources/images/user_image.gif" />
									<span>${tmp.writer }</span>
									<span>${tmp.regdate }</span>
									
									<c:choose>
										<c:when test="${tmp.writer ne id }">
											<c:choose>
												<c:when test="${tmp.isdelete ne 'Y' }">
													<a href="javascript: " class="reply_link">답글</a>
												</c:when>
												<c:otherwise>
													<span class="muted">답글</span>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<span class="muted">답글</span>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${tmp.writer eq id }">
										  <c:choose>
										  	<c:when test="${tmp.isdelete ne 'Y' }">
													<a href="javascript: " class="reply_link">수정</a>
													<a href="comment_update.do?myNum=${tmp.num }&ref_group=${dto.num }&content=${tmp.content}&isDelete=Y">삭제</a>
												</c:when>
												<c:otherwise>
													<span class="muted">수정</span>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<span class="muted">수정</span>
										</c:otherwise>
									</c:choose>							
										
									<c:choose>
										<c:when test="${tmp.isdelete ne 'Y' }">
											<c:choose>
												<c:when test="${tmp.writer eq id }">
													<span class="muted"> | 신고</span>
												</c:when>
												<c:otherwise>
													<a href=""> | 신고</a>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<span class="muted"> | 신고</span>
										</c:otherwise>
									</c:choose>
								</dt>
								<dd>									
									<c:if test="${tmp.num ne tmp.comment_group }">
										<br /><strong class="muted">${tmp.target_id }</strong>
									</c:if>
									
									<c:choose>
										<c:when test="${tmp.isdelete eq 'N' }">
											<pre>${tmp.content }</pre>
										</c:when>
										<c:otherwise>
											<span class="deleteComment">삭제된 댓글 입니다.</span></pre>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
							<c:choose>
								<c:when	test="${tmp.writer eq id }">
									<form action="comment_update.do" method="post">
										<input type="hidden" name="myNum" value="${tmp.num }"/>
								</c:when>
								<c:otherwise>
									<form action="comment_insert.do" method="post">
								</c:otherwise>
							</c:choose>
								<input type="hidden" name="isDelete" value="N"/>
								<!-- 덧글 작성자 -->
								<input type="hidden" name="writer" value="${id }"/>
								<!-- 덧글 그룹 -->
								<input type="hidden" name="ref_group" value="${dto.num }" />
								<!-- 덧글 대상 -->
								<input type="hidden" name="target_id" value="${tmp.writer }" />
								<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
								<textarea class="replyText" name="content"><c:if test="${tmp.writer eq id }">${tmp.content }</c:if></textarea>
								<button type="submit">등록</button>
							</form>						
						</li>
					</c:forEach>
				</ul>
				<br /><br />
				<!-- 원글에 댓글을 작성할수 있는 폼 -->
				<div class="comment_form">
					<form action="comment_insert.do" method="post" id="commentForm" >
						<input type="hidden" name="writer" value="${id }" />
						<input type="hidden" name="ref_group" value="${dto.num }" />
						<input type="hidden" name="target_id" value="${dto.writer }" />
						<textarea id="replyText" name="content" cols="70" rows="3" style="resize: none;"  <c:if test="${empty id }">placeholder="로그인 하세요..."</c:if> ></textarea>
						<button type="submit">등록</button>
					</form>
				</div>
			</div>	
			<br /><br />
			<a href="list.do?pageNum=${pageNum }&condition=${condition }&keyword=${keyword }">글 목록 보기</a>
			<br /><br />
		</div>
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			// 로그인 했는지 여부
			//var isLogin = ${empty id ? false : true };
			var isLogin = ${isLogin};
			
			// 댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
			$(".comment_form > form, .comment form").on("submit", function(){
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

			$(".comment .reply_link").click(function(){
				var orgText = $(this).text();
				if(orgText == "답글취소") {
					$(this).text("답글");
				} else if(orgText == "수정취소") {
					$(this).text("수정");
				} else if(orgText == "답글") {
					$(this).text("답글취소");
				} else {
					$(this).text("수정취소");
				}
				
				$(this)
				.parent().parent().parent()
				.find("form")
				.slideToggle(100);
			});
			
		</script>
	</body>
</html>