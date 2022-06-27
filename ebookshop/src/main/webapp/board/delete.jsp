<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "java", "java");
	} catch(Exception e) {
		out.println("연결 실패");
		e.printStackTrace();
	}
	String sql = "DELETE FROM message WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
	pstmt.executeUpdate();
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>