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
   
  
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into customer0918 values(?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, custid);  
      pstmt.setString(2, author);    
      pstmt.setString(3, goods);         
      pstmt.setString(4, phone);
      pstmt.setString(5, email);
      pstmt.setString(6, areacode);
  
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장 완료되었습니다");
      location.href="listCust.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>