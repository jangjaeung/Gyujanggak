<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/mainPage/css/mainPage.css">
<title>main</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<!-- 챗봇용 -->
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 스와이퍼 -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!-- 메인페이지 챗봇 스크립트 -->
<link rel="stylesheet" href="/resources/mainPage/css/chatbot.css">
<script type="text/javascript" src="/resources/js/chat.js"></script>

</head>
<body>
	<div class="search-area">
		<div id="slider">
			<div class="slider_item showing">
				<img src="/resources/mainPage/img/main_img1.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img2.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img3.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img4.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img5.jpg" alt="">
			</div>
			<div class="slider_item">
				<img src="/resources/mainPage/img/main_img6.jpg" alt="">
			</div>
		</div>
		<div class="search-wrap">
			<select name="" id="" class="select-box">
				<option value="" class="box-op">도서명</option>
				<option value="" class="box-op">저자</option>
				<option value="" class="box-op">출판사</option>
			</select> <input type="text" name="" id="" class="search">
		</div>
	</div>
	<div class="main-wrapper">
		<div class="nav-area">
			<ul>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo1.png" alt=""> <span>asd</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo2.png" alt=""> <span>asd</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo3.png" alt=""> <span>asd</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo4.png" alt=""> <span>asd</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo5.png" alt=""> <span>asd</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="taste-area">
			<div>
				<ul>
					<li>사서 추천도서</li>
					<li>신간 도서</li>
				</ul>
			</div>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">Slide 1</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
					<div class="swiper-slide">Slide 5</div>
					<div class="swiper-slide">Slide 6</div>
					<div class="swiper-slide">Slide 7</div>
					<div class="swiper-slide">Slide 8</div>
					<div class="swiper-slide">Slide 9</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
		<div class="keyword-area">
			<div class="keyword">
				<ul id="kate">
					<li id="pop">인기 검색어</li>
					<li id="many">다독자</li>
				</ul>
			</div>
			<div class="pop rank">
				<ol>
					<li>asd</li>
					<li>dsssss</li>
				</ol>
			</div>
			<div class="pop many">
				<ol>
					<li>asd</li>
					<li>dsssss</li>
				</ol>
			</div>
		</div>
  		<jsp:include page="./common/chat.jsp"></jsp:include>
 	 
	</div>
</body>
</html>