<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
</head>
<body>
<!-- Header -->
    <header>
        <jsp:include page="../common/header.jsp"></jsp:include>
    </header>
<!-- Navibar -->
    <nav>

    </nav>
<!-- Aside -->
    <aside>
        <div>
            <h3>자료검색</h3>
            <ul>
                <li><a href="/search.do">간략검색</a></li>
                <li><a href="/searchDetail.do">상세검색</a></li>
                <li><a href="/searchSub.do">주제별검색</a></li>
                <li><a href="/searchNew.do">신착자료</a></li>
                <li><a href="#">대출베스트</a></li>
            </ul>
        </div>
    </aside>
<!-- Contents -->
    <div>
        <div>
            <h2>간략검색</h2>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 간략검색</h5>
        </div>
        <hr>
        <div>
            <form action="/searchSimple.do" method="get">
                <select name="searchCondition" id="">
                    <option value="title" <c:if test="${ search.searchCondition eq 'title' }">selected</c:if>>도서명</option>
                    <option value="writer" <c:if test="${ search.searchCondition eq 'writer' }">selected</c:if>>저자</option>
                    <option value="publisher" <c:if test="${ search.searchCondition eq 'publisher' }">selected</c:if>>출판사</option>
                </select>
                <input type="text" name="searchValue" value="${ search.searchValue }">
                <input type="submit" value="검색">
            </form>
        </div>
        <section>
        	<c:if test="${ empty bList }">
                <tr>
                    <td>
                        검색 결과가 없습니다.
                    </td>
                </tr>
        	</c:if>
        	<c:if test="${ !empty bList }">
	        	<c:forEach items="${ bList }" var="book">
		            <div>
		                <div>
		                    <img src="${pageContext.request.contextPath}/resources/bookcover/${book.bookCover}" alt="">
		                </div>
		                <div>
		                    <h4>${ book.bookName }</h4>
		                    <div>저자 : ${ book.bookWriter } ｜ 발행처 : ${ book.publisher } ｜ 발행연도 : ${ book.bookYear }</div>
		                    <div>자료상태 : ${ book.bookState }</div>
		                </div>
		            </div>
	        	</c:forEach>
        	</c:if>
        </section>
    </div>
<!-- Footer -->
    <footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>