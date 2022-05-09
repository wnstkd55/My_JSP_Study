<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn_oracle.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");	//폼에서 넘긴 한글처리하기 위함.
	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String manager = request.getParameter("manager");
	String hiredate = request.getParameter("hiredate");
	String salary = request.getParameter("salary");
	String commission = request.getParameter("commission");
	String dno = request.getParameter("dno");
	
	
	Statement stmt = null;	//Statement 객체 : SQL 쿼리 구문을 실행하는 객체
	
	try{
		String sql ="INSERT INTO emp_copy ( eno, ename, job, manager, hiredate, salary, commission, dno ) Values ("+eno+", '"+ename+"', '"+job+"', "+manager+", '"+hiredate+"', "+salary+", "+commission+", "+dno+")";
		stmt = conn.createStatement();	//connection객체를 통해서 statement객체 생성
		stmt.executeUpdate(sql);		//statement객체를 통해서 sql을 실행함.
				//stmt.executeUpdate(sql) : sql <== insert, delete update문이 온다.
				//stmt.executeQuery(sql) : sql <== select문이 오면서 결과를 Resultset객체로 반환
		out.println("테이블 삽입에 성공하였습니다.");
		
		
	}catch(Exception e){
		out.println("emp_copy 테이블 삽입을 실패하였습니다.");
		out.println(e.getMessage());
	}finally{
		if(stmt != null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
	
%>

<%=eno %><p>
<%=ename %><p>
<%=job %><p>
<%=manager %><p>
<%=hiredate %><p>
<%=salary %><p>
<%=commission %><p>
<%=dno %><p>

</body>
</html>