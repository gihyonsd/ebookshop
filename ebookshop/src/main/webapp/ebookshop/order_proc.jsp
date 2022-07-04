<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문처리화면</title>
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
	font-size: 17px;
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
</style>
</head>
<body>
	<h1>인터넷 프로그래머 서점</h1>
	<h2>주문해주셔서 감사합니다.</h2>
	<%
	String[] ids = request.getParameterValues("id");
	if (ids != null) {
	%>
	<%
	Connection conn = null;
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mariaDB");
	conn = ds.getConnection();
	PreparedStatement pstmt = null;
	String sqlStr;
	int recordUpdated;
	ResultSet rs;
	%>
	<table border=2>
		<tr>
			<th class="head">저자</th>
			<th class="head">제목</th>
			<th class="head">가격</th>
			<th class="head">남아있는 수량</th>
			<%
			for (int i = 0; i < ids.length; ++i) {
				sqlStr = "UPDATE books SET qty = qty - 1 WHERE id = ?";
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, ids[i]);
				recordUpdated = pstmt.executeUpdate();
				sqlStr = "SELECT * FROM books WHERE id = ?";
				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, ids[i]);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
		
		<tr>
			<td class="noBorder"><%=rs.getString("author")%></td>
			<td class="noBorder"><%=rs.getString("title")%></td>
			<td class="noBorder"><%=rs.getInt("price")%>원</td>
			<td class="noBorder"><%=rs.getInt("qty")%></td>
		</tr>
		<%
		}
		rs.close();
		}
		pstmt.close();
		conn.close();
		}
		%>
	</table>
	<div class="links">
	<a href="order.jsp"><h3>주문화면으로 돌아가기</h3></a>
	</div>
</body>
</html>