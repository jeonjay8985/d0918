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

<h1>고객 정보 목록</h1>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
int cnt=0;

	 String sql = "select count(*) from customer0918";
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		 cnt=rs.getInt(1);
	 }
%>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 <%=cnt %>명의 고객이 있습니다.
<table border=1 id="tab1">
<tr>
	<th>no</th>
    <th>고객아이디</th>
    <th>고객성명</th>
    <th>관심상품</th>
    <th>전화</th>  
    <th>이메일</th>
    <th>거주지코드</th>
    <th>거주지</th>
    <th>구분</th>
</tr>

<%
    /*  ResultSet rs = null; //ResultSet타입으로 결과값 반환해줌. 결과값 저장->한 행 단위로 불러올 수 있음
     PreparedStatement pstmt = null; */
     int no=0;
     try{
    	 sql = "select a.custid, a.author, a.goods, a.phone, a.email, b.areacode, b.areaname from customer0918 a, area0918 b where a.areacode=b.areacode";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery(); //executeQuery(String sql) 통해 쿼리 실행하면▲
    	 while(rs.next()) {
    	 	 String custid= rs.getString("custid");
    		 String author = rs.getString("author");
    		 String goods = rs.getString("goods");
    		 String phone = rs.getString("phone");
    		 String email = rs.getString("email");
    		 String areacode = rs.getString("areacode");
    		 String areaname = rs.getString("areaname");
    		 
    		 no++;
%>

<tr>
    <td><%=no %> </td>
    <td><a href = "updateCust.jsp?custid=<%=custid %>"><%=custid %></a> </td>
    <td><%=author %> </td>
    <td><%=goods %> </td>
    <td><%=phone %> </td>
    <td><%=email %> </td>
    <td><%=areacode %> </td>
    <td><%=areaname %> </td>
    
    <td>
    <a href="deleteCust.jsp?custid=<%=custid %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>

</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>


<tr>
    <td colspan = 10  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addCust.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>