<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>규장각 로그인</title>
    <link rel="stylesheet" href="style.css">
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
            <a href="#">Forgot &nbsp;&nbsp;&nbsp;ID / Password?</a>
          </div>
          <div class="field">
            <input type="submit" value="LOGIN">
          </div>
        </form>
        <div class="login">Or login with</div>
        <div class="links">
          <div class="facebook">
            <i class="fas fa-comment"><span>kakao</span></i>
          </div>
          <div class="instagram">
            <span>Naver</span>
          </div>
        </div>
        <div class="signup">아직 계정이 없으신가요?
          <a href="#">Signup Now</a>
        </div>
      </div>
    </div>
    <script>
      const pass_field = document.querySelector('.pass-key');
      const showBtn = document.querySelector('.show');
      showBtn.addEventListener('click', function(){
       if(pass_field.type === "password"){
         pass_field.type = "text";
         showBtn.textContent = "HIDE";
         showBtn.style.color = "#3498db";
       }else{
         pass_field.type = "password";
         showBtn.textContent = "SHOW";
         showBtn.style.color = "#222";
       }
      });
    </script>
  </body>
</html>