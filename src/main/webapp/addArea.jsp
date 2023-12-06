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
		alert("거주지 코드를 입력하세요");
		document.frm.areacode.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.areaname.value==""){
		alert("거주지 이름을 입력하세요");
		document.frm.areaname.focus(); 
		return false; }
	

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>거주지 정보 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="addAreaProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>거주지코드</th>
      <td><input type="text" name="areacode" id=in3></td>
</tr>

<tr> 
      <th>거주지이름</th>
      <td><input type="text" name="areaname" id=in3></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt1 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>