<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="user.UserDAO" %>
	<%@ page import="java.io.PrintWriter" %>
    <%   	request.setCharacterEncoding("UTF-8");		
   %>	
   <jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset= UTF-8">
<title>JSP 게시판 웹 사이트 </title>
</head>
<body>
<%
if(userID != null) { // 이미 로그인 한 사람은 또 할 수 없게 
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어 있습니다.')>");
	script.println("<location.href = 'main.jsp'>");
	script.println("</script>");
}
//if 부분 고쳐야함 어디가 문제인지 몰라
if(user.getUserID() == null /* || user.getUserPassword() == null || user.getUserName() == null || 
user.getUserGender() == null || user.getUserEmail() == null */) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다..')>");
	script.println("history.back()");
	script.println("</script>");
}else {
	UserDAO userDAO = new UserDAO();
	int result =userDAO.join(user);
	if( result == 1 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재합니다.')>");
		script.println("history.back()");
		script.println("</script>");
		
	}else{
		session.setAttribute("userID", user.getUserID());

		PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'main.jsp'>");
	script.println("</script>");
	}
	
	}


%>
</body>
</html>
