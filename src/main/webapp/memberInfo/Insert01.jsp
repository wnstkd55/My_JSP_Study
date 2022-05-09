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
		<p> 아이디 : <input type = "text" name = "id">
		<p> 비밀번호 : <input type = "password" name = "passwd">
		<p> 이름 : <input type = "text" name = "name">
		<p> 이메일 : <input type = "text" name= "email">
		<p> <input type = "submit" values = "전송"></p>
		
	</form>

</body>
</html>

<!-- 
	method = "post"
		-- http 헤더 앞에 값을 넣어 전송, 보안이 강하다. 전송용량의 제한이 없다. 파일 전송할때
	mothod = "get"
		-- http 헤더 뒤에 붙어서 전송, 보안에 취약. 전송량의 제한을 가지고 있다.
		-- 게시판에 사용.
 -->