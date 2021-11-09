<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 도서 내역</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
*{
	margin:0;
	padding : 0;
}
#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}

.sideMenu{
	float: left;
	width: 25%;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 95%;
	display: grid;
	text-align : center;
	position: relative;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table th{
	text-align : center;
}

.btn-area{
	text-align : center;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}


.pop-layer .btn-r {
	width: 100%;
	padding : 5px;
	text-align: right;
}

.btn-r button{
	font-size : 1.1em;
}

.pop-conts h4{
	text-align : left;
}
.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 600px;
	height: 430px;
	background-color: #F6F9FF;
	border: 5px solid #788DB6;
	z-index: 10;
}
</style>
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
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
			
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>희망 도서 신청</b>
			</h2>

			<!-- 본문 -->
			<br> <br><br>
			<table class="table">
				<colgroup>
						<col width="50px">
						<col width="150px">
						<col width="150px">
						<col width="400px">
						<col width="100px">
						<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">출판사</th>
						<th scope="col">저자</th>
						<th scope="col">도서명</th>
						<th scope="col">신청날짜</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>페이지</td>
						<td>오건영2북스</td>
						<td>부의 시나리오</td>
						<td>2021-10-21</td>
						<td>처리중</td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td>페이지</td>
						<td>오건영2북스</td>
						<td>부의 시나리오</td>
						<td>2021-10-21</td>
						<td>처리중</td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td>페이지</td>
						<td>오건영2북스</td>
						<td>부의 시나리오</td>
						<td>2021-10-21</td>
						<td>처리중</td>
					</tr>
				</tbody>
			</table>
			
			<!-- 버튼 -->
			<br><br><br>
				<div class="btn-area">
					<a href="#layer" class="check-btn"><button class="btn btn-warning" id="wish-btn">도서 신청</button></a>
				</div>
				
				<!-- 도서 신청 팝업 -->
				<form action="#">
					<div id="layer" class="pop-layer">
						<div class="pop-container">
							<div class="pop-conts">
								<!-- 내용 -->
								<h3><b>도서 신청</b></h3><br>
								<h4><b>도서명</b></h4><input class="form-control"  type="text" name="" value="">
								<h4><b>출판사</b></h4><input class="form-control"  type="text" name="" value="">
								<h4><b>저자</b></h4><input class="form-control"  type="text" name="" value="">
								<br><br>
								<div class="btn-r">
									<a href="#" class="btn-layerClose"><button class="btn btn-primary">완료</button></a>&nbsp;&nbsp; 
									<a href="#" class="btn-layerClose"><button class="btn btn-secondary" >취소</button></a>
								</div>
							<!--  // 내용 끝 -->
							</div>
						</div>
					</div>
				</form>
		</article>
		<br>
		<br>
	</section>
	</c:if>
	<jsp:include page="../common/chat.jsp"></jsp:include>
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