<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int level = (Integer) session.getAttribute("level");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
body {
	background-color: lightgray;
	color: #D2D1D5;
	margin: 0;
}
h3 {
	color: black;
}

table {
	margin: 60px auto;
	width: 500px;
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

.noBorder a {
	text-decoration: none;
	color: blue;
}

.links {
	text-align: center;
}

.links a {
	font-size: 14px;
	text-decoration: none;
	color: black;
}
.links a:hover {
	color: blue;
}
.logout-btn {
	text-align: center;
}

.logout-btn button {
	font-size: 15px;
	border: none;
	background: transparent;
	margin-top: 10px;
}
.logout-btn button:hover {
	cursor: pointer;
	color: red;
}

</style>
</head>
<body>
	<table border="2">
		<tr class="head">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>이메일</td>
		</tr>
		<%
		Connection conn = null;
		Statement stmt = null;
		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/board";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "java", "java");
		} catch (Exception e) {
			out.println("데이터베이스 접속에 문제");
			e.printStackTrace();
		}
		stmt = conn.createStatement();
		String sql = "SELECT * FROM message ORDER BY id ASC";
		ResultSet rs = stmt.executeQuery(sql);
		sql = "SELECT @ROWNUM:=@ROWNUM+1 AS ROWNUM FROM message, (SELECT @ROWNUM:=0) R";
		ResultSet result = stmt.executeQuery(sql);

		if (rs != null) {
			while (rs.next() && result.next()) {
				int id = Integer.parseInt(rs.getString("id"));
				int re = Integer.parseInt(result.getString("ROWNUM"));
		%>
		<tr>
			<td class="noBorder"><%=re%></td>
			<td class="noBorder"><a href=display.jsp?id=<%=id%>> <%=rs.getString("subject")%></a></td>
			<td class="noBorder"><%=rs.getString("name")%></td>
			<td class="noBorder"><%=rs.getString("time")%></td>
			<td class="noBorder"><%=rs.getString("email")%></td>
		</tr>
		<%
		}
		}
		if (!rs.next()) {
		sql = "ALTER TABLE message AUTO_INCREMENT=1";
		rs = stmt.executeQuery(sql);
		}
		%>
	</table>
	<div class="links">
		<%
		if (level >= 3) {
		%>
		<a href="write.jsp">게시글 쓰기</a>
		<%
		} else {
		%>
		<h3>게시글 쓰기 권한 없음</h3>
		<%
		}
		%>
		<a href="../ebookshop/order.jsp">책 사러 가기</a>
	</div>
	<div class="logout-btn">
		<form action="logout.jsp" method="post">
			<button type="submit">로그아웃</button>
		</form>
	</div>
	<%
	if (stmt != null) {
		stmt.close();
	}
	if (conn != null) {
		conn.close();
	}
	%>
</body>
</html>