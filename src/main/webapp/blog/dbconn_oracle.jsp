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
	Connection conn = null;		//DB�� �����ϴ� ��ü
	String driver = "oracle.jdbc.driver.OracleDriver";	//Oracle Driver�� ����
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	Boolean connect = false;	//������ �� �Ǵ��� Ȯ�� �ϴ� ����
	
	Class.forName(driver);	//����Ŭ ����̹� �ε���.
	conn = DriverManager.getConnection(url,"hr2","1234");
	
%>


</body>
</html>