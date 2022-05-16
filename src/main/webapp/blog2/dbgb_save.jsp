<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*"  %>

<% request.setCharacterEncoding("EUC-KR"); %>	<!-- Form에서 넘겨주는 한글을 깨지지 않도록 한글처리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>form에서 넘겨받은 값을 DB에 insert하는 페이지</title>
</head>
<body>
<%@ include file = "db_conn_oracle.jsp"%>	<!--  Connection 객체 -->
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString();		//현재 시스템의 로케일(한국)
	
	// 폼에서 넘긴 변수가 잘 넘어오는지 확인
	//out.println(na + "<p>" + em + "<p>" + sub + "<p>" + cont + "<p>" + ymd);

	String sql = null;
	Statement st = null;	//Statement : sql 구문을 실행하는 객체
				// conn 객체에서 자동으로 커밋 구문이 적용되어 있음.
	int cnt = 0;	//insert, update, delete가 잘 적용되었는지 확인
					//cnt > 0 : insert, update, delete가 잘 적용되었는지 확인
	
	try{
		sql = "insert into guestboard2(name, email, inputdate, subject, content)";
		sql = sql + " values('"+na+"', '"+em+"', '"+ymd+"', '"+sub+"', '"+cont+"')";
		
		st = conn.createStatement();		//st : statemenet 객체 활성화 (XE, hr2, 1234)
							//conn => hr2 계정의 1234 암호로 접속되어있다.
		cnt = st.executeUpdate(sql); //insert, update, delete문인 경우
		
		
		/*
		if(cnt > 0){
			out.println("DB에 잘 insert가 되었습니다.");
		}else{
			out.println("DB에 insert가 되지 않았습니다.");
		}
		
		*/
		
		// sql 구문이 잘 넘어오는지 확인을 위한 구문
		//out.println(sql);
		//if(true)return;
	}catch(Exception ex){
		out.println(ex.getMessage());	
	}finally{
		if(st != null)
			st.close();
		if(conn != null)
			conn.close();
	}


%>

<jsp:forward page = "dbgb_show.jsp"/>

 
</body>
</html>