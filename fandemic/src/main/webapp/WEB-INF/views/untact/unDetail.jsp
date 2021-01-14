<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
#chat_box {
    width: 200px;
    min-width: 200x;
    height: 200px;
    min-height: 200px;
    border: 1px solid black;
}
#msg {
    width: 700px;
}
#msg_process {
    width: 90px;
}
</style>
<script src="http://192.168.0.58:82/socket.io/socket.io.js"></script>
<script src="http://192.168.0.58:82/rtc.js"></script>
<script>
  $(document).ready(function(){
      var socket = io("http://192.168.0.58:82");
      
      //msg에서 키를 누를떄
      $("#msg").keydown(function(key){
          //해당하는 키가 엔터키(13) 일떄
          if(key.keyCode == 13){
              //msg_process를 클릭해준다.
              msg_process.click();
          }
      });
      
      //msg_process를 클릭할 때
      $("#msg_process").click(function(){
          //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
           socket.emit("send_msg", "채팅1: " + $("#msg").val());
          //#msg에 벨류값을 비워준다.
          $("#msg").val("");
      });
      
      //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
      socket.on('send_msg', function(msg) {
          //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
          $('<div></div>').text(msg).appendTo("#chat_box");
      });
  

  });
</script>

<section class="home">
<div class="container">
	<h1>채팅 1</h1>
	<div id="chat_box"></div>
    <input type="text" id="msg">
    <button id="msg_process">전송</button>
</div>

  
 <div>
     <video id="localVideo" autoplay width="480px"></video>
     <video id="remoteVideo" width="480px" autoplay></video>
 </div>
		
        


</section>