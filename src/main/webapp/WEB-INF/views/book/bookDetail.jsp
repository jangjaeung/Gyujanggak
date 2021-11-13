<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
<link rel="stylesheet" href="../../../resources/css/searchingBook.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../resources/js/bookDetail.js"></script>
</head>
<body>
<!-- Header -->
    <jsp:include page="../common/header.jsp"></jsp:include>
    <jsp:include page="../common/chat.jsp"></jsp:include>
    <div>
        <span style="font-size: 8rem;">&nbsp;</span>
    </div>
<!-- Navibar -->
    <nav>

    </nav>
<!-- Aside -->
    <aside>
        <div class="s__sidebar">
            <h3>자료검색</h3>
            <ul>
                <li><a href="/search.do">간략검색</a></li>
                <li><a href="/sDetail.do">상세검색</a></li>
                <li><a href="/sSub.do">주제별검색</a></li>
                <li><a href="/searchNew.do">신착자료</a></li>
                <li><a href="/bestBook.do">대출베스트</a></li>
            </ul>
        </div>
    </aside>
<!-- Contents -->
    <input type="hidden" name="bookNo" value="${ book.bookNo }">
    <div>
        <table border="1">
            <tr>
                <td colspan="3">${ book.bookName }</td>
            </tr>
            <tr>
                <td rowspan="4"><img src="${pageContext.request.contextPath}/resources/bookcover/${book.bookCover}" alt="" class="book__cover"></td>
                <td><b>저자</b></td>
                <td>${ book.bookWriter }</td>
            </tr>
            <tr>
                <td><b>발행처</b></td>
                <td>${ book.publisher }</td>
            </tr>
            <tr>
                <td><b>발행연도</b></td>
                <td>${ book.bookYear }</td>
            </tr>
            <tr>
                <td><b>ISBN</b></td>
                <td>${ book.isbn }</td>
            </tr>
        </table>
    </div>
    <div>
        <table border="1">
            <tr>
                <td>청구기호</td>
                <td>도서상태</td>
                <td>반납예정일</td>
                <td>예약신청</td>
            </tr>
            <tr>
                <td>${ book.callNo }</td>
                <td>${ book.bookState }</td>
                <td>
                    <c:if test="${ book.bookState eq '대출불가' }">
                		${ lendingBook.returnDate }
                    </c:if>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <div>
		<c:url var="lendingB" value="/lendingBookView.do">
			<c:param name="bookNo" value="${ book.bookNo }"></c:param>
		</c:url>
        <c:if test="${ book.bookState eq '대출가능' }">
	        <button type="button" onclick="location.href='${ lendingB }';" id="lending-btn">대출신청</button>
        </c:if>
        <button type="button" onclick="location.href='#';">도서예약</button>
        <button type="button" onclick="location.href='#';">관심도서담기</button>
    </div>
    <div>
        <table>
            <tr>
                <td>회원 서평</td>
            </tr>
        </table>
    </div>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>