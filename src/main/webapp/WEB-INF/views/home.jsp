<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet" href="/resources/mainPage/css/mainPage.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
	<jsp:include page="common/header.jsp"></jsp:include>
	<div>
		<span style="font-size:8rem;">&nbsp;</span>
	</div>
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
		<form action="/searchSimple.do" method="get">
			<div class="search-wrap">
				<select name="searchCondition" id="" class="search__select" style ="width:20%;height:100%;">
					<option value="title">도서명</option>
	                <option value="writer">저자</option>
	                <option value="publisher">출판사</option>
				</select> <input type="text" name="searchValue" id="" class="search" style="width:79%;height:100%;" placeholder="검색어 입력">
				<i class="material-icons" style="position:absolute; z-index:199; margin-left:-30px; margin-top:13px; cursor:pointer;">search</i>
				<input type="submit" value="검색" id="sbt" style="display:none;">
			</div>
		</form>
	</div>
	<div class="main-wrapper">
		<div class="nav-area">
			<ul>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo1.png" alt=""> <span>도서검색</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo2.png" alt=""> <span>시설이용</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo3.png" alt=""> <span>공지사항</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo4.png" alt=""> <span>이용증</span>
					</div>
				</li>
				<li>
					<div class="nav-logo">
						<img src="/resources/mainPage/img/logo5.png" alt=""> <span>이용시간</span>
					</div>
				</li>
			</ul>
		</div>
		<div class="taste-area">
			<div class="taste-kate">
				<ul>
					<li class="kate">사서 추천도서</li>
					<li class="kate active">신간 도서</li>
				</ul>
			</div>
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<c:forEach items="${bList }" var="bList">
						<div class="swiper-slide">
							<div class="cont">
								<c:url var="bDetail" value="/bookDetail.do">
	                    			<c:param name="bookNo" value="${bList.bookNo }"></c:param>
	                    		</c:url>
								<a href="${bDetail }" style="text-decoration: none;">
									<img class="" src="/resources/bookcover/${bList.bookCover }" alt="">
								</a>
							</div>
						</div>
					</c:forEach>
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
 	 <jsp:include page="common/footer.jsp"></jsp:include>
 	 <script>
 	const showing_class = "showing";
	const firstslide = document.querySelector(".slider_item:first-child");

	function slide() {
		const currentSlide = document.querySelector(".showing");
	    if(currentSlide){
	        currentSlide.classList.remove(showing_class);
	        const nextSlide = currentSlide.nextElementSibling;
	        if(nextSlide){
	            nextSlide.classList.add(showing_class);
	        } else {
	            firstslide.classList.add(showing_class);
	        }
	        
	    } else {
	        firstslide.classList.add(showing_class);
	    }
	}
	slide();
	setInterval(slide, 4000)

	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 3,
		spaceBetween : 30,
		loop : true,
		autoplay : {
			delay : 3000,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
		scrollbar : {
			el : '.swiper-scrollbar',
		}
	});
	$(".material-icons").on("click",function(){
		$("#sbt").click();
	});
 	 </script>
</body>
</html>