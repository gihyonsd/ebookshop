<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<form action="loginProcess.jsp" method="post">
	아이디 : <input type="text" name="id" id="id" required><br>
	비밀번호 : <input type="password" name="pass" id="pass" required><br>
	<input type="submit" name="login" value="로그인"> <button><a href="joinForm.jsp">회원가입</a></button>
	</form>
</body>
</html>