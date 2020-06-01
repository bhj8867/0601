<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbConnection.jsp" %>

<% 
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
String name=request.getParameter("name");

Statement stmt=null;

try{/* 필드가 많이없어서 간단할때 입력할때마다 닫아줘야한다. */
	String sql="insert into membertable(id,passwd,name) values('"+id+"','"+passwd+"','"+name+"')";
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	out.println("입력성공");
}catch(SQLException e){
	out.println("입력실패");
	e.printStackTrace();
}finally{
	if(stmt!=null){
		stmt.close();
		
	}if(conn!=null){
		conn.close();
	}
}
%>

</body>
</html>