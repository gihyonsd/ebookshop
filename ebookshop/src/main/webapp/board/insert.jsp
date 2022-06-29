<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		String email, subject, memo, time, id;
		String name = (String)session.getAttribute("name");
		email = request.getParameter("email");
		subject = request.getParameter("subject");
		memo = request.getParameter("memo");
		id = request.getParameter("id");
		
		String sql;
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
		sql = "INSERT INTO message values(?,?,now(),?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, name);
		pstmt.setString(3, memo);
		pstmt.setString(4, email);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
	%>
	<h3>게시글이 등록되었습니다.</h3>
	<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>