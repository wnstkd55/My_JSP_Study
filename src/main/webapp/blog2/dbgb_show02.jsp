<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����Ʈ</title>
<link href = "filebg.css" rel = "stylesheet" type = "text/css">
</head>
<body>
<%@ include file = "db_conn_oracle.jsp" %>

<%
	//Vector �÷����� �����ؼ� DB���� ������ �����͸� �����ϴ� Vector ��ü ����
	Vector name = new Vector();			// �̸� �÷��� �����ϴ� ����
	Vector email = new Vector();			//�̸��� �÷��� �����ϴ� ����
	Vector inputdate = new Vector();		//��¥ �÷��� �����ϴ� ����
	Vector subject = new Vector();			//���� �÷��� �����ϴ� ����
	Vector content = new Vector();			// ���� �÷��� �����ϴ� ����
	
	//����¡ ó���� ���� �����ϱ�
	int where = 1;							// ���� ��ġ�� page ��ȣ
	int totalgroup = 0;						// ������ �׷��� ����
	int maxpage = 2;						// ����� ������ ����
	int startpage = 1;						// ����� �������� ù��° ���ڵ�
	int endpage = startpage+maxpage-1;		// ����� �������� ������ ���ڵ�
	int wheregroup = 1;						// ���� ��ġ�� pagegroup
	
	//get������� �������� ���������� go(���� ������)
		//gogroup(���� ������ �׷�) ������ �޾Ƽ� ó���� �ؾߵ�.
	
	if(request.getParameter("go") != null){		//���� ������ ��ȣ�� �Ѿ�ö�
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpage + 1;
		startpage = (wheregroup - 1) * maxpage + 1;
		endpage = startpage + maxpage -1;
		
	}else if(request.getParameter("gogroup") != null){		//���� ������ �׷��� ��ȣ�� �Ѿ�ö�
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		startpage = (wheregroup -1) * maxpage + 1;
		where = startpage;
		endpage = startpage + maxpage -1;
	}
	
	int nextgroup = wheregroup + 1;		//[����] ��ũ�ɸ� ����
	int priorgroup = wheregroup - 1;	//[����] ��ũ�ɸ� ����
	
	int nextpage = where + 1;	// ���� ������
	int priorpage = where -1;	// ���� ������
	
	int startrow = 0;		//Ư�� ���������� ���� ���ڵ��ȣ
	int endrow = 0;			//Ư�� ���������� ������ ���ڵ� ��ȣ
	
	int maxrows = 2;		// ��½� 2���� ���ڵ常 ���
	int totalrows = 0;			// �� ���ڵ� ����(DB)
	int totalpage = 0;
	
	
	String sql = null;
	Statement st = null;
	ResultSet rs = null;		//Select�� ����� ���ڵ� ���� ��� ��ü		==> executeQuery�� �ϸ� ������� �״�� ��µȴ�.
	
	try{
		sql = "select * from guestboard2 order by inputdate desc";
		st = conn.createStatement();
		rs = st.executeQuery(sql);
		
		if(!(rs.next())){			// rs(������� �������� ������)
			out.println("��α׿� �ø� ���� �����ϴ�.");
		}else{			//rs�� ������� �����Ҷ�, DB���� ������ �� ��� ����
			do{
%>
	<table width = "600" border = "1">
	<tr height = "25"><td colspan = "2">&nbsp;</td></tr>		<!-- ���� -->
	<tr>
		<td colspan = "2" align = "center"> <h3><%= rs.getString("subject") %><h3></td>
	</tr>
	<tr>
		<td>�۾��� : <%= rs.getString("name")%></td>
		<td>�̸��� : <%= rs.getString("email")%></td>
	</tr>
	<tr>
		<td colspan = "2">�۾���¥ : <%= rs.getString("inputdate")%></td>
	</tr>
	<tr>
		<td colspan = "2" width = "600"> <%= rs.getString("content")%> </td>
	</tr>
	
	<tr height = "25"><td colspan = "2">&nbsp;</td></tr>		<!-- ���� -->
	</table>
<%				}while(rs.next());		//rs�� ���� �����ϴµ��� ��� ��ȯ�ϸ鼭 ���
		}				// ��� ��
		










	
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(conn != null)
			conn.close();
		if(st != null)
			st.close();
	}
	


%>
</body>
</html>