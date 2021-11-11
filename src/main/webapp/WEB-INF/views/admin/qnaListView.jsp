<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의관리</title>
<link rel="stylesheet" href="css/style.css" />

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
}
.talbe{padding : 10px;}
.table thead tr td:first-child{width:15%; text-align:center;}
.table thead tr td:nth-child(2){text-align:center;}
.table thead tr td:last-child{width:15%; text-align:center;}
.table tbody tr td:first-child{width:15%; text-align:center;}
.table tbody tr td:last-child{width:15%; text-align:center;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userType ne '관리자' }">
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
	
	<c:if test="${userType eq '관리자'}">
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
			<div class="qna-con">
				<table class="table">
					<thead>
						<tr>
							<td>문의번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>문의 등록일</td>
							<td>처리상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qList }" var="qList">
							<tr>
								<td>${qList.qnaNo }</td>
								<td><a href="qnaAnswer.do?qnaNo=${qList.qnaNo }">${qList.qnaTitle }</a></td>
								<td>${qList.userId }</td>
								<td>${qList.qnaWriteDate }</td>
								<td>${qList.replyState }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5">
								<form action="qnaSearch.do" method="get">
									<select name="searchCondition">
										<option value="title" <c:if test="${search.searchCondition eq 'title' }">selected</c:if>>제목</option>
										<option value="writer" <c:if test="${search.searchCondition eq 'writer' }">selected</c:if>>작성자</option>
										<option value="state" <c:if test="${search.searchCondition eq 'state' }">selected</c:if>>처리상태</option>
									</select>
									<input type="text" name="searchValue" value="${search.searchValue }">
									<input type="submit" value="검색">
								</form>
							</td>
						</tr>
					</tbody>
				</table>
				<c:if test="${pn eq '0'}">
					<div align="center">
						<c:url var="before" value="qnaSearch.do">
							<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
							<c:param name="searchValue" value="${search.searchValue }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage <= 1 }">
							[이전]
						</c:if>
						<c:if test="${pi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="qnaSearch.do">
								<c:param name="page" value="${p }"></c:param>
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="rgba(90,94,185)" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">[${p }]</a>&nbsp;
							</c:if>
						</c:forEach>
						<c:url var="after" value="qnaSearch.do">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
							<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
							<c:param name="searchValue" value="${search.searchValue }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if>
						<c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${pn eq '1'}">
					<div align="center">
						<c:url var="before" value="adQnaList.do">
							<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage <= 1 }">
							[이전]
						</c:if>
						<c:if test="${pi.currentPage > 1 }">
							<a href="${before }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="adQnaList.do">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="rgba(90,94,185)" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">[${p }]</a>&nbsp;
							</c:if>
						</c:forEach>
						<c:url var="after" value="adQnaList.do">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage >= pi.maxPage }">
							[다음]
						</c:if>
						<c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if>
					</div>
				</c:if>
			</div>
		</article>
		<br>
		<br>
	</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>

</script>
</body>
</html>