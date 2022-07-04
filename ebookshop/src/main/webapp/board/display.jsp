<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
   int level = (Integer)session.getAttribute("level");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 표시</title>
<style>
body {
	background-color: lightgray;
	color: #D2D1D5;
	margin: 0;
}

table {
	margin: 60px auto;
	width: 500px;
}
tr {
	background-color: #fafafa;
	text-align: center;
	color: black;
}

.noBorder {
	border: none;
}
.links {
	position: relative;
	text-align: center;
	bottom: 50px;
}
.links a {
	font-size: 16px;
	text-decoration: none;
	color: black;
}
.links a:hover {
	color: blue;
}
</style>
</head>
<body>
<h3>게시글 내용</h3>
<%
	String subject="", memo="", name="", time="", email="";
	int id = Integer.parseInt(request.getParameter("id"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
	} catch(Exception e) {
		out.println("데이터 베이스 접속 문제");
		e.printStackTrace();
	}
	ResultSet rs = null;
	String sql = "SELECT * FROM message WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
	rs = pstmt.executeQuery();
	
	while(rs.next()) {
		subject = rs.getString("subject");
	    memo = rs.getString("memo");
		name = rs.getString("name");
		time = rs.getString("time");
		email = rs.getString("email");
	}
%>
	<table border="2">
	<tr>
		<td class="noBorder">제목</td>
		<td class="noBorder"><%=subject %></td>
	</tr>
	<tr>
		<td class="noBorder">작성자</td>
		<td class="noBorder"><%=name %></td>
	</tr>
	<tr>
		<td class="noBorder">내용</td>
		<td class="noBorder"><%=memo %></td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td class="noBorder">날짜</td>
		<td class="noBorder"><%=time %></td>
	</tr>
	<tr>
		<td class="noBorder">이메일</td>
		<td class="noBorder"><%=email %></td>
	</tr>
	</table>
	<br>
	<br>
	<div class="links">
	<a href="list.jsp">게시글 리스트 보기</a>
<<<<<<< HEAD
	<%if(level >= 3) { %>
	<a href=delete.jsp?id=<%=id %> onclick="return confirm('삭제 하시겠습니까?');">삭제</a>
	<% } %>
	</div>
	<script>
	</script>
=======
	<a href=delete.jsp?id=<%=id %>>삭제</a>
	</div>
>>>>>>> db2acdf31192553b4159fa93d6f2056531c6bab2
</body>
</html>