<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        * {
            box-sizing: border-box;
            border-radius: 5px;
        }
        body {
            margin: 0;
            background-color: gray;
        }
        .login-form {
            width: 300px;
            margin-right: auto;
            margin-left: auto;
            margin-top: 50px;
            padding: 20px;
            text-align: center;
            border: none;
            background-color: lightgray;
        }
        .text-field {
            font-size: 14px;
            padding: 10px;
            border: none;
            width: 260px;
            margin-bottom: 10px;
        }
        .submit-btn {
            font-size: 14px;
            border: none;
            padding: 10px;
            width: 260px;
            margin-bottom: 15px;
            background-color: lightskyblue;
            color: white;
        }
        .submit-btn:hover {
            cursor: pointer;
        }
        .links {
            text-align: center;
        }
        .links a {
            font-size: 12px;
            color: black;
        }
    </style>
</head>

<body>
    <div class="login-form">
        <form action="loginProcess.jsp" method="post">
            <input type="text" name="id" id="id" class="text-field" placeholder="아이디">
            <input type="password" name="pass" id="pass" class="text-field" placeholder="비밀번호">
            <input type="submit" value="로그인" class="submit-btn">
            <div class="links">
                <a href="joinForm.jsp">회원가입 하러가기</a>
            </div>
        </form>
    </div>
</body>
</html>