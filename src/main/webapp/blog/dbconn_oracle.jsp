<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;		//DB를 연결하는 객체
	String driver = "oracle.jdbc.driver.OracleDriver";	//Oracle Driver에 접속
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Boolean connect = false;	//접속이 잘 되는지 확인 하는 변수
	
	Class.forName(driver);	//오라클 드라이버 로드함.
	conn = DriverManager.getConnection(url,"hr2","1234");
	
%>


</body>
</html>