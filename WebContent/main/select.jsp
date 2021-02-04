<%@ page language="java" contentType="text/html; charset=UTF-8" 
       pageEncoding="UTF-8" import="java.sql.*" %>   <!-- ① -->
    
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
  String s_userID = "";
  String s_userPW = "";

  Connection conn = null;     // ②
  Statement stmt = null;    // ③
  ResultSet rs = null;       // ④
    
  try {    // ⑤
      	String url = "jdbc:mysql://localhost:3306/user?";
	       url += "useUnicode=true&";
	       url += "characterEncoding=UTF8&";
	       url += "useSSL=false&";
	       url += "serverTimezone=UTC";
      	String id = "root";
      	String pw = "Hanmir0341!";

      	Class.forName("com.mysql.cj.jdbc.Driver");    // ⑥
      	conn = DriverManager.getConnection(url, id, pw);    // ⑦
		
      	stmt = conn.createStatement();    //  ⑧
      	rs = stmt.executeQuery("select * from join_list");      //  ⑨
%> 

  	<table>
      		<tr>           <!--  -->
      			<td>userID</td>
      			<td>userPW</td>      			
      		</tr>
      		
<%
	if (rs != null) {      //  ⑪
		
		while(rs.next()) {
			s_userID = rs.getString("userID");
			s_userPW = rs.getString("userPW");
%>

      		<tr>
      			<td><%=s_userID %></td>
      			<td><%=s_userPW %></td>      			
      		</tr>
      		
<%						
		}
		
	}
%>      		      		
      	
      	</table>   <!--  ⑫  -->
				
      	
<%
      	rs.close();       //   ⑬
      	stmt.close();    //   ⑬
      	conn.close();     //   ⑬
		
  } catch (Exception e) {   //  ⑭
		
		
  }
%>

  </body>
</html>
    