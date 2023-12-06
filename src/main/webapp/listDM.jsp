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

<h1>dm 발송 내역</h1>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
int cnt=0;

	 String sql = "select count(*) from dm0918";
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		 cnt=rs.getInt(1);
	 }
%>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 <%=cnt %>건의 발송내역이 있습니다.
<table border=1 id="tab1">
<tr>
	<th>no</th>
    <th>DM발송번호</th>
    <th>고객아이디</th>
    <th>고객성명</th>
    <th>발송일자</th>
    <th>DM내용</th>  
    <th>발송부서</th>
    <th>고객등급</th>
    <th>캠페인구분</th>
    <th>구분</th>
</tr>

<%
    /*  ResultSet rs = null; //ResultSet타입으로 결과값 반환해줌. 결과값 저장->한 행 단위로 불러올 수 있음
     PreparedStatement pstmt = null; */
     int no=0;
     try{
    	 sql = "select c.dmno, a.custid, a.author, to_char(c.maildate, 'yyyy-mm-dd'), c.contents, c.dept, c.grade, c.campain from customer0918 a, dm0918 c where a.custid=c.custid";
    	 pstmt = conn.prepareStatement(sql);
    	 
    	 rs = pstmt.executeQuery(); //executeQuery(String sql) 통해 쿼리 실행하면▲
    	 while(rs.next()) {
    		 String dmno = rs.getString("dmno");
    		 String custid= rs.getString("custid");
    		 String author = rs.getString("author");
    		 String maildate = rs.getString(4);
    		 String contents = rs.getString("contents");
    		 String dept = rs.getString("dept");
    		 String grade = rs.getString("grade");
    		 String campain = rs.getString("campain");
    		 
    		 no++;
%>

<tr>
    <td><%=no %> </td>
    <td><a href = "updateDM.jsp?dmno=<%=dmno %>"><%=dmno %></a> </td>
    <td><%=custid %> </td>
    <td><%=author %> </td>
    <td><%=maildate %> </td>
    <td><%=contents %> </td>
    <td><%=dept %> </td>
    <td><%=grade %> </td>
    <td><%=campain %> </td>
    
    <td>
    <a href="deleteDM.jsp?dmno=<%=dmno %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
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
	 location.href="addDM.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>