<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #276873;
	background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
	background-color:#599bb3;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:13px 32px;
	text-decoration:none;
	text-shadow:0px 1px 0px #3d768a;
}
.myButton:hover {
	background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
	background-color:#408c99;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>

</head>
<body>


<jsp:include page="../common/header.jsp"></jsp:include>
	<br><hr style="margin-top:13%">
	<div class="container" style="margin-bottom: 15%;">
		<h1 style="text-align:center;margin-bottom: 8%;">도서관리</h1>

        <button class="btn btn-default" onclick="location.href='bookListView.do'">장서 목록</button>
        <button class="btn btn-default" onclick="location.href='statusList.do'">대출 현황</button>
        <button class="btn btn-default" onclick="location.href='wishbookList.do'">희망 도서 접수 목록</button>
        <button class="btn btn-default" onclick="location.href='bookParcelList.do'">대출도서 택배 신청 목록</button>

        <hr>
		
		<table class="table table-striped" >
			<thead>
				<tr>
					<th>No.</th>
					<th>도서 명</th>
					<th>저자</th>
                    <th>출판사</th>
                    <th>회원 ID</th>
                    <th>신청일</th>
                    <th>처리상태</th>
                    <th>처리</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty bList }">
			<c:forEach items="${bList }" var="wishbook">
                    <input type="hidden" id="wishValue" value="${wishbook.bookName }">
                    <input type="hidden" id="wishValue1" value="${wishbook.bookWriter }">
                    <input type="hidden" id="wishValue2" value="${wishbook.publisher }">
				<tr>
                    <td>${wishbook.applyNo }</td>
					<td>${wishbook.bookName }</td>
					<td>${wishbook.bookWriter }</td>
					<td>${wishbook.publisher }</td>
                    <td>
                    <a href="mypageInfo.do?userId=${wishbook.userId }">${wishbook.userId }</a>
                    </td>
                    <td>${wishbook.applyDate }</td>
                    <td>${wishbook.applyStatus }</td>
                    <td>
                    <a href="wishbookEnroll.do?bookName=${wishbook.bookName}&bookWriter=${wishbook.bookWriter}&publisher=${wishbook.publisher}&applyNo=${wishbook.applyNo}">등록</a>
                    </td>
				</tr>
		
		
				
			</c:forEach>
			</c:if>
				
				<tr align="center" height="20">
			
			<td colspan="8">
				<c:url var="before" value="wishbookList.do">
					<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage <= 1}">
					[이전]
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="wishbookList.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi. currentPage }">
						<font color="#408c99" size="3">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi. currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<c:url var="before" value="wishbookList.do">
					<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<a href="${after }">[다음]</a>
				</c:if>
			</td>
		</tr>
			</tbody>
		</table>

		

	</div>
  		<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
</body>
</html>