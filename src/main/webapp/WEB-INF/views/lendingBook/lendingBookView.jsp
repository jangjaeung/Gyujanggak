<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- Header -->
    <jsp:include page="../common/header.jsp"></jsp:include>
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
                <li><a href="/sNew.do">신착자료</a></li>
                <li><a href="#">대출베스트</a></li>
            </ul>
        </div>
    </aside>
<!-- Contents -->
    <input type="hidden" name="bookNo" value="${ book.bookNo }">
    <div>
        <div>
            <h1>대출신청</h1>
        </div>
        <hr>
        <div>
            <form action="/lendingBook.do">
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
                <table>
                    <tr>
                        <td colspan="2">도서 수령 방법</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="book-receive" id="" value="방문수령"></td>
                        <td><input type="radio" name="book-receive" id="" value="택배수령"></td>
                    </tr>
                    <tr>
                        <td colspan="2">배송지</td>
                    </tr>
                    <tr>
                        <td>* 우편번호</td>
                        <td>
                            <input type="text" name="post" class="postcodify_postcode5" size="6">
                            <button type="button" id="postcodify_search_button">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>* 도로명 주소</td>
                        <td><input type="text" name="address1" class="postcodify_address"></td>
                    </tr>
                    <tr>
                        <td>* 상세 주소</td>
                        <td><input type="text" name="address2" class="postcodify_extra_info"></td>
                    </tr>
                    <tr>
                        <td colspan="2">결제방법</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="radio" name="book-pay" id="" value="카드결제"></td>
                    </tr>
                </table>
                <input type="submit" value="대출신청">
            </form>
        </div>
    </div>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script>
        $(function() { $("#postcodify_search_button").postcodifyPopUp(); });
    </script>
</body>
</html>