<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스인을 위한 요리 레시피</title>


<style>
   body{text-align: center;background-color:lightgoldenrodyellow;}
   h2{border:2px solid;width:300px;height:40px;margin:auto;background-color:white;}
   .form-box{border:2px solid;width:300px;height:500px;margin:auto;background-color:white;}
</style>
</head>
<body>
   <h2>회원가입 화면</h2>
   <form name="signup" action="../project/join.do" method="post" onsubmit="return checkForm()">
<!--    <input id="keyChack" type="text" name="keyChack" value="" style="visibility:hidden;"> -->
<!--    <input id="idChack" type="text" name="idChack" value="" style="visibility:hidden;"> -->
<!--    <input id="nickChack" type="text" name="nickChack" value="" style="visibility:hidden;"> -->
		<input id="keyChack" type="hidden" name="keyChack" value="">
	   <input id="idChack" type="hidden" name="idChack" value="" >
	   <input id="nickChack" type="hidden" name="nickChack" value="" >
      <div class="form-box"><br>
      <div class="form-group">
         ＊ID:       <input type="text" id="id" name="user_id" placeholder="아이디를 입력하세요" />
         <input id="idChackBtn" type="button" value="ID중복확인">
         <br><br>
      </div>
      <div class="form-group">
         *PW:       <input type="password" id="pw" name="user_pw" placeholder="비밀번호를 입력하세요" /><br><br>
      </div>
      <div class="form-group">
         *Name:     <input type="text" id="name" name="user_name" placeholder="이름을 입력하세요" /><br><br>
      </div>
      <div class="form-group">
         *NickName: <input type="text" id="nickname" name="user_nickname" placeholder="닉네임을 입력하세요" />
         <input id="nickChackBtn" type="button" value="닉네임중복확인">
         <br><br>
      </div>
      <div class="form-group">
         *Email:    <input type="text" id="emaildata" name="user_email" placeholder="이메일을 입력하세요" /><br><br>
         <button id="emailChackBtn" type="button">이메일보내기</button>
         
          	<div id="NumChackView" style="display: none;">
      			인증번호 입력:<input id="keydata" type="text" name="random" placeholder="인증번호를 입력하세요"/><br><br>
      			<button id="keygo" type="button">인증확인</button>
     		</div>         
      </div>
      <div class="form-group">
      주소
				<input class="form-control" style="top: 5px;" name="user_address" id="m_addr" type="text" readonly>
				  <input type="button" class="btn btn-primary btn-sm" value="주소찾기" onclick="sample6_execDaumPostcode()">
      </div>
      <div class="form-group">
      전화번호
          <input type="tel" name="user_phone" placeholder="(ㅡ 없이 입력해주세요)">
      </div>
      
      
      <input type="submit" value="회원가입"/></div>
   </form>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
<script>


</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//주소관련 함수
function sample6_execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      var fullAddr = ''; 
	      var extraAddr = '';
	      if (data.userSelectedType === 'R') { 
	        fullAddr = data.roadAddress;
	      } else { 
	        fullAddr = data.jibunAddress;
	      }
	      if (data.userSelectedType === 'R') {
	        if (data.bname !== '') {
	          extraAddr += data.bname;
	        }
	        if (data.buildingName !== '') {
	          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	        }
	        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
	      }
	      document.getElementById('m_addr').value = fullAddr;
	      function handleClick() {
	    	  sample6_execDaumPostcode();
	    	  window.close(); // 팝업창에서 호출하는 경우에만 동작합니다.
	    }
	    }
	}).open();
}


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
	        	   if (data.idchack!=="아이디중복없음") {
                       alert("아이디가 중복됩니다. 다른 아이디를 사용해주세요.");
                   } else {
                       alert("사용 가능한 아이디입니다.");
                   }
	        	},  // 요청 성공 시 호출할 메서드 설정
        error : errFunc         // 요청 실패 시 호출할 메서드 설정
      });
    });
});

//닉네임 중복여부 확인
$(function() {
    $("#nickChackBtn").click(function() {
      $.ajax({
        url : "../user/NickChack",  // 요청 URL
        type : "post",                  // HTTP 메서드
        data : {                       // 매개변수로 전달할 데이터
            nick : $('#nickname').val()                  // 값보내는 예시
        },
        dataType : "json",      // 응답 데이터 형식 text, json, html
        success : function(data){//idChack
        			console.log("ajax 돌아옴")
	        	   console.log(data.nickchack);
	        	   $("#nickChack").val(data.nickchack);
	        	   if (data.nickchack!=="닉네임중복없음") {
                       alert("닉네임이 중복됩니다. 다른 아이디를 사용해주세요.");
                   } else {
                       alert("사용 가능한 닉네임입니다.");
                   }
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
        	if (data.keychack!=="메일인증성공") {
                alert("인증번호가 다름니다 다시 입력해주세요");
            } else {
                alert("메일인증 성공");
            }
        	
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
	if($("#nickChack").val()!=="닉네임중복없음"){
    	
	    alert("닉네임중복체크가 안되었습니다");
	    return false;
    }
//     if ($("#id").val().trim()==""||$("#name").val().trim()==""||$("#nickname").val().trim()==""||$("#pw").val().trim()=="") {
//     	alert("공백을 채워주세요");
// 	    return false;
//     }
	if ($("#id").val().trim()=="") {
	    	alert("ID를 입력해주세요");
		    return false;
	    }
	if ($("#pw").val().trim()=="") {
	    	alert("비밀번호를 입력해주세요");
		    return false;
	    }
	if ($("#name").val().trim()=="") {
	    	alert("이름을 입력해주세요");
		    return false;
	    }
	if ($("#nickname").val().trim()=="") {
	    	alert("닉네임을 입력해주세요");
		    return false;
	    }
	if ($("#m_addr").val().trim()=="") {
    	alert("주소를 입력해주세요");
	    return false;
    }
	if ($("#emaildata").val().trim()=="") {
	    	alert("이메일을 입력해주세요");
		    return false;
	    }
    
	
    return true;
}


</script>

</html>