<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>거주지 정보 목록</h1>
        <% 
        ResultSet rs = null;
        PreparedStatement pstmt = null;
 
        int cnt =0;
        
    	 String sql = "select count(*) from area0918";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 if(rs.next()) {
    		 cnt=rs.getInt(1);
    	 }
    	 %>
    	 
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 <%=cnt %>개의 거주지가 있습니다.
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>거주지코드</th>
    <th>거주지이름</th>
    <th>구분</th>
</tr>

<% 
     int no =0;
    
     try{
    	 sql = "select*from area0918";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String areacode = rs.getString("areacode");
    		 String areaname= rs.getString("areaname");

    		 no++;
%>

<tr>
    <td><%=no %> </td>
    <td><%=areacode %> </td>
    <td><%=areaname %> </td>

    <td>
     <a href="updateArea.jsp?areacode=<%=areacode %>"> 수정</a>/
    
     <a href="deleteArea.jsp?areacode=<%=areacode %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>

<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 4  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addArea.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>