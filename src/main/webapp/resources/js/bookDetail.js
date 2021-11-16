$("#interesting-btn").click(function(){
    let bookNo = '${ book.bookNo }'
    let userId = '${ sessionScope.userId }'
    $.ajax({
        url : "interestingBook.do",
        type : "get",
        data : {
            "bookNo" : bookNo,
            "userId" : userId
        },
        success : function(data) {
            if(data == "success") {
                alert("관심 도서 담기 완료");
            } else {
                alert("관심 도서 담기 실패");
            }
        },
        error : function() {
            alert("Ajax 통신 오류");
        }
    });
});

$("#reservation-btn").click(function(){
    let bookNo = '${ book.bookNo }'
    let userId = '${ sessionScope.userId }'
    $.ajax({
        url : "reservationBook.do",
        type : "get",
        data : {
            "bookNo" : bookNo,
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