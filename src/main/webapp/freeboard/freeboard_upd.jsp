<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %> 
<HTML>
<HEAD>
<SCRIPT language="javascript">
function check() {
 with(document.msgwrite){
  if(subject.value.length == 0){
   alert("������ �Է��� �ּ���!!");
   subject.focus();
   return false;
  }
  if(name.value.length == 0){
   alert("�̸��� �Է��� �ּ���!!");
   name.focus();
   return false;
  }
  if(password.value.length == 0){
   alert("��й�ȣ�� �Է��� �ּ���!!");
   password.focus();
   return false;
  }
  if(content.value.length == 0){
   alert("������ �Է����ּ���!!");
   content.focus();
   return false;
  }
  document.msgwrite.submit();
 }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>

<%@ include file = "dbconn_oracle.jsp" %>

<P>
<%
 String sql=null;
// Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;
 int id = Integer.parseInt(request.getParameter("id"));
 String p= request.getParameter("page");
 
 
 try {
  sql = "select * from freeboard where id=? ";
  st = conn.prepareStatement(sql);
  st.setInt(1, id);
  rs = st.executeQuery();
  if (!(rs.next()))  {
   out.println("�ش� ������ �����ϴ�");
  } else {
%>
<FORM name="msgwrite" method=POST action="freeboard_upddb.jsp?id=<%=id%>&page=<%=p%>">
 <table width="600" cellspacing="0" cellpadding="2" align = "center">
  <tr> 
   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#DFEDFF" height="20" class="notice">&nbsp;&nbsp;<font size="2">�� �����ϱ�</font></td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#1F4F8F" height="1"></td>
  </tr>
  <tr> 
   <td width="124" height="30" align="center" bgcolor="#f4f4f4">�� ��</td>
   <td width="494"  style="padding:0 0 0 10"> 
    <input type=text name=name value="<%=rs.getString("name")%>" class="input_style1">
   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">E-mail</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=email value="<%=rs.getString("email")%>" class="input_style1">
   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">�� ��</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=subject size="60" value="<%=rs.getString("subject")%>" class="input_style2">
   </td>
  </tr>
  <tr> 
   <td width="124" height="162" align="center" valign="top" bgcolor="#f4f4f4" style="padding-top:7;">�� ��</td>
   <td width="494" valign="top"  style="padding:5 0 5 10"> 
    <textarea name=content cols="65" rows="10" class="textarea_style1"><%=rs.getString("content")%> </textarea>
   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#f4f4f4">�� ȣ</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type='password' name='password'  class="input_style1"><br>(��Ȯ�� ��й�ȣ�� �Է��ؾ߸� ������ �˴ϴ�.)
   </td>
  </tr>
  <tr> 
   <td colspan="2" height="1" class='button'></td>
  </tr>
  <tr> 
   <td colspan="2" height="1" bgcolor="#1F4F8F"></td>
  </tr>
  <tr> 
   <td colspan="2" height="10"></td>
  </tr>
  <tr> 
   <td colspan="2" align="right"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr> 
      <td width="64%">&nbsp;</td>
      <td width="12%"><a href="#" onClick="check();"><img src="image/ok.gif" border="0"></a></td>
      <td width="12%"><a href="#" onClick="history.go(-1)"><img src="image/cancle.gif"  border="0"></td>
      <td width="12%"><A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> <img src="image/list.jpg" border=0></a></td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</FORM>

<%
  }
  rs.close();
  st.close();
  conn.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
</BODY>
</HTML>