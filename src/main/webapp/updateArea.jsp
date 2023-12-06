<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.areacode.value==""){
		alert("거주지코드를 입력하세요");
		document.frm.areacode.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.areaname.value==""){
		alert("거주지이름을 입력하세요");
		document.frm.areaname.focus(); 
		return false;  
	}
	
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>상품 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String areacode = request.getParameter("areacode"); //productUpdate.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from area0918 where areacode=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, areacode); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String areaname = rs.getString("areaname");

%>
<form name="frm" method="post" action="updateAreaProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>거주지코드</th>
      <td><input type="text" name="areacode" id=in1 value="<%=areacode%>"></td>
</tr>
<tr> 
      <th>거주지이름</th>
      <td><input type="text" name="areaname" id=in1 value="<%=areaname%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt1 type="reset" value="취소">
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