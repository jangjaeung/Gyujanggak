<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>

	<div class="Membership_MainContent">
		<p class="mainTitle">회원 관리</p>
		<table>
			<thead>
				<tr>
					<td colspan="2">회원 번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>회원 분류</td>
					<td>가입일</td>
					<td>이용 승인</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty mList }">
				<c:forEach items="${mList }" var="member">
					<tr>
	                    <td><input type="checkbox" name="userNo" class="list-checkBox" value="${member.userNo }"></td>
						<td>${member.userNo }</td>
						<td>
							<a href="userDetail.do?userNo=${member.userNo }">${member.userId }</a>
						</td>
						<td>${member.userType }</td>
	                    <td>${member.enrollDate }</td>
	                    <td>${member.passCheck }</td>
	                    <td>
	  
	                    </td>
					</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</main>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>