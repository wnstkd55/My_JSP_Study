<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*, java.util.*, java.text.*" %>
<% request.setCharacterEncoding("EUC-KR");%> <!--  �ѱ�ó�� -->
<%@ include file = "dbconn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� �޾Ƽ� DataBase�� ���� �־��ִ� ����</title>
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
	
	//textarea ���� ' �� ���� db�� insert, update�� ���� �߻�
	
	
	while((pos = cont.indexOf("\'",pos)) != -1){		//-1 ���� �������� ������
		String left = cont.substring(0,pos);
			//out.println("pos: "+pos+"<p>");
			//out.println("left: "+left+"<p>");
		String right = cont.substring(pos,cont.length());
			//out.println("right: "+right+"<p>");
		cont = left + "\'" + right;
		pos += 2;
	}

	//if(true)return;
	
	//������ ��¥ ó��
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd h:mm a");
	String ymd = myformat.format(yymmdd);
	inp = ymd;
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt = 0;		// Insert�� �� �Ǿ����� �׷��� ������ Ȯ���ϴ� ����
	
	try{
		
		sql = "INSERT INTO guestboard(name, email,inputdate,subject,content)values('"+na+"', '"+em+"', '"+inp+"', '"+sub+"', '"+cont+"')";
		st = conn.createStatement();
		//out.println(sql);
		
		cnt = st.executeUpdate(sql);	// cnt > 0 : Insert ����
		//out.println(sql);
		//if(true)return;
		
		if(cnt > 0){
			out.println("�����Ͱ� ���������� �Է� �Ǿ����ϴ�.");
		}else{
			out.println("�����Ͱ� �Էµ��� �ʾҽ��ϴ�.");
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

	jsp : foward : �����ܿ��� �������� �̵�, Ŭ���̾�Ʈ�� ���� url�� ������ �ٲ��� �ʴ´�.
	
	response.sendRedirect : 
		Ŭ���̾�Ʈ���� �������� ���û���� ������ �̵�, �̵��ϴ� �������� url������ �ٲ��.
	--> 
</body>
</html>