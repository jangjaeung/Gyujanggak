$("#delete-rsv").click(function(){
    let bookNo = '${ rsv.rsvNo }'
    let userId = '${ rsv.userId }'
    $.ajax({
        url : "deleteReservation.do",
        type : "get",
        data : {
            "rsvNo" : rsvNo,
            "userId" : userId
        },
        success : function(data) {
            if(data == "success") {
                alert("완료");
            } else {
                alert("실패");
            }
        },
        error : function() {
            alert("Ajax 통신 오류");
        }
    });
});