<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이메일 인증하기</title>
<style>
	body{background-color:black;color:white;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(function () {
    var authCode;
    
    // 이메일 인증번호 보내기 버튼 클릭 시
    $('#sendMailBtn').click(function () {
        $.ajax({
            url: "EmailProcess.jsp",
            type: "get",                 
            data: {                       
                email: $('#searchEmail').val()
            },
            success: function (data) {
                authCode = data.trim(); // 서버에서 반환한 인증번호 저장
                alert("인증번호를 보냈습니다.");
            },
            error: function () {
                alert("인증번호를 보내는데 실패하였습니다.");
            }
        });
    });

    // 이메일 인증 확인 버튼 클릭 시
    $('#authBtn').click(function (event) {
    	authCode='${sessionScope.authcode}';
        event.preventDefault(); //버튼 시 기본 동작 방지
    	
    	var inputCode = $('#authCodeInput').val();
        
        if (inputCode === authCode) {
            console.log(authCode);
            alert("인증되었습니다.");
            // 여기에 인증 성공 시 수행할 코드를 작성합니다.
        } else {
            console.log(authCode);
            alert("인증번호가 일치하지 않습니다.");
        }
    });
});
</script>
</head>
<body>
    <h1>이메일 인증하기</h1>
    <form>
  		 Email <input type="email" name="email" placeholder="ex)1234@naver.com" required id="searchEmail"/>
  		<button id="sendMailBtn" type="button">인증번호 보내기</button>
  		<input type="text" name="number" value="" placeholder="인증번호를 입력하세요." id="authCodeInput"/>
  		<button type="submit" id="authBtn">확인</button> 
	</form>
</body>
</html>