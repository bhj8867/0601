<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>application 객체사용 예제</title>
</head>
<body>
<h2>application 객체 사용</h2>
<%
String value="apple";
application.setAttribute("fruit", value);/*value에 apple들어가 있음  */
String fruit=(String)application.getAttribute("fruit");/*value 값 apple이 찍힌다  */
%>
application객체 저장된 값 : <%= fruit %>

</body>
</html>