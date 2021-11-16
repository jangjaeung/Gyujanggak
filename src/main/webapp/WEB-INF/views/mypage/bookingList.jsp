<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 예약 내역 ｜ 다올대학교 도서관</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../../../resources/css/bookingList.css">
<script src="../../../resources/js/reservationBook.js"></script>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${sessionScope.userId eq null }">
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
	<c:if test="${sessionScope.userId ne null}">
		<input type="hidden" name="userId" value="${ sessionScope.userId }">
		<section>
<!-- 사이드메뉴 -->
			<aside class="sideMenu">
				
			</aside>
<!-- 내용 -->
			<article class="mainContent"><br>
<!-- 타이틀 -->
				<h2 id="mainTitle"><b>도서 예약 내역</b></h2><br><br><br>
				<div id="book-count">
					<p>n 권의 책이 있습니다.</p>
				</div>
<!-- 본문 -->
				<table>
					<tr align="center">
						<th><input type="checkbox" name="" id=""></th>
						<th>No.</th>
						<th>도서명</th>
						<th>저자</th>
						<th>출판사</th>
						<th>예약일</th>
						<th>예약알림상태</th>
						<th>취소</th>
					</tr>
					<c:forEach items="${ rList }" var="rsv" varStatus="status">
						<c:url var="deleteRsv" value="/deleteReservation.do">
							<c:param name="rsvNo" value="${ rsv.rsvNo }"></c:param>
							<c:param name="userId" value="${ rsv.userId }"></c:param>
						</c:url>
						<c:url var="bDetail" value="/bookDetail.do">
                    		<c:param name="bookNo" value="${ rsv.book.bookNo }"></c:param>
                    	</c:url>
						<tr>
							<td><input type="checkbox" name="" id=""></td>
							<td>${ status.count }</td>
							<td><a href="${ bDetail }">${ rsv.book.bookName }</a></td>
							<td>${ rsv.book.bookWriter }</td>
							<td>${ rsv.book.publisher }</td>
							<td>${ rsv.rsvDate }</td>
							<td>${ rsv.rsvState }</td>
							<td><button type="button" onclick="location.href='${ deleteRsv }';" id="delete-rsv">예약취소</button></td>
						</tr>
					</c:forEach>
				</table>
			</article>
			<br>
			<br>
		</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>