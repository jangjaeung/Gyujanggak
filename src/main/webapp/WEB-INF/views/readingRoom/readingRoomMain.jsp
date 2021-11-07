<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>열람실 예약</title>
<link href="resources/readingRoom/readingRoomMain.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<main>
		<div class="readingRoomTitle">
			<p class="readingRoomTitleOne">열람실</p>
			<p class="readingRoomTitleTwo">도서관이용>열람실</p>
		</div>
		<div class="readingRoomDiv">
			<p>열람실 예약</p>
			<table class="mainTable">
				<tr>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="1">1</td>
								<td class="seat" id="2">2</td>
								<td class="seat" id="3">3</td>
								<td class="seat" id="4">4</td>
							</tr>
							<tr>
								<td class="seat" id="13">13</td>
								<td class="seat" id="14">14</td>
								<td class="seat" id="15">15</td>
								<td class="seat" id="16">16</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="5">5</td>
								<td class="seat" id="6">6</td>
								<td class="seat" id="7">7</td>
								<td class="seat" id="8">8</td>
							</tr>
							<tr>
								<td class="seat" id="17">17</td>
								<td class="seat" id="18">18</td>
								<td class="seat" id="19">19</td>
								<td class="seat" id="20">20</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="9">9</td>
								<td class="seat" id="10">10</td>
								<td class="seat" id="11">11</td>
								<td class="seat" id="12">12</td>
							</tr>
							<tr>
								<td class="seat" id="21">21</td>
								<td class="seat" id="22">22</td>
								<td class="seat" id="23">23</td>
								<td class="seat" id="24">24</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="25">25</td>
								<td class="seat" id="26">26</td>
								<td class="seat" id="27">27</td>
								<td class="seat" id="28">28</td>
							</tr>
							<tr>
								<td class="seat" id="37">37</td>
								<td class="seat" id="38">38</td>
								<td class="seat" id="39">39</td>
								<td class="seat" id="40">40</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="29">29</td>
								<td class="seat" id="30">30</td>
								<td class="seat" id="31">31</td>
								<td class="seat" id="32">32</td>
							</tr>
							<tr>
								<td class="seat" id="41">41</td>
								<td class="seat" id="42">42</td>
								<td class="seat" id="43">43</td>
								<td class="seat" id="44">44</td>
							</tr>
						</table>
					</td>
					<td>
						<table class="subTable">
							<tr>
								<td class="seat" id="33">33</td>
								<td class="seat" id="34">34</td>
								<td class="seat" id="35">35</td>
								<td class="seat" id="36">36</td>
							</tr>
							<tr>
								<td class="seat" id="45">45</td>
								<td class="seat" id="46">46</td>
								<td class="seat" id="47">47</td>
								<td class="seat" id="48">48</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="rsvDiv hidden">
			선택된 좌석 <input type="text" id="selectedSeat" readonly /> 예약시간 
			<select id="reservationTime">
				<option value="09:00~15:00">09:00~15:00</option>
				<option value="15:00~21:00">15:00~21:00</option>
			</select>
		</div>
		<button class="rsv_btn">예약</button>
	</main>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

<script>

	// 좌석 현황
	$.ajax({
		url : 'printAllReadingRoom.do',
		type : 'post',
		data : {
			"data" : "data"
		},
		dataType : 'json',
		contentType : 'application/json',

		success : function(data) {
			data.find(function(ele) {
				$('#' + ele.seatNo + '').addClass('seatRed');
			});

			$('.seat').not('.seatRed').addClass('seatGreen');

			$('.seatGreen').click(function() {
				$(this).css('background-color', '#e0e0e0');
				$(this).addClass('select');

				$('.seatGreen').not($(this)).css('background-color', '#FFF');
				$('.seatGreen').not($(this)).removeClass('select');

				//console.log($('.select').text());
				$('#selectedSeat').val($('.select').text());
			});

		},
		error : function() {
			alert('AJAX 통신오류.. 관리자에게 문의하세요');
		},
	});

	// 좌석 예약
	$('.rsv_btn').click(function() {
		if ($('.hidden').length > 0) {
			$('.hidden').removeClass('hidden')
		} else {
			if ($('#selectedSeat').val() !== '') {
				console.log($('#selectedSeat').val());
				console.log($('#reservationTime').val());

				$.ajax({
					url : 'reservationReadingRoom.do',
					type : 'post',
					data : {
						seatNo : $('#selectedSeat').val(),
						rReservationTime : $('#reservationTime').val(),
						userId : 'khuser01',
					},
					success : function(data) {
						if (data === 'success') {
							alert("예약이 완료되었습니다.")
							location.reload();
						} else {
							alert('예약실패');
						}
					},
					error : function() {
						alert('AJAX 통신오류.. 관리자에게 문의하세요');
					},
				});
			} else {
				alert('좌석을 선택해주세요.');
			}
		}

	});
</script>
</html>
