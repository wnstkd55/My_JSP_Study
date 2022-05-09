<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action="insert01_process.jsp">
		<p> 사원번호 : <input type = "number" name = "eno">
		<p> 사원이름 : <input type = "text" name = "ename">
		<p> 직종 : <input type = "text" name = "job">
		<p> 상사 : <input type = "number" name= "manager">
		<p> 입사날짜 : <input type = "date" name= "hiredate">
		<p> 월급 : <input type = "number" name= "salary">
		<p> 보너스 : <input type = "number" name= "commission">
		<p> 부서번호 : <input type = "number" name= "dno">
		<p> <input type = "submit" values = "전송"></p>
</body>
</html>