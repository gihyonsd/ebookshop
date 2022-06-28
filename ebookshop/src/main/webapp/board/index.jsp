<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String name = (String)session.getAttribute("name"); 
	int level = (Integer)session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=name %>님 환영합니다.</h3>
	<%if(level == 1) { %>
		<h3>안녕하세요! 레벨 1이라 게시글 보기 권한이 없어요.</h3>
		<form action="logout.jsp" method="post">
			<input type="submit" value="로그아웃">
		</form>
	<% } else { %>
		<a href="list.jsp">게시글 보러 가기</a>
	<% } %>
</body>
</html>