<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"java","java");
		
		String sql = "INSERT INTO user VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setInt(5, 1);
		pstmt.executeUpdate();
		out.println("<script>alert('회원가입이 완료되었습니다!'); location.href='login.jsp'; </script>");
	} catch(Exception e) {
		e.printStackTrace();
		out.println("<script>alert('회원가입이 실패하였습니다'); location.href='joinForm.jsp'; </script>");
	} finally {
		try {
			pstmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
