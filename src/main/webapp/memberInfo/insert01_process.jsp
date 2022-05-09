<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼에서 넘겨받은 값을 db에 저장하는 파일</title>
</head>
<body>
<%@ include file = "dbconn_oracle.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");	//폼에서 넘긴 한글처리하기 위함.
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	Statement stmt = null;	//Statement 객체 : SQL 쿼리 구문을 실행하는 객체
	
	try{
		String sql ="INSERT INTO mbtb1 ( idx, id, pass, name, email ) Values (seq_mbTb1_idx.nextval, '" + id + "','"+  passwd + "','" + name+"','" + email + "') ";
		stmt = conn.createStatement();	//connection객체를 통해서 statement객체 생성
		stmt.executeUpdate(sql);		//statement객체를 통해서 sql을 실행함.
				//stmt.executeUpdate(sql) : sql <== insert, delete update문이 온다.
				//stmt.executeQuery(sql) : sql <== select문이 오면서 결과를 Resultset객체로 반환
		out.println("테이블 삽입에 성공하였습니다.");
		
		
	}catch(Exception e){
		out.println("mbTb1 테이블 삽입을 실패하였습니다.");
		out.println(e.getMessage());
	}finally{
		if(stmt != null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
	
%>
<%=id %><p>
<%=passwd %><p>
<%=name %>
</body>
</html>