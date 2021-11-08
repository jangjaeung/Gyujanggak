<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 이용 내역</title>
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

.table td{
	text-align : left;
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
				<b>열람실 예약 조회</b>
			</h2>

			<!-- 본문 -->
			<br> <br><br>
			<table class="table">
				<colgroup>
						<col width="50px">
						<col width="550px">
						<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value=""></th>
						<th scope="col" colspan="2">예약내역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" ></th>
						<td>
							예약날짜 : 2021-10-21 <br>
							예약시간 : 9:00 ~ 15:00
						</td>
						<td>
							<a href="#layer" class="check-btn"><button class="btn btn-danger btn-sm" id="withdraw-btn">예약취소</button></a></a>
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn-area">
					<a href="#layer"><button class="btn btn-danger btn-sm" id="withdraw-btn">삭제</button></a>
				</div>
				
				
				<div id="layer" class="pop-layer">
				<!-- 예약취소 경고창 -->
				<div class="pop-container">
					<div class="pop-conts">
						<!-- 내용 -->
						<h4 class="ctxt mb20"><b>정말로 취소하시겠습니까?</b></h4>
						<div class="btn-r">
							<a href="#" class="btn-layerClose"><button class="btn btn-danger">확인</button></a> <a
								href="#" class="btn-layerClose"><button class="btn btn-secondary" >취소</button></a>
						</div>
						<!--  // 내용 끝 -->
					</div>
				</div>
			</div>
		</article>

		<br>
		<br>

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