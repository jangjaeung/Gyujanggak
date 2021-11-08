<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>규장각 로그인</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/loginPage/css/login.css"/>
  </head>
  
  <body>
    <div class="bg-img">
      <div class="content">
        <header>Login</header>
        <form action="login.do" method="post">
          <div class="field">
            <span class="fa fa-user"></span>
            <input type="text" required placeholder="ID" name="user-id">
          </div>
          <div class="field space">
            <span class="fa fa-lock"></span>
            <input type="password" class="pass-key" required placeholder="Password" name="user-pwd">
            <span class="show">SHOW</span>
          </div>
          <div class="pass">
            <a href="searchView.do">Forgot &nbsp;&nbsp;&nbsp;ID / Password?</a>
          </div>
          <div class="field">
            <input type="submit" value="LOGIN">
          </div>
        </form>
        <div class="login">Or login with</div>
        <div class="links">
          <div class="facebook">
          	<input type="hidden" name="kakaoemail" id="kakaoemail"/>
          	<input type="hidden" name="kakaoname" id="kakaoname"/>
            <a href="javascript:kakaoLogin();" style="color:white;"><i class="fas fa-comment"><span>kakao</span></i></a>
          </div>
          <form name="kakaoForm" id="kakaoForm" method = "post" action="/user/setSnsInfo.do">
			<input type="hidden" name="email" id="kakaoEmail" />
			<input type="hidden" name="id" id="kakaoId" />
			<input type="hidden" name="flag" id="flag" value="kakao" />
		  </form>
          <div class="instagram">
            <span>Naver</span>
          </div>
        </div>
        <div class="signup">아직 계정이 없으신가요?
          <a href="enrollType.do">Signup Now</a>
        </div>
      </div>
    </div>
    <script>
     
      window.Kakao.init("c637ca01ecee964368b81b9362e975bd");
      function kakaoLogin() {
    	  Kakao.Auth.login({
    			success: function (response) {
    			Kakao.API.request({
    				url: '/v2/user/me',
    				success: function (response) {
    					kakaoLoginPro(response)
    				},
    				fail: function (error) {
    					console.log(error)
    				},
    			})
    		},
    			fail: function (error) {
    				console.log(error)
    			},
    		})
    	}
    	
      function kakaoLoginPro(response){
    		var data = {id:response.id,email:response.kakao_account.email}
    		$.ajax({
    			type : 'POST',
    			url : '/user/kakaoLoginPro.do',
    			data : data,
    			dataType : 'json',
    			success : function(data){
    				console.log(data)
    			},
    			error: function(xhr, status, error){
    				alert("로그인에 실패했습니다."+error);
    			}
    		})
      }
      
    </script>
  </body>
</html>