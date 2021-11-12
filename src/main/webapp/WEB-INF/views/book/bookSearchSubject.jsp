<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다올대학교 도서관 ｜ 규장각</title>
<link rel="stylesheet" href="../../../resources/css/searchingBook.css">
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
            <h1>주제별검색</h1>
        </div>
        <div>
            <h5><a href="/home.do">Home</a> > 자료검색 > 주제별검색</h5>
        </div>
        <div>
            <form action="/searchSubject.do" method="get">
                <table>
                    <tr>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="총류">총류</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="철학">철학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="종교">종교</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="언어">언어</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="문학">문학</button></td>
                    </tr>
                    <tr>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="예술">예술</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="사회과학">사회과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="자연과학">자연과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="기술과학">기술과학</button></td>
                        <td><button type="submit" class="sub__btt" name="searchValue" value="역사">역사</button></td>
                    </tr>
                </table>
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
                <h2>"${ search.searchValue }" 검색 결과입니다.</h2>
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
</body>
</html>