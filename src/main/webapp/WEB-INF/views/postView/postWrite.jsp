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
	<form action="postRegister.do" method="post">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="postTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" size="50" name="postWriter" value="${sessionScope.userId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="postContents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>