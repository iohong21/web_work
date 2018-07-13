<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			#dropThis{
				width: 300px;
				height: 300px;
				border: 1px dashed blue;
				text-align: center;
			}		
		</style>
	</head>
	<body>
		<form action="upload" method="post" id="myForm">
			<div id="dropThis" class="text-center">여기에 놓으세요</div>
		</form>				 
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
		<script>
			$("#dropThis").on("dragover", function(e){
				e.preventDefault();		// 기본 이벤트 막기
				e.stopPropagation();	// 이벤트 전파 막기
			});
			
			$("#dropThis").on("drop", function(e){
				e.preventDefault();		// 기본 이벤트 막기
				e.stopPropagation();	// 이벤트 전파 막기
				
				console.log(e.originalEvent.dataTransfer.files[0]);

				var info = e.originalEvent.dataTransfer.getData("info");
				//$("<img />")
				//.attr("src", e.originalEvent.dataTransfer.files[0])
				//.appendTo(".drop-area");
				
				//console.log(e.originalEvent.dataTransfer.files[0].path)
				
				$(this).text(info);
			});
		</script>		
	</body>
</html>