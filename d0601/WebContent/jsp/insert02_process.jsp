<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3.2 PreapareStatement객체</title>
</head>
<body>
<%@ include file="dbConnection.jsp" %>
<%
request.setCharacterEncoding("utf-8");/* 한글이 깨지는 것을 막는다 */

String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
String name=request.getParameter("name");

PreparedStatement pstmt=null;
try{
	String sql="insert into membertable(id,passwd,name) values(?,?,?)";
	
	pstmt=conn.prepareStatement(sql);/* 차이점 : stmt=conn.createStatement(); */
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	pstmt.setString(3, name);
	pstmt.executeUpdate(); /* 차이점 : stmt.executeUpdate(sql); */
	out.println("입력성공");
}catch(SQLException e){
	out.println("입력실패"+e.getMessage());
}finally{
	if(pstmt!=null){/* if를 사용하여 pstmt를 사용했는지 확인해야한다.사용하지도 않았는데 close()하면 에러뜬다 */
		pstmt.close();
	}if(conn!=null){
		conn.close();
	}
}
%>


</body>
</html>