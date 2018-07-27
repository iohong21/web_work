<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

			<!-- 댓글에 관련된 UI -->   
			<div class="comments">
				<c:forEach var="tmp" items="${commentList }">
					<%--
					<div class="comment" style="margin-left: ${tmp.num eq tmp.comment_group ? 0 : 50}px">
					--%>
					<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:50px;"</c:if>>
						<c:if test="${tmp.num ne tmp.comment_group }">
							<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
						</c:if>
						<img src="${pageContext.request.contextPath }/resources/images/user_image.gif" />
						<span>${tmp.writer }</span>
						<span>${tmp.regdate }</span>
						<a href="javascript:" class="reply_link">답글</a> |
						<a href="">신고</a>
						
						<c:if test="${tmp.num ne tmp.comment_group }">
							<br /><strong class="muted">${tmp.target_id }</strong>
						</c:if>
						
						<p>${tmp.content }</p>
						<form action="comment_insert.do" method="post">
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${id }"/>
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea name="content"></textarea>
							<button type="submit">등록</button>
						</form>						
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
		