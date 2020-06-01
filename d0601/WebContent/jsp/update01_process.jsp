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
		Statement stmt = null;
		/* 수정 전에 데이터를 키값으로 조회한다 */
		try {
			String sql = "select id,passwd from membertable where id='"
					+ id + "'";
			stmt = conn.createStatement();/* stmt다시 사용 */
			rs = stmt.executeQuery(sql);

			/* while은 전부 다 읽어 들이는 것이고 if는 조건에 맞는 레코드 하나만 들고온다 */
			
			if (rs.next()) {/* 일치하는 데이터가 있으면 true */
				String rId = rs.getString("id");
				String rPass = rs.getString("passwd");
				
				if(stmt!=null){/* stmt는 한번 쓰면 바로 닫아줘야 오류안뜬다 */
					stmt.close();
				}
				/* 아이디와 패스워드가 일치id=rId할때만 수정할수있게 한다 */		
				if (id.equals(rId) && passwd.equals(rPass)) {
					sql = "update membertable set name='" + name + "' where id= '" + id + "'";
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					out.println("데이터 수정 완료");
				} else {
					out.println("비밀번호가 일치하지 않습니다.");
				}
			} else {/* 일치하는 데이터가 없다 */
				out.println("일치하는 아이디가 없습니다.");
			}
		} catch (SQLException e) {
			out.println("수정 오류");
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		;
	%>



</body>
</html>