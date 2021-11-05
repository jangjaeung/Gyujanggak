<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출현황</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />

<style>
.sidebar{
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
#book-count{
	border-bottom : 1px solid gray;
	font-size : 1.1em;
}
.card{
	width : 700px;
	height : 250px;
	border-bottom : 1px solid;
}
.photo{
	width : 25%;
	float: left;
	border : 0.5px solid;
	margin : 2%;
}
.description{
	width : 65%;
	float: left;
	margin-left : 2%;
	margin-top : 2%;
}
.btn-area{
	text-align : right;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sidebar">
			
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>대출 현황</b>
			</h2>
			<br><br><br>
			<div id="book-count">
				<p><span>4</span> 권의 책이 있습니다.</p>
			</div>
			
			<!-- 본문 -->
			<br> <br>
			<div class="card">
				<div class="photo">
					<img src="https://s-media-cache-ak0.pinimg.com/236x/3b/36/ca/3b36ca3afe0fa0fd4984b9eee2e154bb.jpg" width="160px" height="220px">
				</div>
				<div class="description">
					<h3>달러구트 꿈 백화점</h3>
					<p><span>팩토리나인</span>&nbsp;|&nbsp;<span>이미예</span>&nbsp;|&nbsp;<span>2021.07.27</span></p>
					<br>	
					<p>대출일 : 2021-10-20</p>
					<p>반납예정일 : 2021-10-20</p>
					<br>
						<div class="btn-area">
							<button class="btn btn-success ">연장하기</button>
<!-- 						<button class="btn btn-info">서평보기</button>
							<button class="btn btn-info">서평쓰기</button> -->
					</div>
				</div>
			</div>
		</article>

		<br>
		<br>

	</section>

<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>