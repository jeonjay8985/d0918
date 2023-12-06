<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	/* if(document.frm.productName.value==""){
		alert("상품명을 입력하세요");
		document.frm.productName.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.storeCode.value==""){
		alert("매장코드를 입력하세요");
		document.frm.storeCode.focus(); 
		return false; }	  	
	 	
	if(document.frm.unitPrice.value==""){
		alert("단가를 입력하세요");
		document.frm.unitPrice.focus(); 
		return false;  
	}
	
	if(document.frm.stockQty.value==""){
		alert("재고수량을 입력하세요");
		document.frm.stockQty.focus(); 
		return false;  
	}
	 */
	document.frm.submit(); 
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>dm 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
   String dmno = request.getParameter("dmno"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select custid, to_char(maildate, 'yyyy-mm-dd'), contents, dept, grade, campain from dm0918 where dmno=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, dmno); //String의 id랑 이름이 같아야 함, 1개라서 1임
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String custid = rs.getString("custid"); 
		   String maildate = rs.getString(2); //2번째로 가져올거라서 2
		   String contents = rs.getString("contents");
		   String dept = rs.getString("dept");
		   String grade = rs.getString("grade");
		   String campain = rs.getString("campain");

%>
<form name="frm" method="post" action="updateDMProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>DM발송번호</th>
      <td><input type="text" name="dmno" id=in1 value="<%=dmno%>"></td>
</tr>
<tr> 
      <th>고객ID</th>
      <td><input type="text" name="custid" id=in1 value="<%=custid%>"></td>
</tr>
<tr> 
      <th>발송일자</th>
      <td><input type="text" name="maildate" id=in1 value="<%=maildate%>"></td>
</tr>

<tr> 
      <th>DM내용</th>
      <td><input type="text" name="contents" id=in1 value="<%=contents%>"></td>
</tr>

<tr> 
      <th>발송부서</th>
      <td><input type="text" name="dept" id=in1 value="<%=dept%>"></td>
</tr>

<tr> 
      <th>고객등급</th>
      <td><input type="text" name="grade" id=in1 value="<%=grade%>"></td>
</tr>

<tr> 
      <th>캠페인구분</th>
      <td><input type="text" name="campain" id=in1 value="<%=campain%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt1 type="reset" value="취소" onclick="newPage()">
      <script>
     function newPage()  {
	 location.href="listDM.jsp";
	}
     </script>
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>