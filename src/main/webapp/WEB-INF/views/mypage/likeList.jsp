<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 도서 내역</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
<link href="resources/css/popupStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
	position : relative;
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
.checkbox{
	width : 3%;
	float: left;
}
.photo{
	width : 25%;
	float: left;
	border : 0.5px solid;
	margin : 2%;
}
.description{
	width : 60%;
	float: left;
	margin-left : 2%;
	margin-top : 2%;
}
.btn-area{
	text-align : center;
}
input[type=checkbox] {
transform : scale(1.5);
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
				<b>관심 도서 내역</b>
			</h2>
			<br><br><br>
				<div align="right">
					<span>전체 선택</span>&nbsp;&nbsp;
					<input type="checkbox"  value="" >&nbsp;
				</div><br><br>
			<!-- 본문 -->
			<br> <br>
			<div class="card">
				<div class="checkbox">
					<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
				</div>
				<div class="photo">
					<img src="https://s-media-cache-ak0.pinimg.com/236x/3b/36/ca/3b36ca3afe0fa0fd4984b9eee2e154bb.jpg" width="160px" height="220px">
				</div>
				<div class="description">
					<h3>달러구트 꿈 백화점</h3>
					<p><span>팩토리나인</span>&nbsp;|&nbsp;<span>이미예</span>&nbsp;|&nbsp;<span>2021.07.27</span></p>
					<br><br><br>	
				</div>
			</div>
							<!-- 버튼 --><br><br><br>
				<div class="btn-area">
					<a href="#layer" class="check-btn"><button class="btn btn-danger" id="withdraw-btn">삭제하기</button></a>
				</div>
				
				<!-- 삭제 경고창 -->
				<div id="layer" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!-- 내용 -->
						<h4 class="ctxt mb20"><b>정말로 삭제하시겠습니까?</b></h4>
						<div class="btn-r">
							<a href="#" class="btn-layerClose"><button class="btn btn-danger">삭제</button></a> <a
								href="#" class="btn-layerClose"><button class="btn btn-secondary" >취소</button></a>
						</div>
						<!--  // 내용 끝 -->
					</div>
				</div>
			</div>
		</article>
		<br><br>
	</section>

<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	$(".check-btn").click(function(){
        var $href = $(this).attr("href");
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass("dimBg"); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $(".dim-layer").fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find("a.btn-layerClose").click(function(){
            isDim ? $(".dim-layer").fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $(".layer .dimBg").click(function(){
            $(".dim-layer").fadeOut();
            return false;
        });

    }

	</script>
</body>
</html>