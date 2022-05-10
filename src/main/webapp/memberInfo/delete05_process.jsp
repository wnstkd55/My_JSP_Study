<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "dbconn_oracle.jsp" %>

<%

	//form에서 Request 객체의 getParameter로 폼에서 넘긴 변수의 값을 받는다.
	request.setCharacterEncoding("UTF-8");		//한글 깨지지 않도록처리, EUC-KR, UTF-8
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;		//select한 결과를 담는 객체, select한 레코드셋을 담고있다.
	String sql = null;
	
	try{
		// 레코드 삭제, 폼에서 넘긴 ID와 Passwd와 DB의 ID와 Passwd가 일치할때 레코드 제거, id(primary key)
		sql = "select id, pass from mbtb1 where id = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){	//ID가 존재할때
			//rs의 결과 레코드를 변수에 할당.
			String rId = rs.getString("id");
			String rPass = rs.getString("pass");
			
			//passwd가 일치하는지
			if(passwd.equals(rPass)){	//폼의 passwd와 DB의 pass가 일치할때
				sql = "delete mbtb1 where id = ? ";
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				out.println("테이블에서 해당 id: "+id+"가 잘 삭제되었습니다.");
			
				//out.println(sql);
				
			}else{		//폼의 passwd와 DB의 pass가 일치하지 않을때
				out.println("패스워드가 일치 하지 않습니다.");
			}
			
		}else{		//ID가 존재하지 않을때
			out.println("해당 아이디는 존재하지 않습니다.");
		}
		
		
		//out.println(sql);
		
	}catch(Exception ex){
		out.println(ex.getMessage());
	}finally{
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		
	}
	
	

%>

</body>
</html>