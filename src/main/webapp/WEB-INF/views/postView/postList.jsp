<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
*{margin:0;padding:0;}
.post-wrapper{
	width:1400px;
	margin:0 auto;
}
.post-header{
	margin-top:100px;
	text-align:center;
}
.post-header span{
	font-size:1.8rem;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="post-wrapper">
	<div class="post-header">
	<h1>자유게시판</h1>
	<span>규장각 회원들의 자유로운 소통 공간입니다.</span>
	</div>
	<div class="post-content">
		<table class="table">
			<thead>
				<tr>
					<td>No.</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>댓글 수</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="post">
					<tr>
						<td>${post.postNo }</td>
						<td>${post.postTitle }</td>
						<td>${post.postWriter }</td>
						<td>${post.postDate }</td>
						<td>${ }</td>
						<td>${post.pViewcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button>글쓰기</button>
		</div>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>