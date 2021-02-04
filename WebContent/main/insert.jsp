<%@ page language="java" contentType="text/html; charset=UTF-8" 
       pageEncoding="UTF-8" import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title></title>		
 </head>
 <body>		
	<%
		request.setCharacterEncoding("utf-8");   // 인코딩지정 필수
		String s_userid = request.getParameter("userid");
		String s_username = request.getParameter("username");
		String s_userpw = request.getParameter("userpw");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String str = "";
		
		try {
			String url = "jdbc:mysql://localhost:3306/user?";
	    	url += "useUnicode=true&";
	       	url += "characterEncoding=UTF8&";
	       	url += "useSSL=false&";
	       	url += "serverTimezone=UTC";
	     	String id = "root";
	     	String pw = "Hanmir0341!";
	
	     	Class.forName("com.mysql.cj.jdbc.Driver");
	     	conn = DriverManager.getConnection(url, id, pw);
		
	     	pstmt = conn.prepareStatement("insert into join_list (userID, userPW) values (?, ?)");
	
		
	     	pstmt.setString(1, s_userid);     
	     	pstmt.setString(2, s_userpw);        
		
	     	pstmt.executeUpdate();	 
	     	str = "데이터 입력 성공";
				
	     	pstmt.close();
	     	conn.close();
			
		} catch (Exception e) {
			
			str = "데이터 입력 실패";
			
		}
	%>
	<p><%=str%></p>
     
    <script>
    	var result = "<%=str%>";
		alert(result);
		
		if(result === "데이터 입력 성공") {
			location.href = "./index.jsp"
		} else {
			location.href = "./join.jsp"
		}
	</script>
</body>
</html>