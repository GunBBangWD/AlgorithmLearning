<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
        .login-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 2rem;
            border: 1px solid #e3e3e3;
            border-radius: 5px;
            background-color: #ffffff;
        }

        .text-field {
            margin-bottom: 1.5rem;
        }

        .submit-btn {
            width: 100%;
            margin-bottom: 1.5rem;
        }
    </style>

</head>
<body>
	<div class="login-form">
        <form id="find-password-form">
            <div class="mb-3">
                <input id="pw_id" type="text" name="id" class="form-control text-field" placeholder="아이디">
            </div>
            <div class="mb-3">
                <input id="pw_name" type="text" name="name" class="form-control text-field" placeholder="이름">
            </div>
            <div class="mb-3">
                <input id="pw_email" type="text" name="email" class="form-control text-field" placeholder="이메일">
            </div>
            <div class="mb-3">
                <input type="submit" value="비밀번호 찾기" class="btn btn-primary submit-btn">
            </div>
        </form>

        <form id="find-id-form">
        	<div class="mb-3">
                <input id="id_id" type="hidden" name="id" class="form-control text-field" value="아이디찾기">
            </div>
            <div class="mb-3">
                <input id="id_name" type="text" name="name" class="form-control text-field" placeholder="이름">
            </div>
            <div class="mb-3">
                <input id="id_email" type="text" name="email" class="form-control text-field" placeholder="이메일">
            </div>
            <div class="mb-3">
                <input type="submit" value="아이디 찾기" class="btn btn-primary submit-btn">
            </div>
        </form>
    </div>

		<script>
        $('#find-password-form').on('submit', function(e) {
            e.preventDefault();
            $.ajax({
                type: 'post',
                url: '../user/IdPwChack',
                data : {                       // 매개변수로 전달할 데이터
                    id : $('#pw_id').val(),                  // 값보내는 예시
                    name : $('#pw_name').val(),
                    email : $('#pw_email').val()
                },
                dataType : "json",
                success: function(response) {
                    alert("비밀번호 : "response.message);
                    window.location.href = "../project/loginCheck.do";
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('에러가 발생했습니다. 다시 시도해주세요.');
                }
            });
        });

        $('#find-id-form').on('submit', function(e) {
            e.preventDefault();
            $.ajax({
                type: 'POST',
                url: '../user/IdPwChack',
                data : {                       // 매개변수로 전달할 데이터
                	id : $('#id_id').val(),                     // 값보내는 예시
                    name : $('#id_name').val(),
                    email : $('#id_email').val()
                },
                dataType : "json",
                success: function(response) {
                    alert("아이디 : "response.message);
                },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert('에러가 발생했습니다. 다시 시도해주세요.');
                    }
                });
            });
        </script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</html>