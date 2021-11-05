
//chat bot
$(function() {
	  var INDEX = 0;
	  var clickIndex = 0;
	  $("#chat-submit").click(function(e) {
	    e.preventDefault();
	    var msg = $("#chat-input").val(); 
	    if(msg.trim() == ''){
	      return false;
	    }
	    generate_message(msg, 'self');
	    var buttons = [
	        {
	          name: 'Existing User',
	          value: 'existing'
	        },
	        {
	          name: 'New User',
	          value: 'new'
	        }
	      ];
	  })
	 
	  function generate_message(msg, type) {
	    INDEX++;
	    var str="";
	    var htr="";
	    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
	    str += "          <div class=\"cm-msg-text\">";
	    str += msg;
	    str += "          <\/div>";
	    str += "        <\/div>";
	    $(".chat-logs").append(str);
	    htr +="<br><br><br>"
	    if(msg == '메인'){
	      htr += "          <div class=\"cm-msg-text\">";
	      htr += "<span class=\"main-msg\">안녕하세요 규장각 입니다</span><br>"
    	  htr += "<span class=\"main-msg\">버튼을 클릭 하시거나 키워드를 입력해 주세요!</span>"
    	  htr += "<ul><li class=\"site-info\">사이트 이용안내</li><li class=\"site-info-resend\">대출 * 반납</li><li class=\"site-ifno-room\">이용시설 안내</li><li class=\"quest\">문의하기</li></ul>"
	      htr += "          <\/div>";
	    }else if(msg == '대출' || msg == '반납' || msg == '대출 * 반납'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">대출 반납 안내 페이지</span><br><br>"
		  htr += "<ul><li>대출 * 반납 안내</li></ul>"
		  htr += "          <\/div>";
	    }else if(msg == '문의' || msg == '1:1' || msg == '고객센터' || msg == '문의하기'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">문의 페이지가 오픈 됩니다.</span><br><br>"
		  htr += "<ul><li>문의하기</li></ul>"
		  htr += "          <\/div>";
	    }else if(msg == '예약' || msg == '이용시설 안내'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">열람실, 스터디룸 예약 페이지로 이동됩니다!</span><br><br>"
		  htr += "<ul><li>열람실 예약</li><li>스터디룸 예약</li></ul>"
		  htr += "          <\/div>";
		}else if(msg == '신청'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">희망도서 신청 페이지로 이동됩니다!</span><br><br>"
		  htr += "<ul><li>희망도서 신청</li></ul>"
		  htr += "          <\/div>";
		}else if(msg == '정보' || msg =='사이트 이용안내'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">규장각 소개 페이지로 이동됩니다!</span><br><br>"
		  htr += "<ul><li>사이트 소개</li></ul>"
		  htr += "          <\/div>";
		}else if(msg == '키워드' || msg == '단어'){
		  htr += "          <div class=\"cm-msg-text\">";
		  htr += "<span class=\"main-msg\">규장각 챗봇의 키워드 로는 </span><br><br>"
		  htr += "<span class=\"main-msg\">메인,대출,반납,문의,예약,신청,정보,키워드 가 있습니다 </span><br><br>"
		  htr += "          <\/div>";
		}else{
	      htr += "          <div class=\"cm-msg-text\">";
	      htr += "죄송합니다 무슨 말씀이신지 모르겠어요"
	      htr += "          <\/div>";
	    }
	    //채팅div 추가
	    $(".chat-logs").append(htr);
	    //애니메이션
	     $("#cm-msg-"+INDEX).hide().fadeIn(300);
	    //인풋창 초기화
	    if(type == 'self'){
	     $("#chat-input").val(''); 
	    }    
	    //스크롤 항상 아래 보여줌
	    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
	    //
	    $("#chat-input").attr("value", "");
	    //
	  }  

	  
	  $("#chat-circle").click(function() {    
	    $("#chat-circle").toggle('scale');
	    $(".chat-box").toggle('scale');
	  })
	  
	  $(".chat-box-toggle").click(function() {
	    $("#chat-circle").toggle('scale');
	    $(".chat-box").toggle('scale');
	  })
	  
 //////////////////////////////////////////////////////////////////////////////////////////////
	  
	  const showing_class = "showing";
		const firstslide = document.querySelector(".slider_item:first-child");

		function slide() {
			const currentSlide = document.querySelector(".showing");
		    if(currentSlide){
		        currentSlide.classList.remove(showing_class);
		        const nextSlide = currentSlide.nextElementSibling;
		        if(nextSlide){
		            nextSlide.classList.add(showing_class);
		        } else {
		            firstslide.classList.add(showing_class);
		        }
		        
		    } else {
		        firstslide.classList.add(showing_class);
		    }
		}
		slide();
		setInterval(slide, 4000)

		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 3,
			spaceBetween : 30,
			loop : true,
			autoplay : {
				delay : 3000,
				disableOnInteraction : false,
			},
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			scrollbar : {
				el : '.swiper-scrollbar',
			}
		});
});
///////////////////////////////////////////////////////

$(document).on("click", ".site-info",function(e){
//	document.getElementById("chat-input").value = this.innerHTML;
	$("#chat-input").val(this.innerHTML);
	  $("#chat-submit").click();
});
$(document).on("click", ".site-info-resend",function(e){
//	document.getElementById("chat-input").value = this.innerHTML;
	$("#chat-input").val(this.innerHTML);
	$("#chat-submit").click();
});
$(document).on("click", ".site-ifno-room",function(e){
//	document.getElementById("chat-input").value = this.innerHTML;
	$("#chat-input").val(this.innerHTML);
	$("#chat-submit").click();
});
$(document).on("click", ".quest",function(e){
//	document.getElementById("chat-input").value = this.innerHTML;
	$("#chat-input").val(this.innerHTML);
	$("#chat-submit").click();
});
	
/////////////////////////////////////////////
  
  
  

