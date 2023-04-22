<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스인을 위한 요리 레시피</title>


<style>
   body{text-align: center;background-color:lightgoldenrodyellow;}
   h2{border:2px solid;width:300px;height:40px;margin:auto;background-color:white;}
   .form-box{border:2px solid;width:300px;height:400px;margin:auto;background-color:white;}
</style>
</head>
<body>
   <h2>회원가입 화면</h2>
   <form name="signup" action="emailPro.jsp" method="get" onsubmit="return checkForm()">
   <input id="keyChack" type="text" value="">
   <input id="idChack" type="text" value="">
      <div class="form-box"><br>
      <div class="form-group">
         ＊ID:       <input type="text" id="id" placeholder="아이디를 입력하세요" />
         <input id="idChackBtn" type="button" value="ID중복확인">
         <br><br>
      </div>
      <div class="form-group">
         *PW:       <input type="password" id="pw" placeholder="비밀번호를 입력하세요" /><br><br>
      </div>
      <div class="form-group">
         *Name:     <input type="text" id="name" placeholder="이름을 입력하세요" /><br><br>
      </div>
      <div class="form-group">
         *NickName: <input type="text" id="nickname" placeholder="닉네임을 입력하세요" /><br><br>
      </div>
      <div class="form-group">
         *Email:    <input type="text" id="emaildata" name="email" placeholder="이메일을 입력하세요" /><br><br>
         <button id="emailChackBtn" type="button">이메일보내기</button>
         
          	<div id="NumChackView" style="display: none;">
      			인증번호 입력:<input id="keydata" type="text" name="random" placeholder="인증번호를 입력하세요"/><br><br>
      			<button id="keygo" type="button">인증확인</button>
     		</div>
         
      </div>
      <input type="submit" value="회원가입"/></div>
   </form> 

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<script>

//아이디 중복여부 확인
$(function() {
    $("#idChackBtn").click(function() {
      $.ajax({
        url : "../user/IdChack",  // 요청 URL
        type : "post",                  // HTTP 메서드
        data : {                       // 매개변수로 전달할 데이터
            id : $('#id').val()                  // 값보내는 예시
        },
        dataType : "json",      // 응답 데이터 형식 text, json, html
        success : function(data){//idChack
        			console.log("ajax 돌아옴")
	        	   console.log(data.idchack);
	        	   $("#idChack").val(data.idchack);
	        	},  // 요청 성공 시 호출할 메서드 설정
        error : errFunc         // 요청 실패 시 호출할 메서드 설정
      });
    });
});

//이메일보내기
$(function() {
    $("#emailChackBtn").click(function() {
      $.ajax({
        url : "../user/EmailChack.do",  // 요청 URL
        type : "get",                  // HTTP 메서드
        data : {                       // 매개변수로 전달할 데이터
            email : $('#emaildata').val(),                   // 값보내는 예시
        },
        dataType : "text",      // 응답 데이터 형식 text, json, html
          // 요청 성공 시 호출할 메서드 설정
        success : function() {
        	$('#NumChackView').css('display', 'block');
		},
		error : errFunc// 요청 실패 시 호출할 메서드 설정
      });
    });
});
// 이메일 인증 확인
$(function() {
    $("#keygo").click(function() {
      $.ajax({
        url : "../user/EmailChack.do",  // 요청 URL
        type : "post",                  // HTTP 메서드
        data : {                       // 매개변수로 전달할 데이터
            key : $('#keydata').val(),                   // 값보내는 예시
        },
        dataType : "json",      // 응답 데이터 형식 text, json, html
          // 요청 성공 시 호출할 메서드 설정
        success : function(data) {
        	console.log("에이작스 부분 돌아옴");
        	console.log(data.keychack);
        	$("#keyChack").val(data.keychack);
		},
		error : errFunc// 요청 실패 시 호출할 메서드 설정
      });
    });
});

//실패 시 경고창을 띄워줍니다.
function errFunc(e) {
    alert("실패: " + e.status);
}
function checkForm() {
    if ($("#keyChack").val() !== "메일인증성공") {
	   
	    alert("메일인증이 안되었습니다");
	    return false;
	}
    if($("#idChack").val()!=="아이디중복없음"){
    	
	    alert("아이디중복체크가 안되었습니다");
	    return false;
    }
    if ($("#id").val().trim()==""||$("#name").val().trim()==""||$("#nickname").val().trim()==""||$("#pw").val().trim()=="") {
    	alert("공백을 채워주세요");
	    return false;
    }
    
	
    return true;
}


</script>

</html>