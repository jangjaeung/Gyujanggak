<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link href="resources/css/headerStyle.css" rel="stylesheet">


</head>
<body>
	<header>
		<div class="wrapper">
			<div class="wrapper left" id="left">
					<a href="home.do"><img src="resources/img/notextLogo.jpg" alt="logo" id="header-logo"></a>&nbsp;&nbsp;
					<a href="home.do"><h3 id="logoText" style="font-weight:bold;">다올대학교 도서관 규장각</h3></a>
			</div>
			<c:if test="${sessionScope.loginUser eq null }">
				<div class="wrapper right" id="right"><a href="loginView.do" >LOGIN</a></div>
			</c:if>
			<c:if test="${sessionScope.loginUser ne null and loginUser ne ''}">
				<div class="wrapper right" id="right"><a href="logout.do" >LOGOUT</a></div>
			</c:if>
		</div>
		<div class="nav" id="nav">
			<ul class="menu" id="menu">
				<li><a href="#">도서관 소개</a>
					<ul>
						<li><a href="#">규장각 인사말</a></li>
						<li><a href="#">규장각 연혁</a></li>
						<li><a href="#">규장각 오시는 길</a></li>
						<li><a href="#">규장각 시설 이용 안내</a></li>
					</ul>
				</li>
				<li><a href="#">도서관이용</a>
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="postList.do">자유게시판</a></li>
						<li><a href="readingRoom.do">열람실 예약</a></li>
						<li><a href="studyRoom.do">스터디룸 예약</a></li>
					</ul>
				</li>
				<li><a href="#">자료검색</a>
					<ul>
						<li><a href="#">간략 검색</a></li>
						<li><a href="#">상세 검색</a></li>
						<li><a href="#">주제별 검색</a></li>
						<li><a href="#">신착 자료</a></li>
						<li><a href="#">대출 베스트</a></li>
					</ul>				
				</li>
				<li>
					<a href="mypageInfo.do?userId=${loginUser.userId }">마이페이지</a>
					<ul>
						<li><a href="mypageInfo.do?userId=${loginUser.userId }">회원정보</a></li>
						<li><a href="leaveAccount.do?userId=${loginUser.userId }">회원탈퇴</a></li>
						<li><a href="lendingStatus.do?userId=${loginUser.userId }">나의 대출 내역</a></li>
						<li><a href="bookingList.do?userId=${loginUser.userId }">도서 예약 내역</a></li>
						<li><a href="wishList.do?userId=${loginUser.userId }">희망 도서 신청</a></li>
						<li><a href="likeList.do?userId=${loginUser.userId }">관심도서 내역</a></li>
						<li><a href="tasteSurvey.do?userId=${loginUser.userId }">취향 분석 설문</a></li>
						<li><a href="readingroomHistory.do?userId=${loginUser.userId }">시설 이용 내역</a></li>
						<li><a href="#">문의하기</a></li>
					</ul>
<!-- 					<a href="#">관리자페이지</a>
					<ul>
						<li><a href="#">회원관리</a></li>
						<li><a href="#">도서관리</a></li>
						<li><a href="#">문의관리</a></li>
						<li><a href="#">신고관리</a></li>
						<li><a href="#">대출통계</a></li>
					</ul> -->
				</li>
				
			</ul>
		</div>
	</header>
</body>
</html>