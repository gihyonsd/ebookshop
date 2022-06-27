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
			<th>저자</th>
			<th>제목</th>
			<th>가격</th>
			<th>수량</th>
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
			<td><%=rs.getString("author")%></td>
			<td><%=rs.getString("title")%></td>
			<td><%=rs.getInt("price")%>원</td>
			<td><%=rs.getInt("qty")%></td>
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
	<a href="order.jsp"><h3>주문화면으로 돌아가기</h3></a>
</body>
</html>