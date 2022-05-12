<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*" %>    
<%request.setCharacterEncoding("EUC-KR"); %>
<%@ include file = "dbconn_oracle.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href = "filegb.css" rel = "stylesheet" type = "text/css">
<title>�� ����(���� DataBase�� ������ ó���ϴ� ������)</title>
</head>
<body>
	<a href = "freeboard_list.jsp?go=<%= request.getParameter("page") %>">�Խ��� ������� �̵�</a>
<%
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	try{
		sql = "select * from freeboard where id = ?";	//DB�� ��й�ȣ�� ������ �Ѱܿ� ��й�ȣ Ȯ��
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		rs = pstmt.executeQuery();
		
		if(!(rs.next())){
			out.println("�ش� ������ �������� �ʽ��ϴ�.");
		}else{
			//�����ϴ� ���� Password�� Ȯ�� �� ������ ����
			String pwd = rs.getString("password");
			if(pwd.equals(request.getParameter("password"))){
				sql = "delete freeboard where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				cnt = pstmt.executeUpdate();
				
				if(cnt > 0){
					out.println("�ش� ������ �� ���� �Ǿ����ϴ�.");
				}else{
					out.println("�ش系���� �������� �ʾҽ��ϴ�.");
				}
				
				
			}else{
				out.println("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			}
		}
		
		
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn!= null)
			conn.close();
	}
	
	
	
	
	
	
	
	
	
	
%>


</body>
</html>