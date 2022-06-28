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
</head>
<body>
	<h1>인터넷 프로그래머 문고</h1>
	<h3>제목을 입력하세요:</h3>
	<form method="post">
		책 제목: <input type="text" name="title"><br> <input
			type="submit" value="검색">
	</form>
	<a href="../board/list.jsp">게시글 보기로 돌아가기</a>
	<%
	String title = request.getParameter("title");
	if (title != null) {
	%>
	<%
	Connection conn = null;
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
	conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	String sqlStr = "SELECT * FROM books WHERE title LIKE ";
	sqlStr += "'%" + title +"%'";
	sqlStr += "ORDER BY title ASC";
	ResultSet rs = stmt.executeQuery(sqlStr);
	%>
	<hr>
	<form method="post" action="order_proc.jsp">
		<table border=1 cellpadding=5>
			<tr>
				<th>주문</th>
				<th>저자</th>
				<th>제목</th>
				<th>가격</th>
				<th>남아있는 수랑</th>
			</tr>
			<%
			while (rs.next()) {
				int id = rs.getInt("id");
			%>
			<tr>
				<td><input type="checkbox" name="id" value="<%=id%>"></td>
				<td><%=rs.getString("author")%></td>
				<td><%=rs.getString("title")%></td>
				<td><%=rs.getString("price")%>원</td>
				<td><%=rs.getInt("qty")%>권</td>
			</tr>
			<%
			}
			%>
		</table>
		<br>
		<input type="submit" value="주문"> <input type="reset"
			value="초기화">
	</form>
	<a href="<%=request.getRequestURI()%>"><h3>다시 주문하기</h3></a>
	<%
	rs.close();
	stmt.close();
	conn.close();
	}
	%>
</body>
</html>