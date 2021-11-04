<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
	width : 90%;
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
			<form action="/modifyInfo.do" method="post">
				<table class="table table-borderless" align="center">
					<colgroup>
						<col width="50px">
						<col width="30px">
						<col width="30px">
						<col width="80px">
					</colgroup>
					<tr>
						<th style='vertical-align:middle;'>아이디  </th>
						<td colspan="2" style='vertical-align:middle;'>
							<input class="form-control" type="text" name="" value="" readonly>
						</td>
						<td rowspan="4" ></td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호  </th>
						<td  colspan="2" style='vertical-align:middle;'>
							<input class="form-control" type="text" name="" value="">
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>비밀번호 확인  </th>
						<td  colspan="2" style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="" value="">
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이름  </th>
						<td  colspan="2" style='vertical-align:middle;'>
							<input class="form-control"  type="text" name="" value="">
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>이메일  </th>
						<td style='vertical-align:middle;' colspan="2">
							<input class="form-control" type="text" name="" value="" >
						</td>
						<td style='vertical-align:middle;'>
							<input class="form-control" list="datalistOptions" >
							<datalist id="datalistOptions">
							  <option value="@naver.com">
							  <option value="@gmail.com">
							  <option value="@daum.net">
							  <option value="@nate.com">
							  <option value="@daol.com">
							</datalist>
						</td>
					</tr>
					<tr>
						<th style='vertical-align:middle;'>핸드폰번호  </th>
						<td style='vertical-align:middle;'>
							<input class="form-control" value="010" >
						</td>
						<td style='vertical-align:middle;'><input class="form-control" type="text" name="" value=""></td>
						<td style='vertical-align:middle;'> <input class="form-control" type="text" name="" value=""></td>
					</tr>
				</table>
				
			
				<!-- 버튼 --><br>
				<div class="btn-area">
					<button type="submit" class="btn btn-primary" id="btn">완료</button>
				</div>
			</form>
		</article>
		<br>
		<br>

	</section>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
			
