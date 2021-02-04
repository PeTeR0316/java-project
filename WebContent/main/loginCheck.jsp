<%@ page language="java" contentType="text/html; charset=UTF-8" 
       pageEncoding="UTF-8" import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title></title>		
    <style type="text/css">
    	table, table tr td {
    		border : 1px solid black;
    		width : 100px;
    		text-align: center;
    	}
    	table {
    		border-collapse: collapse;
    		width : 300px;
    	}
    </style>
  </head>
  <body>

<%	
  	request.setCharacterEncoding("utf-8");   // 인코딩지정 필수
  	String s_userid = request.getParameter("userid");
	String s_userpw = request.getParameter("userpw");
	
  	String s_userID = "";
  	String s_userPW = "";

  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
    
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
		
      	stmt = conn.createStatement();
      	rs = stmt.executeQuery("select * from join_list where userID = '" + s_userid +"' && userPW = '" + s_userpw +"'");

	if (rs != null) {
		
		while(rs.next()) {
			s_userID = rs.getString("userID");
			s_userPW = rs.getString("userPW");
%>
    		<p>userID : <%=s_userID %></p>
    		<p>userPW : <%=s_userPW %></p>
    		<p>로그인 성공!</p>   			
      		
<%						
		}
		
	} 
%>      		      		
      	  	
<%
      	rs.close();
      	stmt.close();
      	conn.close();
		
  } catch (Exception e) {
%>

		
<%		
  }
%>

</body>
</html>
    