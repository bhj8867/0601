<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login result</title>
</head>
<body>
<% 
String name=request.getParameter("name");
String password=request.getParameter("password");


if(name.equals("admin")&& password.equals("1234")){/* 이것만 로그인이 가능하도록 가정 */
	response.sendRedirect("response-success.html");
}else{
	response.sendRedirect("http://www.daum.net");
	
	
}

%>





</body>
</html>