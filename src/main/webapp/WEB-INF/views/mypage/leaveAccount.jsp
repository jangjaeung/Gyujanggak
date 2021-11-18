<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/popupStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
*{
	margin:0;
	padding : 0;
}

#beforeLogin {
	margin-top: 5%;
	margin-bottom: 10%;
}

.sideMenu {
	float: left;
	width: 25%;
}

.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 75%;
	display: grid;

}

#mainTitle {
	color: #656379;
	text-align: center;
}

.table {
	margin-left : 5%;
	margin-right : 5%;
	width : 800px;
	min-width: 600px;
	justify-content : center;
}

.table th {
	height: 45px;
	text-align: center;
	vertical-align: middle;
	margin: auto;
}

.table td {
	height: 45px;
	text-align: center;
	vertical-align: middle;
	margin: auto;
}

.btn-area {
	text-align: center;
}

.centerText {
	margin: auto 0;
}

span.guide {
	display: none;
	margin-top : 10px;
}

span.ok {
	padding-top : 10px;
	color: green;
}

span.error {
	color: red;
}
.side{background-color:white; width:200px;position:fixed;left:3%;top:18%;}
.side ul li{line-height:50px;text-align:center; border:1px solid rgb(181,181,181);text-decoration: none;list-style: none;font-size:1.5rem; cursor:pointer;}
.side ul li:first-child{line-height:65px;font-weight:bold; font-size:2rem;background-color:#5a5eb9; color:#fff; cursor:Default;}
.side ul .lo:hover{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}
.sideact{background-color:rgb(155,158,213); color:#fff; font-weight:bold;}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${sessionScope.userId eq null }">
	<section>
		<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area">
				<br>	
				<a href="loginView.do" ><button type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
	<c:if test="${sessionScope.userId ne null}">
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
			<div class="side">
	            <ul>
	               <li>마이페이지</li>
	               <li class="lo" onclick="location.href='mypageInfo.do?userId=${userId }'">회원정보</li>
	               <li class="lo sideact" onclick="leaveAccount.do?userId=${userId }'" style="background-color:rgb(155,158,213); color:#fff; font-weight:bold;">회원탈퇴</li>
	               <li class="lo" onclick="location.href='lendingStatus.do?userId=${userId }'">대출내역</li>
	               <li class="lo" onclick="location.href='bookingList.do?userId=${userId }'">예약내역</li>
	               <li class="lo" onclick="location.href='wishList.do?userId=${userId }'">희망도서신청</li>
	               <li class="lo" onclick="location.href='likeList.do?userId=${userId }'">관심도서내역</li>
	               <li class="lo" onclick="location.href='tasteSurveyView.do?userId=${userId }'">취향분석</li>
	               <li class="lo" onclick="location.href='readingroomHistory.do?userId=${userId }'">열람실이용내역</li>
	               <li class="lo" onclick="location.href='studyroomHistory.do?userId=${userId }'">스터디룸이용내역</li>
	               <li class="lo" onclick="location.href='qnaList.do?userId=${userId }'">문의하기</li>
	            </ul>
         	</div>
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>회원 탈퇴 </b>
			</h2>
			
			<!-- 본문 --><br><br>
				<table class="table table-borderless" align="center">
					<colgroup>
						<col width="200px">
						<col width="400px">
					</colgroup>
					<tr>
						<th style='vertical-align:middle;'>아이디  </th>
						<td colspan="2" style='vertical-align:middle;'>
							<input class="form-control" type="text" name="userId" value="${loginUser.userId }" id="userId" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control" style=" margin-bottom : 10px;" type="password" name="userPwd" value="" id="userPwd">
							<span class="guide ok" ">비밀번호가 일치합니다.</span>
							<span class="guide error" >등록된 비밀번호와 일치하지 않습니다. </span> <!-- 비밀번호 일치 여부 체크 -->
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호 확인  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control"  type="password" name="pwd-check" value="" id="pwdCheck" >
							<span  id="alert-success" style="display: none; color: blue; padding-top : 10px;">비밀번호가 일치합니다.</span>
							<span  id="alert-danger" style="display: none; color: #d92742; padding-top : 10px;">다시 입력해주세요</span>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이름  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="userName" value="${loginUser.userName }" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이메일  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" type="text" name="userEmail" value="${loginUser.userEmail }" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>핸드폰번호  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control" name="userPhone" value="${loginUser.userPhone }" readonly>
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
							<a href="#" class="btn-layerClose"><button class="btn btn-danger" onclick="location.href='removeMember.do?userId=${loginUser.userId}';">탈퇴</button></a> 
							<a href="#" class="btn-layerClose"><button class="btn btn-secondary" >취소</button></a>
						</div>
						<!--  // 내용 끝 -->
					</div>
				</div>
			</div>
		</article>
		<br>
		<br>
	</section>
	</c:if>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
	$("#userPwd").on("blur", function(){
		//이벤트가 감지되었을 때 동작할 내용을 펑션 안에 쓴다
		var userId = $("#userId").val();
		var userPwd = $("#userPwd").val(); //입력한 값을 변수 pwd에 넣음
		//이 값을 디비에 보냄
		$.ajax({ //제이쿼리를 이용한 에이젝스 사용
			url : "checkDupPwd.do",//어느 url로 보낼지 결정
			data : {"userId" : userId, "userPwd" : userPwd},//어떤 데이터를 보낼지 결정
			success : function(result){
				//성공했을 때 실행코드
				//console.log(result); //성공했으면 1, 실패했으면 0
				console.log(result);
				if(result != 0){
					$(".guide.ok").show();
					$(".guide.error").hide();
					
				}else{
					$(".guide.ok").hide();
					$(".guide.error").show(); //prop, css(display,none)
				}
			},
			error : function(){
				alert("수정실패(ajax 통신 오류)");
			},
		});
	});
    
	$("#pwdCheck").focusout(function () {
	    var pwd1 = $("#userPwd").val();
	    var pwd2 = $("#pwdCheck").val();
	
	    if ( pwd1 != '' && pwd2 == '' ) {
	        null;
	    } else if (pwd1 != "" || pwd2 != "") {
	        if (pwd1 == pwd2) {
	            $("#alert-success").css('display', 'inline-block');
	            $("#alert-danger").css('display', 'none');
	        } else {
	            alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
	            $("#alert-success").css('display', 'none');
	            $("#alert-danger").css('display', 'inline-block');
	        }
	    }
	});
		
	
	
	$(".check-btn").click(function(){
	    var pwd1 = $("#userPwd").val();
	    var pwd2 = $("#pwdCheck").val();
		
		if(pwd1 != null && pwd1 != "" && pwd2 != null && pwd2 != ""){
			if(pwd1 == pwd2){
		        var $href = $(this).attr("href");
		        layer_popup($href);
		/* 		$("#form").submit(); */
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}else{
			alert("비밀번호를 입력해주세요");
			return false;
		}

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
			
