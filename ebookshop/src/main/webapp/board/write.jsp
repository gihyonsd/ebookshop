<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String name = (String)session.getAttribute("name");
	String email = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력</title>
</head>
<body>
	<h3>게시글 입력 화면</h3>
	<form action="insert.jsp" method="post" onsubmit="return subalert(this);">
		<table border="2">
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="<%=name %>" size="60" disabled></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="memo" cols="53" rows="5"></textarea></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name = "email" value="<%=email %>" size="60" disabled></td>
			</tr>
		</table>
		<br><br><input type="submit" value="게시글 등록"> <input type="reset" value="다시 쓰기">
	</form>
	<a href="list.jsp">게시글 리스트 보기</a>
	<script>
		function subalert(form) {
			if(!form.subject.value) {
				alert('제목을 입력하세요.');
				return false;
			}
			if(!form.memo.value) {
				alert('내용을 입력하세요.');
				return false;
			}
			if(!form.email.value) {
				alert('이메일을 입력하세요.');
				return false;
			}
		}
	</script>
</body>
</html>