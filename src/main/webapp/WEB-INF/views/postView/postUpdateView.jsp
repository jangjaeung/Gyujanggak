<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
*{margin:0;padding:0}
header{top:0}
footer{bottom:0}
#wrap{width:1400px;height:800px;margin:0 auto;margin-top:200px}
input{outline:none;}
textarea{outline:none;resize:none;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="wrap">
	<form action="postUpdate.do" method="post">
	<input type="hidden" name="postNo" value="${post.postNo }">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="postTitle" value="${post.postTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" size="50" name="postWriter" value="${post.postWriter }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="postContents">${post.postContents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		function deletePost(){
			location.href="deletePost.do";
		}
	</script>
</body>
</html>