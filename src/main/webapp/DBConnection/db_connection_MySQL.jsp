<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MSSQL DB Connection</title>
</head>
<body>

<%
	//변수 초기화
	Connection conn = null;		//DB를 연결하는 객체
	String driver = "com.mysql.jdbc.Driver";	//MySQL Driver에 접속
	String url = "jdbc:mysql://localhost:3306/mydb";
	Boolean connect = false;	//접속이 잘 되는지 확인 하는 변수
	
	try{
		Class.forName(driver);	//오라클 드라이버 로드함.
		conn = DriverManager.getConnection(url,"root","1234");
		
		connect = true;
		conn.close();
	}catch(Exception e){
		connect = false;
		e.printStackTrace();
	}
	
%>
<%
	if(connect == true){
		out.println("MySQL DB에 잘 연결되었습니다.");
	}else{
		out.println("MySQL DB에 연결되지 않았습니다.");
	}
%>

</body>
</html>