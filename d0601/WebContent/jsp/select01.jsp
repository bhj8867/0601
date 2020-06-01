<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%@ include file="dbConnection.jsp" %>
<table width="300" border="1">
<tr>
	<th>id</th>
	<th>passwd</th>
	<th>name</th>
</tr> 
<%
ResultSet rs=null;
Statement stmt=null;

try{
	String sql="select*from membertable";
	
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	
	while(rs.next()){/*  */
		/* String id=rs.getString("id");
		String passwd=rs.getString(2);
		String name=rs.getString("name"); */
		
		%><!-- 변수 잡지않고 값으로 바로 불러들이는 방법 -->
		<tr>
		<td><%=rs.getString("id")%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString("name") %></td>
		</tr>
		<%	/* jsp시작 */	
	}
}catch(SQLException e){
	out.println("조회실패"+e.getMessage());
}finally{
	if(rs!=null){
		rs.close();
	}
	if(stmt!=null){
		stmt.close();
	}
	if(conn!=null){
		conn.close();
	}	
}
%>

</table>


<%


%>



</body>
</html>