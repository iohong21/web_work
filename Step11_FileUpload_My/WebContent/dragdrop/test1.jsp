<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			.box{
				width: 100px;
				height: 100px;
				background-color: yellow;
			}
			.drop-area{
				width: 300px;
				height: 300px;
				background-color: pink;
				margin: 0 atuo;
			}
		</style>
	</head>
	<body>
		<h3>drag and drop 테스트</h3>
		<div class="box" draggable="true">drag me</div>
		<div class="drop-area"></div>
	</body>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
	<script>
		$(".box").on("dragstart", function(e){
			$(this).text("dragging...");
		});
		$(".box").on("dragend", function(e){
			$(this).text("dragedn!");
		});
		$(".drop-area").on("dragover", function(e){
			e.preventDefault();		// 기본 이벤트 막기
			e.stopPropagation();	// 이벤트 전파 막기
		});
		$(".drop-area").on("drop", function(e){
			e.preventDefault();		// 기본 이벤트 막기
			e.stopPropagation();	// 이벤트 전파 막기
			$(this).text("something dropped!");
		});
	</script>
</html>