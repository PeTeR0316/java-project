<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./style/index.css">
<title>JSP</title>
</head>
<body>
	<%
		for (int i = 1; i <= 5; i++) {
	%>
		<h<%=i%>> header h<% out.println(i); %>태그 </h<%=i%>>
	<%
		}
	%>
	
</body>
</html>