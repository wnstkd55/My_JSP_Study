<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file= "dbconn_oracle.jsp" %>

<table width="700" border ="1">
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>직종</th>
		<th>상사</th>
		<th>입사날</th>
		<th>월급</th>
		<th>보너스</th>
		<th>부서번호</th>
	</tr>
	<%
	ResultSet rs = null;	//ResultSet 객체는 DB의 테이블을 Select해서 나온 결과 레코드셋을 담는 객체
	Statement stmt = null;		//SQL쿼리를 담아서 실행하는 객체
	
	try{
		String sql = "SELECT * FROM emp_copy";
		stmt = conn.createStatement();		//connection객체의 createStatement()로 stmt를 활성화
		rs = stmt.executeQuery(sql);
			//stmt.executeQuery(sql)	: select한결과를 ResultSet객체에 저장해야함.
			//stmt.executeUpdate(sql)	: insert, update, delete
		while(rs.next()){
			int eno = rs.getInt("eno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			int manager = rs.getInt("manager");
			Date hiredate = rs.getDate("hiredate");
			double salary = rs.getDouble("salary");
			double commission = rs.getDouble("commission");
			double dno = rs.getDouble("dno");
			%>
			<tr>
			<td><%=eno %></td>
			<td><%=ename %></td>
			<td><%=job %></td>
			<td><%=manager %></td>
			<td><%=hiredate %></td>
			<td><%=salary %></td>
			<td><%=commission %></td>
			<td><%=dno %></td>
		</tr>
		<%
		}
	}catch(Exception ex){
		out.println("테이블 호출하는데 실패했습니다.");
		out.println(ex.getMessage());
	}finally{
		if(rs!=null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
	%>
</table>
</body>
</html>