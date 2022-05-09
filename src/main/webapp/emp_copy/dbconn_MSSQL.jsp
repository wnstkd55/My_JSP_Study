<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;		//DB를 연결하는 객체
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";	//Oracle Driver에 접속
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB";
	Boolean connect = false;	//접속이 잘 되는지 확인 하는 변수
	
	Class.forName(driver);	//오라클 드라이버 로드함.
	conn = DriverManager.getConnection(url,"sa","1234");
%>


</body>
</html>