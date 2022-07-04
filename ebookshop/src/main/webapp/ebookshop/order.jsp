<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 서점</title>
<style>
* {
	box-sizing: border-box;
}

body {
	text-align: center;
	background-color: gray;
	margin: 0;
}

.form-div {
	width: 450px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
	padding: 20px;
	text-align: center;
	border: none;
	background-color: lightgray;
	border-radius: 5px;
}

.text-field {
	font-size: 14px;
	padding: 10px;
	border: none;
	width: 260px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.submit-btn {
	font-size: 14px;
	border: none;
	padding: 10px;
	width: 260px;
	margin-bottom: 15px;
	background-color: gray;
	color: white;
	border-radius: 5px;
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
	text-decoration: none;
}

.links a:hover {
	color: blue;
}

table {
	margin: 60px auto;
	width: 500px;
	border: none;
}

.head {
	background-color: lightskyblue;
}

tr {
	background-color: #fafafa;
	text-align: center;
	color: black;
}

.noBorder {
	border: none;
}
.btn input {
	border: none;
	background-color: gray;
	font-size: 16px;
	margin: 3px;
}
.btn input:hover {
	color: blue;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="form-div">
		<h1>인터넷 프로그래머 문고</h1>
		<form method="post">
			<input type="text" name="title" class="text-field" placeholder="책 제목"><br>
			<input type="submit" value="검색" class="submit-btn ">
		</form>
		<div class="links">
			<a href="../board/list.jsp">게시글 보기로 돌아가기</a>
		</div>
	</div>
	<%
	String title = request.getParameter("title");
	if (title != null) {
	%>
	<%
	Connection conn = null;
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
	conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	String sqlStr = "SELECT * FROM books WHERE title LIKE ";
	sqlStr += "'%" + title + "%'";
	sqlStr += "ORDER BY title ASC";
	ResultSet rs = stmt.executeQuery(sqlStr);
	%>
	<hr>
	<form method="post" action="order_proc.jsp">
		<table border=1 cellpadding=5>
			<tr>
				<th class="head">주문</th>
				<th class="head">저자</th>
				<th class="head">제목</th>
				<th class="head">가격</th>
				<th class="head">남아있는 수랑</th>
			</tr>
			<%
			while (rs.next()) {
				int id = rs.getInt("id");
			%>
			<tr>
				<td class="noBorder"><input type="checkbox" name="id"
					value="<%=id%>"></td>
				<td class="noBorder"><%=rs.getString("author")%></td>
				<td class="noBorder"><%=rs.getString("title")%></td>
				<td class="noBorder"><%=rs.getString("price")%>원</td>
				<td class="noBorder"><%=rs.getInt("qty")%>권</td>
			</tr>
			<%
			}
			%>
		</table>
		<br> 
		<div class="btn">
		<input type="submit" value="주문">
		<input type="reset" value="초기화">
		</div>
	</form>
	<div class="links">
	<a href="<%=request.getRequestURI()%>"><h3 style="font-size: 17px;">다시 주문하기</h3></a>
	</div>
	<%
	rs.close();
	stmt.close();
	conn.close();
	}
	%>
</body>
</html>