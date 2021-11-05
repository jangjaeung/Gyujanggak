<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<style>
	*{margin:0;padding:0}
	header{top:0}
	footer{bottom:0}
	#wrap{width:1400px;height:800px;margin:0 auto;margin-top:200px}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="wrap">
		<input type="text">
		<textarea></textarea>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>