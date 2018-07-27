<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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