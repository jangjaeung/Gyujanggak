<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<aside class="sidebar">
			<!-- 사이드메뉴 -->
		</aside>
	
		<article class="mainContent">
		<br>
			<h2 id="mainTitle"><b>내 정보 관리</b></h2>
			<br>
			<!-- 일반회원 -->
				<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'></td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>일용자</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>user01</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>일반</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>P11111</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'>2021/10/21</td>
							<th class="bg-info" style='vertical-align:middle;'>연회비</th>
							<td style='vertical-align:middle;'>미납 &nbsp;&nbsp; &nbsp;<button type="button" class="btn btn-warning">결제</button></td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>이용증</th>
							<td style='vertical-align:middle;'>미발급</td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>없음</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>주소</th>
							<td width="77%" style='vertical-align:middle;'>서울특별시 양천구</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>010-0000-0000</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>user01@gmail.com</td>
						</tr>
					</tbody>
				</table>
				
				
			<!-- 학생회원 -->
			<table class="table" align="center" id="info-table">
					<tbody>
						<tr>
							<td rowspan="4" width="230" style='vertical-align:middle;'></td>
							<th class="bg-info" style='vertical-align:middle;'>이름</th>
							<td style='vertical-align:middle;'>일용자</td>
							<th class="bg-info" style='vertical-align:middle;'>아이디</th>
							<td style='vertical-align:middle;'>user01</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>회원분류</th>
							<td style='vertical-align:middle;'>학생</td>
							<th class="bg-info" style='vertical-align:middle;'>회원번호</th>
							<td style='vertical-align:middle;'>P11111</td>
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>학번</th>
							<td style='vertical-align:middle;'>20211021</td>
							<th class="bg-info" style='vertical-align:middle;'>전공</th>
							<td style='vertical-align:middle;'>컴퓨터공학</td> 
						</tr>
						<tr>
							<th class="bg-info" style='vertical-align:middle;'>가입일</th>
							<td style='vertical-align:middle;'>20211021</td>
							<th class="bg-info" style='vertical-align:middle;'>이용기간</th>
							<td style='vertical-align:middle;'>재학기간동안</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table">
					<tbody>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>주소</th>
							<td width="77%" style='vertical-align:middle;'>서울특별시 양천구</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>전화번호</th>
							<td width="77%" style='vertical-align:middle;'>010-0000-0000</td>
						</tr>
						<tr>
							<th class="bg-info" width="20%" style='vertical-align:middle;'>이메일</th>
							<td  width="77%" style='vertical-align:middle;'>user01@gmail.com</td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<div class="btn-area">
					<button type="button" class="btn btn-primary" id="btn" onclick="location.href='modifyInfoView.do';">수정하기</button>
				</div>
		</article>
	</section>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>