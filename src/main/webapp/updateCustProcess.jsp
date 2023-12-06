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
   String custid = request.getParameter("custid");  
   String author = request.getParameter("author");
   String[] val = request.getParameterValues("goods");
   String goods="";
   if(val != null) {
	   for(int i=0; i<val.length; i++) {
		   if(i == (val.length-1)) {
			   goods += val[i];
		   }else{
			   goods += val[i] + ",";
		   }
	   }
   }
   String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
   String email = request.getParameter("email1")+"@"+request.getParameter("email2");
   String areacode = request.getParameter("areacode");
  
   
  
   try{
      String sql = "Update customer0918 set author=?, goods=?, phone=?, email=?, areacode=? where custid=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(6, custid);  
      pstmt.setString(1, author);    
      pstmt.setString(2, goods);         
      pstmt.setString(3, phone);
      pstmt.setString(4, email);
      pstmt.setString(5, areacode);
 

      pstmt.executeUpdate();
      
      %>
      <script>
       alert("수정 성공");
       location.href="listCust.jsp";
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