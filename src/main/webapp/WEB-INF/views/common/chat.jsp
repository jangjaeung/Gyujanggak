<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
</head>
<body>
<div id="chat-circle" class="btn btn-raised">
        <div id="chat-overlay"></div>
		    <i class="material-icons">chat</i>
		</div>
  
	  <div class="chat-box">
	    <div class="chat-box-header">
	      ChatBot
	      <span class="chat-box-toggle"><i class="material-icons">close</i></span>
	    </div>
	    <div class="chat-box-body">
	      <div class="chat-box-overlay">   
	      </div>
	      <div class="chat-logs">
	       	<div class="cm-msg-text">
              <span>안녕하세요 규장각 입니다</span>
              <ul>
                <li>사이트 이용안내</li>
                <li>대출 * 반납</li>
                <li>이용시설 안내</li>
              </ul>
           </div>
	      </div><!--chat-log -->
	    </div>
	    <div class="chat-input">      
	      <form>
	        <input type="text" id="chat-input" placeholder="Send a message..."/>
	      <button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
	      </form>      
	    </div>
	  </div>
</body>
</html>

