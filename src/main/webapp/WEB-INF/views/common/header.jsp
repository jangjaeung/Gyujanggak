<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="wrapper left">
					<a href="home.do"><img src="resources/img/notextLogo.jpg" alt="logo" id="logo"></a>
					<a href="home.do"><h3 id="logoText">&nbsp;&nbsp;다올대학교 도서관 규장각</h3></a>
			</div>
			<div class="wrapper right"> LOGIN </div>
		</div>
		<div class="nav">
			<ul class="menu">
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
						<li><a href="#">스터디룸 예약</a></li>
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
				<li><a href="mypageMain.do">마이페이지</a></li>
			</ul>
		</div>
	</header>
</body>
</html>