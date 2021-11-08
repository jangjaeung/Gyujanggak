<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
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
	
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table{
	margin-left : 5%;
	margin-right : 5%;
	width : 700px;
	justify-content : center;
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
				<b>회원 정보 수정"${loginUser }</b>
			</h2>
			
			<!-- 본문 --><br><br>
			<form action="modifyInfo.do" method="post">
			<input type="hidden" name="userType" value="${loginUser.userType }">
			<input type="hidden" name="userNo" value="${loginUser.userNo }">
			<input type="hidden" name="enrollDate2" value="<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/>">
			<input type="hidden" name="major" value="${loginUser.major }"> 
 			<c:if test="${loginUser.userType eq '학생' }">
				<input type="hidden" name="studentId" value="${loginUser.studentId }">
			</c:if> 
			
				<table class="table table-borderless" align="center">
					<colgroup>
						<col width="30px">
						<col width="50px">
						<col width="50px">
					</colgroup>
					<tr>
						<th style='vertical-align:middle;'>아이디  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control" type="text" name="userId" value="${loginUser.userId }" readonly>
						</td>
						<td rowspan="4" ></td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control" type="password" name="userPwd" value="${loginUser.userPwd }" id="userPwd"> <br>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호 확인  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control"  type="password" name="pwd-check" value="" id="pwdCheck">
							<span class="guide ok" id="passTrue">비밀번호가 일치합니다.</span>
							<span class="guide error" id="passFalse">비밀번호가 일치하지 않습니다. 다시 입력해주세요</span>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이름  </th>
						<td  style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="userName" value="${loginUser.userName }" readonly>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이메일  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" type="text" name="userEmail" value="${loginUser.userEmail }" >
						</td>
<!-- 						<td style='vertical-align:middle;'>
							<input class="form-control" list="datalistOptions" >
 							<datalist id="datalistOptions">
							  <option value="@naver.com">
							  <option value="@gmail.com">
							  <option value="@daum.net">
							  <option value="@nate.com">
							  <option value="@daol.com">
							</datalist> 
						</td> -->
					</tr>
					<tr>
						<th style='vertical-align:middle;'>핸드폰번호  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" name="userPhone" value="${loginUser.userPhone }" >
						</td>
						<%-- <td style='vertical-align:middle;'><input class="form-control" type="text" name="" value="${loginUser.userPhone }"></td>
						<td style='vertical-align:middle;'> <input class="form-control" type="text" name="" value=""></td> --%>
					</tr>
				</table>
				
			
				<!-- 버튼 --><br>
				<div class="btn-area">
					<input type="submit" class="btn btn-primary" id="btn" value="완료">
				</div>
			</form>
		</article>
		<br>
		<br>

	</section>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
<!-- <script>
	$("#userPwd, #pwdCheck").on("change", function(){
		$("#passFalse").addClass('dn'); //실행하면 텍스트 없앰
		$("#passTrue").addClass('dn');
		var password = $("#userPwd").val(); 
		var passwordCheck = $("#pwdCheck").val();
		if(password == passwordCheck){
			$("#passTrue").removeClass("dn"); //텍스트 보여줌
			return;
		}else{
			$("#passFalse").removeClass("dn"); 
			pass_check = false;
		}
	});
	
	$("#btn").on("click", function(){
		var pwd = $("#userPwd").val();
		var pwdCheck = $("#pwdCheck").val();
		if(pwd == null){
			alert("비밀번호를 입력해주세요");
			return;
		}
		if(pwdCheck == null){
			alert("비밀번호 확인을 입력해주세요");
			return;
		}
		
		$("#btn").submit();
	});
	
</script> -->
</body>
</html>
			
