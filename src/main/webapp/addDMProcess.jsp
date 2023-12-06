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
    //ResultSet rs = null;
    String dmno = request.getParameter("dmno");
    String custid = request.getParameter("custid");
    String maildate = request.getParameter("maildate");
    String contents = request.getParameter("contents");
    String dept = request.getParameter("dept");
    String grade = request.getParameter("grade");
    String campain = request.getParameter("campain");
    
    try {
    	String sql = "insert into dm0918 values(?,?,?,?,?,?,?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, dmno);
    	pstmt.setString(2, custid);
    	pstmt.setString(3, maildate);
    	pstmt.setString(4, contents);
    	pstmt.setString(5, dept);
    	pstmt.setString(6, grade);
    	pstmt.setString(7, campain);
    	
    	pstmt.executeUpdate();
    	
    	//재고 마이너스, 상품코드를 읽어서 재고를 가져와 빼기해줌
    	
    	//int stock=0;
    	//sql="select unitsInstock from product0822 where productId=?";
    	
    	 %>
      <script>
      alert("저장 완료되었습니다");
      location.href="listDM.jsp";
      </script>
      <%

    }catch(Exception e) {
    	System.out.println("등록 오류:" +e.getMessage());
    }
%>

</body>
</html>l>