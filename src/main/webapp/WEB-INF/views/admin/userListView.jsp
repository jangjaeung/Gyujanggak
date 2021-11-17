<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="resources/admin/userList.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${userType ne '관리자' }">
	<section>
		<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="loginView.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
	
<c:if test="${userType eq '관리자'}">
<main>
	<div class="Membership_MainContent">
		<p class="mainTitle">회원 관리</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<td name="userNoTitle" colspan="2">회원 번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>회원 분류</td>
					<td>가입일</td>
					<td>이용 승인</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${uList }" var="member">
					<tr>
	                    <td><input type="checkbox" name="userNo" class="list-checkBox" value="${member.userNo }"></td>
						<td>${member.userNo }</td>
						<td>
							<a href="userDetail.do?userNo=${member.userNo }">${member.userId }</a>
						</td>
						<td>${member.userName }</td>
						<td>${member.userType }</td>
	                    <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.enrollDate }"/></td>
	                    <td>${member.passCheck }</td>
	                    <td>
	  						<c:if test="${member.payDate eq null}">	
	  							없음
	  						</c:if>
	  						<c:if test="${member.payDate ne null}">	
	  							대기
	  						</c:if>
	                    </td>
					</tr>
				</c:forEach>
					<div class="userSearchBar">
						<form action="userSearch.do" method="get">
							<select name="searchCondition">
								<option value="userName"
									<c:if test="${search.searchCondition == 'userName' }">selected</c:if>>이름</option>
								<option value="userNo"
									<c:if test="${search.searchCondition == 'userNo' }">selected</c:if>>회원번호</option>
								<option value="userType"
									<c:if test="${search.searchCondition == 'userType' }">selected</c:if>>회원분류</option>
							</select> 
							<input type="text" name="searchValue"value="${search.searchValue }"> 
							<input type="submit"value="검색">
						</form>
					</div>
			</tbody>
				<tr align="center" height="20">
				<td class= "userListPaging" colspan="6">
					<c:url var="before" value="userListView.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1 }">
						[이전]
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="${before }">[이전]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="userListView.do">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
							[${p }]
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<a href="${pagination }">${p }</a>&nbsp;
						</c:if>
					</c:forEach>
						<c:url var="after" value="userListView.do">
							<c:param name="page" value="${pi.currentPage +1 }"></c:param>
						</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</main>
</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>