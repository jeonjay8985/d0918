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
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String areacode = request.getParameter("areacode");   //사원번호(id) 데이터
   String areaname = request.getParameter("areaname");
  
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update area0918 set areaname=? where areacode=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(2, areacode);    
      pstmt.setString(1, areaname);  
      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="listArea.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>