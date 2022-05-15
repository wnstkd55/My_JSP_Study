<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*, java.util.*, java.text.*" %>
<% request.setCharacterEncoding("EUC-KR");%> <!--  한글처리 -->
<%@ include file = "dbconn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>폼의 값을 받아서 DataBase에 값을 넣어주는 파일</title>
</head>
<body>
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String inp = request.getParameter("inputdate");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	
	int pos = 0;
	/*
	if(cont.length()==1){
		cont = cont + " ";
	}
	*/
	
	//textarea 내의 ' 가 들어가면 db에 insert, update시 문제 발생
	
	
	while((pos = cont.indexOf("\'",pos)) != -1){		//-1 값이 존재하지 않을때
		String left = cont.substring(0,pos);
			//out.println("pos: "+pos+"<p>");
			//out.println("left: "+left+"<p>");
		String right = cont.substring(pos,cont.length());
			//out.println("right: "+right+"<p>");
		cont = left + "\'" + right;
		pos += 2;
	}

	//if(true)return;
	
	//오늘의 날짜 처리
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd h:mm a");
	String ymd = myformat.format(yymmdd);
	inp = ymd;
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt = 0;		// Insert가 잘 되었는지 그렇지 않은지 확인하는 변수
	
	try{
		
		sql = "INSERT INTO guestboard(name, email,inputdate,subject,content)values('"+na+"', '"+em+"', '"+inp+"', '"+sub+"', '"+cont+"')";
		st = conn.createStatement();
		//out.println(sql);
		
		cnt = st.executeUpdate(sql);	// cnt > 0 : Insert 성공
		//out.println(sql);
		//if(true)return;
		
		if(cnt > 0){
			out.println("데이터가 성공적으로 입력 되었습니다.");
		}else{
			out.println("데이터가 입력되지 않았습니다.");
		}
		
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(st != null)
			st.close();
		if(conn != null)
			conn.close();
	}
	
%>

<jsp:forward page = "dbgb_show.jsp"/>

<!-- 

	jsp : foward : 서버단에서 페이지를 이동, 클라이언트의 기존 url의 정보가 바뀌지 않는다.
	
	response.sendRedirect : 
		클라이언트에서 페이지를 재요청으로 페이지 이동, 이동하는 페이지로 url정보가 바뀐다.
	--> 
</body>
</html>