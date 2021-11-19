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
			<div class="side">
				<ul>
				<li>마이페이지</li>
				<li class="lo" onclick="location.href='mypageInfo.do?userId=${userId }'">회원정보</li>
				<li class="lo" onclick="leaveAccount.do?userId=${userId }">회원탈퇴</li>
				<li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
				<li class="lo sideact" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
				<li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
				<li class="lo" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
				<li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
				<li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
				<li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
				<li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">문의하기</li>
				</ul>
			</div>	
		</aside>
<!-- 내용 -->
			<article class="mainContent"><br>
<!-- 타이틀 -->
				<h2 id="mainTitle"><b>도서 예약 내역</b></h2><br><br><br>
				<div id="book-count">
					<p>${ pi.totalCount }권의 책이 있습니다.</p>
				</div>
<!-- 본문 -->
				<table>
					<tr align="center">
						<th></th>
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
					<tr>
						<td colspan="8" align="right">
							<button type="button">선택도서 일괄 예약취소</button>
						</td>
					</tr>
					<tr align="center" height="20">
						<td colspan="8">
							<c:url var="before" value="/bookingList.do">
								<c:param name="page" value="${ pi.currentPage - 1 }"></c:param>
								<c:param name="userId" value="${ rsv.userId }"></c:param>
							</c:url>
							<c:if test="${ pi.currentPage <= 1 }">이전</c:if>
							<c:if test="${ pi.currentPage > 1 }"><a href="${ before }">이전</a></c:if>
							<c:forEach var="p" begin="${ pi.startNavi }" end="${ pi.endNavi }">
								<c:url var="pagenation" value="/bookingList.do">
									<c:param name="page" value="${ p }"></c:param>
									<c:param name="userId" value="${ rsv.userId }"></c:param>
								</c:url>
								<c:if test="${ p eq pi.currentPage }">
									<font color="red" size="4">[${ p }]</font>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<a href="${ pagenation }">${ p }</a>&nbsp;
								</c:if>
							</c:forEach>
							<c:url var="after" value="/bookingList.do">
								<c:param name="page" value="${ pi.currentPage + 1 }"></c:param>
								<c:param name="userId" value="${ rsv.userId }"></c:param>
							</c:url>
							<c:if test="${ pi.currentPage >= pi.maxPage }">다음</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }"><a href="${ after }">다음</a></c:if>
						</td>
					</tr>
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