<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset= UTF-8">
<title>JSP 게시판 웹 사이트 </title>
</head>
<body>
<%
session.invalidate();
%>
location.href = "main.jsp"
</body>
</html>
