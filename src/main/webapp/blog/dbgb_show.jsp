<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<%@ include file = "dbconn_oracle.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
<link href="filegb.css" rel="stylesheet" type="text/css">
</head>
<center>
<%
	
	Vector name = new Vector(); // vector db���� ���� ����
	Vector email = new Vector();
	Vector inputdate = new Vector();
	Vector subject = new Vector();
	Vector content = new Vector();
	
	// ����¡ó�� ����
	int where = 1;
	
	int totalgroup = 0;	// ������, ����� ����¡�� �׷��� �ִ밳��
	int maxpage = 2;
	int startpage = 1;
	int endpage = startpage + maxpage - 1;
	int wheregroup = 1;	// ���� ��ġ�ϴ� �׷�
	
	// go ����
	if(request.getParameter("go") != null) {
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where - 1) / maxpage + 1;
		endpage = startpage + maxpage - 1;
		
	// gogroup ����
	}else if (request.getParameter("gogroup") != null){ //gogroup������ ���� ������ �� ��
   wheregroup = Integer.parseInt(request.getParameter("gogroup"));
   startpage = (wheregroup-1) * maxpage + 1;  
   where = startpage ; 
   endpage = startpage + maxpage - 1; 
  }
  
  
  int nextgroup = wheregroup+1;   // �����׷� : ����׷� + 1
  int priorgroup= wheregroup-1;	// �����׷� : ����׷� - 1

  int nextpage = where + 1;	// ���������� : ���������� + 1
  int priorpage = where - 1;	// ���������� : ���������� - 1
  int startrow = 0;	// �ϳ��� page���� ���ڵ� ���۹�ȣ
  int endrow = 0;		// �ϳ��� page����  ���ڵ� ������ ��ȣ
  int maxrows = 2;		// ����� ���ڵ� �� 
  int totalrows = 0;		// �� ���ڵ� ����
  int totalpages = 0;		// �� ������ ���� 
  
  
  // ����¡ó�� ��

	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB�� select �ؿ���
	try {
		sql = "select * from guestboard order by inputdate desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if ( !(rs.next())) {	// ���� ���� ���
			out.println("�ش� ������ ���̽��� ������ �����ϴ�.");
		}else {
			
			do{
			
			name.addElement(rs.getString("name"));
		    email.addElement(rs.getString("email"));
		    inputdate.addElement(rs.getString("inputdate"));
		    subject.addElement(rs.getString("subject"));
		    content.addElement(rs.getString("content"));
			}while (rs.next());
			   
				
			totalrows = name.size();	
			totalpages = (totalrows - 1)/maxrows + 1;
			startrow = (where - 1) * maxrows;		
			endrow = startrow + maxrows - 1  ;		// ���� �������� ������ ���ڵ� ��ȣ
		
			if (endrow >= totalrows) {
			  endrow = totalrows - 1;
			 }
				
			totalgroup = (totalpages - 1) / maxpage + 1;
			
			
			if (endpage > totalpages){
				endpage = totalpages;
			}
			
			String em = null;
			// ���� �������ּ� ���۷��ڵ�(startindex), ������ ���ڵ�(endindex)���� ��ȯ�ϸ鼭 ��� 
			for( int j = startrow; j <= endrow; j++){
				
				String ema=(String)email.elementAt(j); //email Vector���� email�ּ� �������.	
	    
			    if ((ema == null) || (ema.equals("")) ) { //�����ּҰ� ������� ��
			    em= (String)email.elementAt(j); // �̸��Ͽ� ��ũ��������
			    }
			    else {
				   em = "<A href=mailto:" + ema + ">" + email.elementAt(j) + "</A>"; // �����ּҰ� ���� �� �̸��� ���� ��ũ
			    }   
				   
				   out.println("<table width='600' cellspacing='0' cellpadding='2' align='center'>");
				   out.println("<tr>");
				   out.println("<td height='22'>&nbsp;</td></tr>");
				   out.println("<tr align='center'>");
				   out.println("<td height='1' bgcolor='#1F4F8F'></td>");
				   out.println("</tr>");
				   
				   out.println("<tr align='center' bgcolor='#DFEDFF'>");
				   out.println("<td class='button' bgcolor='#DFEDFF'>"); 
				   out.println("<div align='left'><font size='2'>"+ subject.elementAt(j) + "</div> </td>"); // ���� ���
				   out.println("</tr>");
				   
				   out.println("<tr align='center' bgcolor='#FFFFFF'>");
				   out.println("<td align='center' bgcolor='#F4F4F4'>"); 
				   out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
				   out.println("<tr bgcolor='#F4F4F4'>");
				   out.println("<td width='13%' height='7'></td>");
				   out.println("<td width='51%' height='7'>�۾��� : "+ name.elementAt(j) +"</td>"); // �̸�
				   out.println("<td width='51%' height='7'>E-mail : "+ em +"</td>");	// �̸���
				   out.println("<td width='25%' height='7'></td>");
				   out.println("<td width='11%' height='7'></td>");
				   out.println("</tr>");
				   out.println("<tr bgcolor='#F4F4F4'>");
				   out.println("<td width='13%'></td>");
				   out.println("<td width='51%'>�ۼ��� : " + inputdate.elementAt(j) + "</td>");	//�ۼ���
				   out.println("<td width='11%'></td>");
				   out.println("</tr>");
				   out.println("</table>");
				   out.println("</td>");
				   out.println("</tr>");
				   
				   out.println("<tr align='center'>");
				   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
				   out.println("</tr>");
				   
				   out.println("<tr align='center'>");
				   out.println("<td style='padding:10 0 0 0'>");
				   out.println("<div align='left'><br>");
				   out.println("<font size='3' color='#333333'>"+ content.elementAt(j) + "</div>"); // ����
				   out.println("<br>");
				   out.println("</td>");
				   out.println("</tr>");
				   
				   out.println("<tr align='center'>");
				   out.println("<td class='button' height='1'></td>");
				   out.println("</tr>");
				   
				   out.println("<tr align='center'>");
				   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
				   out.println("</tr>");
				   
				   out.println("<tr>");
				   out.println("<td height='22'>&nbsp;</td></tr>");
				   out.println("<tr align='center'>");
			    
			}
				   out.println("</table>");	
				
		}
		
	} catch (Exception e){
		out.println(e.getMessage());
	} finally {
		if( rs != null)
			rs.close();
		if ( pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
			if (wheregroup > 1) {	
				  out.println("[<A href=dbgb_show.jsp?gogroup=1>ó��</A>]"); 
				  out.println("[<A href=dbgb_show.jsp?gogroup="+priorgroup +">����</A>]");
				 } else {
				  out.println("[ó��]") ;
				  out.println("[����]") ;
				 }
				 if (name.size() !=0) { 
				  for(int jj= startpage; jj <= endpage; jj++) {
				   if (jj == where) 
				    out.println("[" + jj + "]") ;
				   else
				    out.println("[<A href=dbgb_show.jsp?go=" + jj + ">" + jj + "</A>]") ;  
				   } 
				  }
				  if (wheregroup < totalgroup) {
				   out.println("[<A href=dbgb_show.jsp?gogroup="+ nextgroup+ ">����</A>]");
				   out.println("[<A href=dbgb_show.jsp?gogroup="+ totalgroup + ">������</A>]");
				  } else {
				   out.println("[����]");
				   out.println("[������]");
				  }
				  out.println ("��ü �ۼ� :"+totalrows); 
			 
			 out.println ("<p>");
			 
			 out.println("<a href = 'dbgb_write.htm'>");
			 out.println("<img src ='image/write.gif' border = '0'></a>");
			  

	%>

</center>
</html>