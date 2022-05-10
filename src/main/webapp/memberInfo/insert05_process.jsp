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
	
	PreparedStatement pstmt = null;	//PreparedStatement 객체 : SQL 쿼리 구문을 실행하는 객체
	String sql = null;		//전역변수로 선언
	
	try{
		sql ="INSERT INTO mbtb1 ( idx, id, pass, name, email ) Values (seq_mbTb1_idx.nextval,?,?,?,? )";
		pstmt = conn.prepareStatement(sql);	 	//PreparedStatement 객체 생성시에 sql 구문을 넣습니다.
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		pstmt.executeUpdate();
				//stmt.executeUpdate(sql) : sql <== insert, delete update문이 온다.
				//stmt.executeQuery(sql) : sql <== select문이 오면서 결과를 Resultset객체로 반환
		out.println("테이블 삽입에 성공하였습니다.");
		
		out.println("<p> <p>");
		
		out.println(sql);
		
	}catch(Exception e){
		out.println("mbTb1 테이블 삽입을 실패하였습니다.");
		out.println(e.getMessage());
		out.println(sql);
		
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
	
%>
<%=id %><p>
<%=passwd %><p>
<%=name %><p>
<%=email %><p><p>


<%=sql %><p><p>				
<% out.println(sql); %>


</body>
</html>