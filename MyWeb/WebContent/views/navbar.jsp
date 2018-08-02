<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 
			<div class="navbar navbar-inverse mainbar">
				<div class="navbar-header">
					<ul class="nav navbar-nav">
						<li class='<c:if test="${active eq 'home' }">active</c:if>'>
							<a href="${pageContext.request.contextPath }/main.do">Home</a>
						</li>
									
						<c:choose>
							<c:when test="${empty id }">
								<li class='<c:if test="${active eq 'login' }">active</c:if>'>
									<a href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>
								</li>
								
								<li class='<c:if test="${active eq 'member' }">active</c:if>'>
									<a href="${pageContext.request.contextPath }/users/memberform.do">회원가입</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class='<c:if test="${active eq 'member' }">active</c:if>'>
									<a href="${pageContext.request.contextPath }/users/memberlist.do">회원 목록</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<li class='<c:if test="${active eq 'board' }">active</c:if>'>
							<li><a href="${pageContext.request.contextPath }/board/list.do">게시판</a></li>
						</li>
						<li class='<c:if test="${active eq 'room' }">active</c:if>'>
							<li><a href="${pageContext.request.contextPath }/room/list.do">자료실</a></li>
						</li>
					</ul>
				</div>
			</div>
