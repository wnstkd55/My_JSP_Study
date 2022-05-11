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
	String sub = request.getParameter("subject");
	String cont = request.getParameter("content");
	String pw = request.getParameter("password");
	
	int id = 1;		//DB�� ID �÷��� ������ ��
	int pos = 0;
	if(cont.length()==1){
		cont = cont + " ";
	}
	
	//content�� (Text Area)�� ���͸� ó���� ����Ѵ�. Oracle DB�� ����ÿ�
	while((pos = cont.indexOf("\'",pos)) != -1){
		String left = cont.substring(0,pos);
		String right = cont.substring(pos,cont.length());
		cont = left + "\'" + right;
		pos += 2;
	}
	
	//������ ��¥ ó��
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-dd h:mm a");
	String ymd = myformat.format(yymmdd);
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt = 0;		// Insert�� �� �Ǿ����� �׷��� ������ Ȯ���ϴ� ����
	
	try{
		// ���� �����ϱ� ���� �ֽ� �� ��ȣ(max(id))�� �����ͼ� +1�� �����Ѵ�.
		// conn (Connection) : Auto commit;�� �۵���.
			//commit�� ������� �ʾƵ� inert, update, delete, �ڵ� Ŀ���� �ȴ�.
		st = conn.createStatement();
		sql = "select max(id) from freeboard";
		rs = st.executeQuery(sql);
		
		if(!(rs.next())){	//rs�� ���� ���������
			id = 1;
		}else{		//rs�� ���� �����Ҷ�
			id = rs.getInt(1) + 1;	//�ִ밪 +1 
		}
		
		
		sql = "INSERT INTO freeboard(id, name, password, email, subject, ";
		sql = sql + "content, inputdate, masterid, readcount, replynum,step)";
		sql = sql + " values("+id+", '"+na+"', '"+pw+"', '"+em;
		sql = sql + "', '"+sub+"', '"+cont+"', '"+ymd+"', "+id+",";
		sql = sql + "0,0,0)";
		
		//out.println(sql);
		
		cnt = st.executeUpdate(sql);	// cnt > 0 : Insert ����
		
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

<jsp:forward page = "freeboard_list.jsp"/>

</body>
</html>