<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%@page import="java.sql.*" %><!-- db를 사용 하기 위해 import -->

<%
	Connection conn=null;
	String jdbc_driver="com.mysql.cj.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","1234");

%>
