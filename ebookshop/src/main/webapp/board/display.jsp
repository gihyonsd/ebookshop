<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 표시</title>
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
		<td>제목</td>
		<td><%=subject %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=memo %></td>
	</tr>
	<tr>
	</tr>
	<tr>
		<td>날짜</td>
		<td><%=time %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email %></td>
	</tr>
	</table>
	<br>
	<br>
	<a href="list.jsp">게시글 리스트 보기</a>
	<a href=delete.jsp?id=<%=id %>>삭제</a>
</body>
</html>