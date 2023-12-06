<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   String areacode = request.getParameter("areacode");
   PreparedStatement pstmt = null;
   try {
	   String sql = "delete from area0918 where areacode=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, areacode); 
	   pstmt.executeUpdate();
	   %>
	   <script>
	       alert("삭제 완료");
	       location.href = "listArea.jsp";
	   </script>
	   <%
   }catch(Exception e) {
	   System.out.println("삭제 실패:" +e.getMessage());
   }
%>

</body>
</html>