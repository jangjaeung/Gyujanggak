<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
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
	width : 70%;
	position: relative;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table{
	width : 450px;
	align : center;
}
.table th{
	height : 45px;
	text-align : center;
	vertical-align:middle;
	margin: auto;
}
.table td{
	height : 45px;
	text-align : center;
	vertical-align:middle;
	margin: auto;
}
.btn-area{
	text-align : center;
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
				<b>회원 정보 수정</b>
			</h2>
			
			<!-- 본문 --><br><br>
				<table class="table table-borderless" align="center">
					<colgroup>
						<col width="50px">
						<col width="80px">
					</colgroup>
					<tr>
						<th style='vertical-align:middle;'>아이디  </th>
						<td colspan="2" style='vertical-align:middle;'>
							<input class="form-control" type="text" name="" value="" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control" type="text" name="" value="">
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호 확인  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="" value="">
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이름  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="" value="" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이메일  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" type="text" name="" value="" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>핸드폰번호  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control" value="01011111111" readonly>
						</td>
					</tr>
				</table>
				
			
				<!-- 버튼 --><br><br><br>
				<div class="btn-area">
					<a href="#layer" class="check-btn"><button class="btn btn-danger" id="withdraw-btn">탈퇴하기</button></a>
				</div>
				
				<!-- 삭제 경고창 -->
				<div id="layer" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!-- 내용 -->
						<h4 class="ctxt mb20"><b>정말로 탈퇴하시겠습니까?</b></h4>
						<div class="btn-r">
							<a href="#" class="btn-layerClose"><button class="btn btn-danger">탈퇴</button></a> <a
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
			
