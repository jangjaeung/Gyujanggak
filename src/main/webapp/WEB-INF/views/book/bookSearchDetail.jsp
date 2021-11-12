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
    <div>
        <div>
            <h1>상세검색</h1>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 상세검색</h5>
        </div>
        <div>
            <form action="/searchDetail.do" id="detailForm" method="get">
                <table>
                    <tr>
                        <td><label for="title"><b>도서명</b></label></td>
                        <td><input type="text" id="title" name="searchValue1" value="${ search.searchValue1 }"></td>
                    </tr>
                    <tr>
                        <td><label for="writer"><b>저자</b></label></td>
                        <td><input type="text" id="writer" name="searchValue2" value="${ search.searchValue2 }"></td>
                    </tr>
                    <tr>
                        <td><label for="publisher"><b>출판사</b></label></td>
                        <td><input type="text" id="publisher" name="searchValue3" value="${ search.searchValue3 }"></td>
                    </tr>
                    <tr>
                        <td><label for="isbn"><b>ISBN</b></label></td>
                        <td><input type="text" id="isbn" name="searchValue4" value="${ search.searchValue4 }"></td>
                    </tr>
                    <tr>
                        <td><label for="year"><b>발행연도</b></label></td>
                        <td><input type="text" id="year" name="searchValue5" value="${ search.searchValue5 }"></td>
                    </tr>
                </table>
                <input type="submit" value="검색" id="b_search" class="">
            </form>
        </div>
        <section>
        	<c:if test="${ empty bList }">
                <tr>
                    <td>
                        <p>검색 결과가 없습니다.</p>
                    </td>
                </tr>
        	</c:if>
        	<c:if test="${ !empty bList }">
<%--                 <h2>"${ search.searchValue }" 검색 결과입니다.</h2> --%>
	        	<c:forEach items="${ bList }" var="book">
                    <hr>
		            <div class="section">
     			        <c:url var="bDetail" value="/bookDetail.do">
                    		<c:param name="bookNo" value="${ book.bookNo }"></c:param>
                    	</c:url>
		                <div class="section1">
                            <a href="${ bDetail }">
                                <img src="${pageContext.request.contextPath}/resources/bookcover/${book.bookCover}" alt="" class="book__cover">
                            </a>
		                </div>
		                <div class="section2">
                            <a href="${ bDetail }">
                                <h4>${ book.bookName }</h4>
                            </a>
		                    <div>저자 : ${ book.bookWriter } ｜ 발행처 : ${ book.publisher } ｜ 발행연도 : ${ book.bookYear }</div>
		                    <div>자료상태 : ${ book.bookState }</div>
		                </div>
		            </div>
	        	</c:forEach>
        	</c:if>
        </section>
    </div>
<!-- Footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
         $("#b_search").click(function(){
             if($("#title").val() == "") {
                 alert("도서명을 입력해 주시기 바랍니다.");
                 return false;
             }
             $("#detailForm").submit();
         });
     </script>
</body>
</html>