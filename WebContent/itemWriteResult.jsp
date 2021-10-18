<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sql = "insert into item values(?,?,?)";
		// 실행시킬 쿼리문에 ? 있으면
		Connection conn = null;
		PreparedStatement pstmt = null;
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String uid="scott";
		String pass="tiger";
	%>
	<%
		try{//1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, pass); //2. 연결 객체 얻기
			pstmt = conn.prepareStatement(sql); //3. statement 객체 얻기
			// ? -> 바인딩 변수
			request.setCharacterEncoding("UTF-8");
			String name=request.getParameter("name");
			String price=request.getParameter("price");
			String description=request.getParameter("description");
		
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(price));
			pstmt.setString(3, description);
			//4. 쿼리문 실행
			pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			if(pstmt!= null)
				pstmt.close();
			if(conn!= null)
				conn.close();
		}
	%>
<a href=itemWrite.jsp>결과 보기</a>
</body>
</html>