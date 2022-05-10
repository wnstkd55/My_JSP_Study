<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete 를 통한 데이터 삭제</title>
</head>
<body>
	<form method = "post" action="delete05_process.jsp">
		<p> 아이디 : <input type = "text" name = "id">
		<p> 비밀번호 : <input type = "password" name = "passwd">
		<p> 이름 : <input type = "text" name = "name">
		<p> 이메일 : <input type = "text" name= "email">
		<p> <input type = "submit" value = "전송"></p>
		
	</form>
</body>
</html>