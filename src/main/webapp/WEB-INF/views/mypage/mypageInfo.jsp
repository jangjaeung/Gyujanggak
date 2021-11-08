<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 포맷태그 식별 태그라이브러리  -->
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	width : 70%;
	
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table{
	margin-left : 5%;
	margin-right : 5%;
	width : 100%;
}
.table th{
	height : 45px;
	text-align : center;
}
.table td{
	margin: auto;
	vertical-align:middle;
}

#info-table th:nth-chid(0){
	width : 10%;
}
#info-table th:nth-chid(1){
	width : 10%;
}
#info-table td:nth-chid(0){
	width : 25%;
}
#info-table td:nth-chid(1){
	width : 25%;
}
.btn-area{
	text-align : center;
}
#login-btn{
	text-align : center;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${sessionScope.loginUser eq null }">
	<section>
		<article class="mainContent">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area">
				<a href="loginView.do" ><button type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
			
		</article>
		</section>
	</c:if>
	
	<c:if test="${sessionScope.loginUser ne null}">
	<section>
		<aside class="sidebar">
			<!-- 사이드메뉴 -->
		</aside>

		<article class="mainContent">
		<br>
			<h2 id="mainTitle"><b>내 정보 관리</b></h2>
			<br>
			<!-- 일반회원 -->
			<c:if test="${sessionScope.loginUser ne null and loginUser.userType eq '일반' }">
				<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'></td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>${loginUser.userName }</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>${loginUser.userId }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>${loginUser.userType }</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>${loginUser.userNo }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'><fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/></td>
							<th class="bg-info" style='vertical-align:middle;'>연회비</th>
							<td style='vertical-align:middle;'> 
								<c:if test="${loginUser.annualFee eq null }">
									미납 &nbsp;&nbsp; &nbsp; <button type="button" class="btn btn-warning">결제</button>
								</c:if>
								<c:if test="${loginUser.annualFee ne null and loginUser.payDate ne null}">
									납부 &nbsp; &nbsp; (${loginUser.payDate })
								</c:if>
							</td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>이용증</th>
							<td style='vertical-align:middle;'>
								<c:if test="${loginUser.annualFee eq null or loginUser.payDate eq null }">
									미발급
								</c:if>
 								<c:if test="${loginUser.annualFee ne null and loginUser.passCheck eq 'N'}">
									대기
								</c:if>
								<c:if test="${loginUser.passCheck ne 'N' and loginUser.approvalDate ne null}">
									발급
								</c:if> 
							</td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>
								<c:if test="${loginUser.annualFee eq null or loginUser.payDate eq null }">
									없음
								</c:if>
								<c:if test="${loginUser.annualFee ne null and mloginUserember.passCheck eq 'N'}">
									대기
								</c:if>
								<c:if test="${loginUser.passCheck ne 'N' and loginUser.approvalDate ne null}">
									<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.approvalDate }"/>
									 ~ 
									<fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.endDate }"/>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>주소</th>
							<td width="77%" style='vertical-align:middle;'>
<%-- 							택배에 입력한 주소 없으면...	
								<c:if test="${loginUser.passCheck ne null}">${loginUser.endDate }</c:if>
								<c:if test="${loginUser.passCheck eq null}">-</c:if> --%>
							</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>${loginUser.userPhone }</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>${loginUser.userEmail }</td>
						</tr>
					</tbody>
				</table>
			</c:if>	
				
			<!-- 학생회원 -->
		<c:if test="${sessionScope.loginUser ne null and loginUser.userType eq '학생'}">
			<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'></td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>${loginUser.userName }</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>${loginUser.userId }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>${loginUser.userType }</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>${loginUser.userNo }</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>학번</th>
							<td style='vertical-align:middle;'>${loginUser.studentId }</td>
							<th class="bg-info" style='vertical-align:middle;'>전공</th>
							<td style='vertical-align:middle;'>${loginUser.major }</td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'><fmt:formatDate pattern = "yyyy-MM-dd" value="${loginUser.enrollDate }"/></td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>재학기간동안</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<!-- 주소 추가해야함!!!  -->
							<th class="bg-info" width="20%" style='vertical-align:middle;'>주소</th>
							<td width="77%" style='vertical-align:middle;'>서울특별시 양천구</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>${loginUser.userPhone }</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>${loginUser.userEmail }</td>
						</tr>
					</tbody>
				</table>
			</c:if>	
				<br><br>
				<div class="btn-area">
					<button type="button" class="btn btn-primary" id="btn" onclick="location.href='modifyInfoView.do?userId=${loginUser.userId }';">수정하기</button>
				</div>
		</article>
	</section>
	</c:if>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>