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
   String custid = request.getParameter("custid");
   PreparedStatement pstmt = null;
   try {
	   String sql = "delete from customer0918 where custid=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, custid); 
	   pstmt.executeUpdate();
	   %>
	   <script>
	       alert("삭제 완료");
	       location.href = "listCust.jsp";
	   </script>
	   <%
   }catch(Exception e) {
	   System.out.println("삭제 실패:" +e.getMessage());
   }
%>

</body>
</html>