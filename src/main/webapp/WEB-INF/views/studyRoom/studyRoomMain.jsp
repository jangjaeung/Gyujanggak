<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>스터디룸 예약</title>
        <link href="resources/studyRoom/studyRoomMain.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
        <main>
            <div class="studyRoomTitle">
                <p class="studyRoomTitleOne">스터디룸</p>
                <p class="studyRoomTitleTwo">도서관이용>스터디룸</p>
            </div>
            <div class="studyRoomDiv">
                <div class="reservation">
                    <div class="rsv_form">
                        <p class="rsv_title">스터디룸 예약</p>
                        <div class="rsv_form_con">
                            <p>예약일</p>
                            <input type="text" class="dateSelector" placeholder="날짜를 선택하세요." readonly />
                            <p>예약시간</p>
                            <select id="reservationTime">
                                <option value="09:00~12:00">09:00~12:00</option>
                                <option value="12:00~15:00">12:00~15:00</option>
                                <option value="15:00~18:00">15:00~18:00</option>
                                <option value="18:00~21:00">18:00~21:00</option>
                            </select>
                            <p>사용 목적</p>
                            <input type="text" id="purpose" placeholder="ex) 토익스터디" />
                            <p>사용 인원</p>
                            <input type="text" id="personnel" placeholder="ex) 4" onkeypress="inNumber();" />
                        </div>
                        <button class="rsv_btn">예약</button>
                    </div>
                    <div class="alert_div">
                        <p>예약이 완료되었습니다.</p>
						<p>예약을 확인하시겠습니까?</p>
                        <input type="button" value="확인" />
                        <input type="button" value="취소" />
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>

    <script>
        // 예약일 달력
        $('.dateSelector').flatpickr({
            dateFormat: 'Y/m/d',
            minDate: 'today', // 최소 날짜
            maxDate: new Date().fp_incr(31),
            // 31일 이내만 가능
        });

        // 좌석예약
        $('.rsv_btn').click(function () {
            if ($('.dateSelector').val() == '') {
                alert('예약일을 선택해주세요.');
            } else if ($('#purpose').val() == '') {
                alert('사용 목적을 입력해주세요.');
            } else if ($('#personnel').val() == '') {
                alert('사용 인원을 입력해주세요.');
            } else {
                $.ajax({
                    url: 'reservationStudyRoom.do',
                    type: 'post',
                    data: {
                        userId: 'khuser01',
                        sReservationDate: $('.dateSelector').val(),
                        sReservationTime: $('#reservationTime').val(),
                        purpose: $('#purpose').val(),
                        personnel: $('#personnel').val(),
                    },
                    success: function (data) {
                        if (data === 'success') {
                            // alert('예약이 완료되었습니다.');
                            $('.alert_div').css('display', 'block');
                            // location.reload();
                        } else {
                            alert('예약실패');
                        }
                    },
                    error: function () {
                        alert('AJAX 통신오류.. 관리자에게 문의하세요');
                    },
                });
            }
        });

        function inNumber() {
            if ($('#personnel').val().length < 1) {
                if (event.keyCode < 49 || event.keyCode > 56) {
                    event.returnValue = false;
                }
            } else {
                event.returnValue = false;
            }
        }
    </script>
</html>
