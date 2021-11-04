
window.onload = function(){
	//chat bot
	$(function() {
		  var INDEX = 0; 
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
		    // setTimeout(function() {      
		    //   generate_message(msg);  
		    // }, 1000)
		    
		  })
		 
		  function generate_message(msg, type) {
		    INDEX++;
		    var str="";
		    var htr="";
		    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
		    str += "          <span class=\"msg-avatar\">";
		    str += "          <\/span>";
		    str += "          <div class=\"cm-msg-text\">";
		    str += msg;
		    str += "          <\/div>";
		    str += "        <\/div>";
		    $(".chat-logs").append(str);
		    htr +="<br><br><br>"
		    if(msg == '메인'){
		      htr += "          <span class=\"msg-avatar\">";
		      htr += "          <\/span>";
		      htr += "          <div class=\"cm-msg-text\">";
		      htr += "메인 div"
		      htr += "          <\/div>";
		    }else{
		      htr += "          <span class=\"msg-avatar\">";
		      htr += "          <\/span>";
		      htr += "          <div class=\"cm-msg-text\">";
		      htr += "죄송합니다 무슨 말씀이신지 모르겠어요"
		      htr += "          <\/div>";
		    }
		    //채팅div 추가
		    $(".chat-logs").append(htr);
		    //애니메이션
		    // $("#cm-msg-"+INDEX).hide().fadeIn(300);
		    //인풋창 초기화
		    if(type == 'self'){
		     $("#chat-input").val(''); 
		    }    
		    //스크롤 항상 아래 보여줌
		    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);    
		  }  

		  
		  $("#chat-circle").click(function() {    
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		  
		  $(".chat-box-toggle").click(function() {
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		  
		})
/////////////////////////////////////////////
	  
	  
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
};

