<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 리스트 갯수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출현황</title>
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
	/*height : 250px;*/
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
.page-area{
	text-align :center;
}
.review{
	margin : 1%;
}
#review{
	float : right;;
}
.starRev{
	float : right;
	margin : 1%;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

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
				<b>대출 현황</b>
			</h2>
			<br><br><br>
			<c:if test="${empty lendingList }">
				<tr>
					<td colspan="6" align="center"> 대출 내역이 없습니다. </td>
				</tr>
			</c:if>
			
			<c:if test="${not empty lendingList }">
			<div id="book-count">
				<p><span>${pi.totalCount}</span> 권의 책이 있습니다.</p> 
			</div>
			<br> <br>
				<c:forEach items="${lendingList }" var="lending" varStatus="index">
				<!-- 본문 -->
				<br>
					<div class="card">
						<div class="photo">
							<img src="${pageContext.request.contextPath}/resources/bookcover/${lending.bookCover}" width="173.3px" height="220px">
						</div>
						<div class="description">
							<h3>${lending.bookName}</h3><input type="hidden" name="bookNo" value="${lending.bookNo }" id="bookNo">
							<p><span>${lending.publisher}</span>&nbsp;|&nbsp;<span>${lending.bookWriter}</span>&nbsp;|&nbsp;<span>${lending.bookYear}</span></p>
							<br>	
							<p>대출일 : ${lending.lendingBook.lendingDate }</p>
							<p>
								<c:if test="${lending.bookState eq '대출불가'}">반납예정일 : ${lending.lendingBook.returnDate}</c:if>
								<c:if test="${lending.bookState eq '대출가능'}">반납일자 : ${lending.lendingBook.returnDate}</c:if>
							</p>${review.userId }
							<br>
								<div class="btn-area">
									<c:if test="${lending.bookState eq '대출불가'}">
										<button class="btn btn-success ">연장하기</button>
									</c:if>
									<c:if test="${lending.bookState eq '대출가능'}">
											<button class="btn btn-info" id="reviewDetail">서평보기</button>
											<button class="btn btn-info" id="writeReview">서평쓰기</button>
									</c:if>
								</div>
							<br>
						</div>
						<c:if test="${lending.bookState eq '대출가능'}">
							<div class="review" id="reviewBoxWrite">
								<textarea rows="7" cols="92" placeholder="내용을 입력해주세요" name="reviewContents" id="reviewContents"></textarea>
								<div class="starRev">
									<span class="starR1 on" data-value="0.5">별1_왼쪽</span> <span class="starR2" data-value="1.0">별1_오른쪽</span>
									<span class="starR1" data-value="1.5">별2_왼쪽</span> <span class="starR2" data-value="2.0">별2_오른쪽</span>
									<span class="starR1" data-value="2.5">별3_왼쪽</span> <span class="starR2" data-value="3.0">별3_오른쪽</span>
									<span class="starR1" data-value="3.5">별4_왼쪽</span> <span class="starR2" data-value="4.0">별4_오른쪽</span>
									<span class="starR1" data-value="4.5">별5_왼쪽</span> <span class="starR2" data-value="5.0">별5_오른쪽</span>
									<input type="hidden" name="reviewStar" id="reviewStar">
									 <br> <br>
									<div class="btn-area">
										<button class="btn btn-info btn-sm" id="registerReview">등록</button>
										<button class="btn btn-info btn-sm" id="cancelReview">취소</button>
									</div>	
								</div>
							</div>
							<div class="review" id="reviewBoxView">
								<textarea rows="7" cols="92" placeholder="내용을 입력해주세요" name="reviewContents" id="modifyContents">${review.reviewContents }</textarea>
								<div class="starRev">
									<span class="starR1 on" data-value="0.5">별1_왼쪽</span> <span class="starR2" data-value="1.0">별1_오른쪽</span>
									<span class="starR1" data-value="1.5">별2_왼쪽</span> <span class="starR2" data-value="2.0">별2_오른쪽</span>
									<span class="starR1" data-value="2.5">별3_왼쪽</span> <span class="starR2" data-value="3.0">별3_오른쪽</span>
									<span class="starR1" data-value="3.5">별4_왼쪽</span> <span class="starR2" data-value="4.0">별4_오른쪽</span>
									<span class="starR1" data-value="4.5">별5_왼쪽</span> <span class="starR2" data-value="5.0">별5_오른쪽</span>
									<input type="hidden" name="reviewStar" id="reviewStar">
									 <br> <br>
									<div class="btn-area">
										<button class="btn btn-info btn-sm" id="modifyReview">수정</button>
										<button class="btn btn-info btn-sm" id="deleteReview">삭제</button>
										<button class="btn btn-info btn-sm" id="closeReview">닫기</button>
									</div>	
								</div>
							</div>							
						</c:if>
					</div>
			</c:forEach>
				<br><br>
				<div class="page-area">
					<c:url var="before" value="lendingStatus.do">
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="${before }">[이전]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="lendingStatus.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
						 	<font color = "#408c99" size="4">[${p }]</font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
						 	<a href="${pagination }">[${p }]</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:url var="after" value="lendingStatus.do">
						<c:param name="page" value="${pi.currentPage + 1 }">></c:param>
					</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after } ">[다음]</a>
					</c:if>
				</div>	
			
			</c:if>
		</article>
		<br>
		<br>
	</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
$(document).ready(function(){
	
	$("#reviewBoxView").hide();
	$("#reviewBoxWrite").hide(); //서평 박스 숨기기
	
	//서평쓰기 버튼 클릭시 보이기
	$("#writeReview").click(function(){
		$("#reviewBoxWrite").show();
		$(this).hide();
	});
	
	//취소 버튼 누르면 작성란 사라지고, 다시 서평쓰기 버튼 생성
	$("#cancelReview").click(function(){
		$("#reviewBoxWrite").hide();
		$("#writeReview").show();
	});
	
	
	$("#reviewDetail").click(function(){
		$("#reviewBoxView").show();
		$(this).hide();
	});
	
	
	$("#closeReview").click(function(){
		$("#reviewBoxView").hide();
		$("#reviewDetail").show();
	});
	
	
	//별점(색)
	$('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
		 $(this).addClass('on').prevAll('span').addClass('on');
		 var rating = $(this).attr('data-value');
		 $("#reviewStar").val(rating); //히든 인풋에 값 저장
		 console.log(rating);
		 return false;
	});
	
	//등록
	$("#registerReview").click(function(){
		var bookNo = $("#bookNo").val();
		var reviewContents = $("#reviewContents").val();
		var reviewStar = $("#reviewStar").val();
		console.log(bookNo);
		console.log(reviewContents);
		console.log(reviewStar);
		$.ajax({
			url : "registerReview.do", 
			type : "post",
			data : {
				"bookNo" : bookNo,
				"reviewContents" : reviewContents,
				"reviewStar" : reviewStar
			},
			success : function(data){
				if(data == "success"){
					location.href="lendingStatus.do"
				}else{
					alert("리뷰 등록 실패");
				}
			},
			error : function(request,status,error){
				/* alert("AJAX 통신 오류"); */
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	});	
	
	$("#reviewDetail").click(function(){
		var bookNo = $("#bookNo").val();
		var userId = '${sessionScope.userId}';
		$.ajax({
			url : "reviewDetail.do",
			type : "get",
			data : {
				"bookNo" : bookNo,
				"userId" : userId
			},
			dataType : "json",
			success : function(data){
				if(data.length>0){
					$("#modifyContents").text(data.reviewContents);
				}
			}
		})
	});

});


	

	

	
	
</script>
</body>
</html>