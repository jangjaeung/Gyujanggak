<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/loginPage/css/login.css"/>
<style>
       .field {
    position: relative;
    height: 45px;
    width: 61%;
    display: flex;
    background: rgba(255,255,255,0.94);
    border: double;
    border-color: darkgoldenrod;
}
.field span {
    color: #222;
    width: 140px;
    line-height: 45px;
    border: double;
    border-color: darkgoldenrod;
}
label {color: rgb(0, 0, 0);}
input[type="radio"]:checked + label {color: darkgoldenrod;}

   </style>
</head>
<body>
	<div class="bg-img">
		<div class="content" style="width: 40%; height: 107%;">
			<header>회원가입</header>
			<form action="enroll.do" method="post">

				<div class="field">
					<input type="text" required placeholder="아이디" name="userId">
				</div>

				<div class="image-container">
					<img style="width: 180px; position: fixed; left: 66%; top: 18%; height: 30%;"id="preview-image" src="https://media.istockphoto.com/vectors/photo-album-icon-vector-id1023892724?k=20&m=1023892724&s=170667a&w=0&h=zXZB3iWNnwhrDA055eJgxh4Sq814_ZNRSVAJT7lBgLY=">
					<input type="file" name="uploadFile" style="display: block; position: absolute; left: 66%; bottom: 48%;">
				</div>

				<div class="field space">
					<input type="password" class="pass-key" required placeholder="비밀번호" name="userPwd">
				</div>

				<div class="field space">
					<input type="password" class="pass-key" required placeholder="비밀번호 확인" name="pwd-check">
				</div>

				<div class="field space">
					<input type="text" class="pass-key" required placeholder="이름" name="userName">
				</div>

				<div class="field space">
					<input type="text" class="pass-key" required placeholder="핸드폰 번호" name="userPhone">
				</div>

				<div class="field space">
					<span style="border: none; text-align: left; width: 33%;">구분: </span> 
					<input type="radio" id="aaa" style="width: 5%;" value="학생" name="userType"onclick="dispList('0')" checked> 
					<label style="width: 48px; border: none; line-height: 38px;">학생</label> 
					<input type="radio" id="bbb" style="width: 5%;" value="일반" name="userType"onclick="dispList('1')"> 
					<label style="width: 48px; border: none; line-height: 38px;">일반</label>
				</div>

				<div id="divId">
					<div class="field space" style="width: 80%;">
						<input type="text" class="pass-key" required placeholder="이메일 (학교이메일을 입력해주세요)" name="userEmail">
						<button style="width: 25%;">이메일 인증</button>
					</div>

					<div class="field space" style="width: 80%;">
						<input type="text" class="pass-key" required placeholder="학번 (다올대학교 학생만 입력해 주세요.)" name="studentId">
					</div>

					<div class="field space" style="width: 80%;">
						<select name="major">
							<option value="인문사회">인문사회</option>
							<option value="자연과학">자연과학</option>
							<option value="공학">공학</option>
							<option value="예체능">예체능</option>
							<option value="의학">의학</option>
						</select>
					</div>
				</div>

<!-- 				<div id="didId2" style="display: none;"> -->
<!-- 					<div class="field space" style="width: 80%;"> -->
<!-- 						<input type="text" class="pass-key" required placeholder="이메일" -->
<!-- 							name="userEmail"> -->
<!-- 						<button style="width: 25%;">이메일 인증</button> -->
<!-- 					</div> -->
<!-- 					<div class="field space" style="width: 80%;"> -->
<!-- 						<input type="text" class="pass-key" required placeholder="인증키"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="field space" style="margin-left: 19%;">
					<input type="submit" value="LOGIN" style="background-color: darkgoldenrod; border: none;">
				</div>
			</form>
		</div>
	</div>
	<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});

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

      function dispList(selectList) {
    var obj1 = document.getElementById("divId"); // 상품1 리스트
    var obj2 = document.getElementById("didId2"); // 상품2 리스트
 
    if( selectList == "0" ) { // 상품1 리스트
        obj1.style.display = "block";	
        obj2.style.display = "none";
        alert(	obj.style.display ) ;
    } else { // 상품2 리스트
        obj1.style.display = "none";
        obj2.style.display = "block";
    }
}





    
    </script>
</body>
</html>