<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session-set</title>
</head>
<body>
<h2>session 정보 설정</h2>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
%>
id <%=id %><br>
password <%=password%><br>

<%
session.setAttribute("id", id);/* 세션으로 id와 pwd로 값넘김 set */
session.setAttribute("pwd", password);
%>
<a href="session-get.jsp">session-get페이지 이동</a>


</body>
</html>