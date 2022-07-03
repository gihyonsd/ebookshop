<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>
<style>
body {
	background-color: lightgray;
	color: #D2D1D5;
	margin: 0;
}
table {
	margin: 60px auto;
	width: 400px;
}
tr {
	background-color: #fafafa;
	text-align: center;
	color: black;
}
.td_title {
	font-weight: bold;
	font-size: large;
}
</style>
<script>	
function check_pw() {
    if(document.getElementById('pass').value !='' && document.getElementById('confirm_pass').value!=''){
        if(document.getElementById('pass').value==document.getElementById('confirm_pass').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}
</script>
</head>
<body>
	<form action="joinProcess.jsp" method="post">
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원 가입 페이지</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="text" name="id" id="id" placeholder="ID" required /></td>
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass"
					placeholder="Password" onchange="check_pw()" required /></td>
			</tr>
			<tr>
				<td><label for="pass">비밀번호 확인: </label></td>
				<td><input type="password" name="confirm_pass"
					id="confirm_pass" placeholder="비밀번호 확인" onchange="check_pw()" 
					required /><br><span id="check"></span></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name" required /></td>
			</tr>
			<tr>
				<td><label for="email">이메일 주소 : </label></td>
				<td><input type="text" name="email" id="email" required /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입">&nbsp;&nbsp;
					<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>