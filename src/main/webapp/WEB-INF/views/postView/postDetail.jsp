<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
*{margin:0;padding:0}
header{top:0}
footer{bottom:0}
#wrap{width:1400px;height:800px;margin:0 auto;margin-top:200px}
input{outline:none;}
textarea{outline:none;resize:none;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="wrap">
		<form method="get" name="form">
			<input type="hidden" name="postNo" value="${post.postNo }">
			<table align="center">
				<tr>
					<td>제목</td>
					<td><input type="text" size="50" name="postTitle" value="${post.postTitle }" readonly></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" size="50" name="postWriter" value="${post.postWriter }" readonly></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="7" cols="50" name="postContents" readonly>${post.postContents }</textarea></td>
				</tr>
	<%-- 			<c:if test="${sessionScope.userId == post.postWriter}"> --%>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" onclick="javascript: form.action='postModify.do'">
							<input type="submit" id="del" value="삭제" onclick="javascript: form.action='deletePost.do'">
						</td>
					</tr>
	<%-- 			</c:if> --%>
			</table>
			<table align="center" width="800" border="1">
				<tr>
					<td>
						<textarea rows="3" cols="55" id="rContents"></textarea>
					</td>
					<td><button id="rSubmit">등록하기</button>
				</tr>
			</table>
	
	<!--  댓글 목록 -->
	<table align="center" width="800" border="1" id="rtb">
		<thead>
			<tr>
				<!-- 댓글 갯수 -->
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
			<tr>
				<td width="80">작성자</td>
				<td>내용</td>
				<td width="80">등록일</td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
		</form>
	</div>
	<jsp:include page="../common/chat.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		$("#del").on("click",function(){
			if(confirm("정말 삭제 하시겠습니까?")){
				alert("삭제 되었습니다.");
				return true;
			}else{
				return false;
			};
		});
		getReplyList();
		function getReplyList(){
			var postNo = ${post.postNo}
            var session = ${sessionScope.userId};
			$.ajax({
				type:'GET',
				url:'replyList.do',
				data:{"postNo" : postNo},
				dataType:"json",
				success : function(data){
					var $tableBody = $("#rtb tbody");
					$tableBody.html("");
					 var $tr;
		             var $rWriter;
		             var $rContents;
		             var $rCreateDate;
		             var $btnArea;
		             $("#rCount").text("댓글 ("+data.length+")");
		             if(data.length > 0){
		            	 for(var i in data){
		            		 $tr = $("<tr id='modifyTr'>");
		                     $rWriter = $("<td width='80'>").text(data[i].replyWriter);
		                     $rContent = $("<td>").text(data[i].replyContents);
		                     $rCreateDate = $("<td width='100'>").text(data[i].replyDate);
		                     $btnArea = $("<td width='80'>")
		                     .append("<a href ='#' onclick='modifyReply(this,"+postNo+","+data[i].replyNo+",\""+data[i].replyContents+"\");'>수정/<a> ")
		                     .append("<a href ='#' onclick='removeReply("+postNo+","+data[i].replyNo+")'>삭제<a>");
		                     $tr.append($rWriter);
		                     $tr.append($rContent);
		                     $tr.append($rCreateDate);
		                     if(session == data[i].replyWriter){
		                     	$tr.append($btnArea);
		                     };
		                     $tableBody.append($tr);
		            		}
		             }else{
		            	 $tr = $("<tr id='modifyTr'><td colspan='4'>등록된 댓글이 없습니다.</td>");
		            	 $tableBody.append($tr);
		             }
		        },
	             error:function(){
            	 	alert("통신 실패");
             }
		});
	}
		
		 function modifyReply(obj, postNo, replyNo, replyContents){
		        $trModify = $("<tr>");
		        $trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+replyContents+"'></td>");
		        $trModify.append("<td><button onclick='modifyReplyCommit("+postNo+","+replyNo+")'>수정완료</button></td>");
		        $(obj).parent().parent().after($trModify);
		     }
		
	</script>
</body>
</html>