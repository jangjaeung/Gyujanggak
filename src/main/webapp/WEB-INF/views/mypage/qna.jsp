<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>

<style>
*{
	margin:0;
	padding : 0;
}
header{top:0}
footer{bottom:0}
#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}
.sideMenu{
	float: left;
	width: 25%;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 85%;
	display: grid;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.qna-con{
	width:1000px;
	min-height:500px;
}
table thead tr td{
	font-weight:bold;
	background-color:rgba(90,94,185);
	color:#fff;
	padding:10px;
}
.table thead tr td:first-child{width:15%; text-align:center;}
.table thead tr td:nth-child(2){text-align:center;}
.table thead tr td:last-child{width:15%; text-align:center;}
.table tbody tr td:first-child{width:15%; text-align:center;}
.table tbody tr td:last-child{width:15%; text-align:center;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userId eq null }">
	<section>
		<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="loginView.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
	
	<c:if test="${userId ne null}">
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
			
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>문의내역</b>
			</h2>
			<br><br>
			<div id="book-count">
				<p>*답변 대기 상태일때만 수정, 삭제 가능</p>
			</div>
			<div class="qna-con">
				<table class="table">
					<thead>
						<tr>
							<td>문의번호</td>
							<td>제목</td>
							<td>답변상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qList }" var="qList">
							<tr>
								<td>${qList.qnaNo }</td>
								<td><a href="qnaDetail.do?qnaNo=${qList.qnaNo }">${qList.qnaTitle }</a></td>
								<td>${qList.replyState }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button onclick="location.href='registQnaView.do?userId=${userId}'">문의 등록</button>
			</div>
		</article>
		<br>
		<br>
	</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>