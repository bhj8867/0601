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
<table width="300" border="1">
<tr>
<th>아이디</th>
<th>비밀번호</th>
<th>이름</th>
</tr></table>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;

try{
	String sql="select*from membertable";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();/* 조회 */
	
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString("passwd") %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		
		<%
	}
	
}catch(SQLException e){
	out.print("조회실패");
	e.printStackTrace();
}finally{
	if(rs!=null){
		rs.close();}
	if(pstmt!=null){
		pstmt.close();
	}
	if(conn!=null){
		conn.close();
		}}
		%>
}
</body>
</html>