<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");	
%>
<jsp:useBean id="itemBean" class="com.mission.javabeans.ItemBean" />
<jsp:setProperty property="*" name="itemBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>입력 완료된 정보</h2>
	<%
		try{
			String url="jdbc:oracle:thin:@localhost:1521:XE";
			String uid="scott";
			String pass="tiger";
			String sql = "SELECT * FROM item";
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공");
			conn = DriverManager.getConnection(url, uid, pass);
			System.out.println("연결 성공");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			out.println("<table border=1>");
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("NAME")+"</td>");
				out.println("<td>"+rs.getString("PRICE")+"</td>");
				out.println("<td>"+rs.getString("DESCRIPTION")+"</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>