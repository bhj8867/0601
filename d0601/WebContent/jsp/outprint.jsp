<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<pre><!-- 입력한 그대로 출력 -->
<%
for(int i=0;i<3;i++){
	out.print("바나나");
}
%>
<%
for(int i=0;i<3;i++){
	out.println("포도");
}
%>
<%
for(int i=0;i<3;i++){
	out.print("파인애플");
	out.newLine();/* br테그와 같은 기능 */
}
%>
<%
	out.print("<html>");
	out.print("<head><title>실습</title></head>");
	out.print("<body><h1>out.print 실습</h1>");
	out.print("</body></html>");
%>

</pre>