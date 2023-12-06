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
   PreparedStatement pstmt = null;
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String dmno = request.getParameter("dmno");  
   String custid = request.getParameter("custid");
   String maildate = request.getParameter("maildate");  
   String contents = request.getParameter("contents");
   String dept = request.getParameter("dept");  
   String grade = request.getParameter("grade");
   String campain = request.getParameter("campain");
  
   
  
   try{
      String sql = "Update dm0918 set custid=?, maildate=?, contents=?, dept=?, grade=?, campain=? where dmno=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, dmno);  
      pstmt.setString(1, custid);    
      pstmt.setString(2, maildate);         
      pstmt.setString(3, contents);
      pstmt.setString(4, dept);
      pstmt.setString(5, grade);
      pstmt.setString(6, campain); 
 

      pstmt.executeUpdate();
      
      %>
      <script>
       alert("수정 성공");
       location.href="listDM.jsp";
       //history.back(-1);
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