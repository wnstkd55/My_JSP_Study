<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*"  %>

<% request.setCharacterEncoding("EUC-KR"); %>	<!-- Form���� �Ѱ��ִ� �ѱ��� ������ �ʵ��� �ѱ�ó�� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>form���� �Ѱܹ��� ���� DB�� insert�ϴ� ������</title>
</head>
<body>
<%@ include file = "db_conn_oracle.jsp"%>	<!--  Connection ��ü -->
<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString();		//���� �ý����� ������(�ѱ�)
	
	// ������ �ѱ� ������ �� �Ѿ������ Ȯ��
	//out.println(na + "<p>" + em + "<p>" + sub + "<p>" + cont + "<p>" + ymd);

	String sql = null;
	Statement st = null;	//Statement : sql ������ �����ϴ� ��ü
				// conn ��ü���� �ڵ����� Ŀ�� ������ ����Ǿ� ����.
	int cnt = 0;	//insert, update, delete�� �� ����Ǿ����� Ȯ��
					//cnt > 0 : insert, update, delete�� �� ����Ǿ����� Ȯ��
	
	try{
		sql = "insert into guestboard2(name, email, inputdate, subject, content)";
		sql = sql + " values('"+na+"', '"+em+"', '"+ymd+"', '"+sub+"', '"+cont+"')";
		
		st = conn.createStatement();		//st : statemenet ��ü Ȱ��ȭ (XE, hr2, 1234)
							//conn => hr2 ������ 1234 ��ȣ�� ���ӵǾ��ִ�.
		cnt = st.executeUpdate(sql); //insert, update, delete���� ���
		
		
		/*
		if(cnt > 0){
			out.println("DB�� �� insert�� �Ǿ����ϴ�.");
		}else{
			out.println("DB�� insert�� ���� �ʾҽ��ϴ�.");
		}
		
		*/
		
		// sql ������ �� �Ѿ������ Ȯ���� ���� ����
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