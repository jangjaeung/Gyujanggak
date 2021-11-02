<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<style>
header{
	z-index : 200;
}
.menu li ul{
	background : white;
	display : none; /* 드롭메뉴 숨김 */
	height : auto;
	padding : 0;
	border : 0px;
	position : absoulute;
	width: 200px;
}
</style>
</head>
<body>
	<header>
		<div class="wrapper">
			<h3>다올대학교 도서관 규장각</h3>
			<div> <b>LOGIN</b> </div>
		</div>
		<div class="nav">
			<ul class="menu">
				<li><a>도서관 소개</a>
					<ul>
						<li><a>규장각 인사말</a></li>
						<li><a>규장각 연혁</a></li>
						<li><a>규장각 오시는 길</a></li>
						<li><a>규장각 시설 이용 안내</a></li>
					</ul>
				</li>
				<li><a>도서관이용</a>
					<ul>
						<li><a>공지사항</a></li>
						<li><a>자유게시판</a></li>
						<li><a>열람실 예약</a></li>
						<li><a>스터디룸 예약</a></li>
					</ul>
				</li>
				<li><a>자료검색</a>
					<ul>
						<li><a>통합검색</a></li>
						<li><a>주제별 검색</a></li>
						<li><a>신착 자료</a></li>
						<li><a>대출 베스트</a></li>
					</ul>				
				</li>
				<li><a>마이페이지</a></li>
			</ul>
		</div>
	</header>
</body>
</html>