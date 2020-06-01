<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터베이스 수정하기</title>
</head>
<body>
	<%@include file="dbConnection.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		ResultSet rs = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "select id,passwd from membertable where id=?";
			pstmt = conn.prepareStatement(sql);/* create->prepare sql 추가 */
			
			pstmt.setString(1, id);/* ?에 대한 값을 set으로 넘겨주게 된다 */
			rs = pstmt.executeQuery();/* sql빠진다 */
			
			if (rs.next()) {/* 일치하는 데이터가 있으면 true */
				String rId = rs.getString("id");
				String rPass = rs.getString("passwd");
				
				/* 아이디와 패스워드가 일치id=rId할때만 수정할수있게 한다 */		
				if (id.equals(rId) && passwd.equals(rPass)) {
					sql = "update membertable set name=? where id=?";
					pstmt = conn.prepareStatement(sql);/*create->perpare,()->(sql)  */
					pstmt.setString(1, name);/* 첫번째 ?가 name이다 */
					pstmt.setString(2,id);
					pstmt.executeUpdate();
					out.println("데이터 수정 완료");
				} else {
					out.println("비밀번호가 일치하지 않습니다.");
				}
			} else {
				out.println("일치하는 아이디가 없습니다.");
			}
		} catch (SQLException e) {
			out.println("수정 오류");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		;
	%>
</body>
</html>
