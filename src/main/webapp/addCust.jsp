<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.custid.value==""){
		alert("아이디를 입력하세요");
		document.frm.custid.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.author.value==""){
		alert("성명을 입력하세요");
		document.frm.author.focus(); 
		return false; }
	

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>고객 정보 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="addCustProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>고객아이디</th>
      <td><input type="text" name="custid" id=in3></td>
</tr>

<tr> 
      <th>고객성명</th>
      <td><input type="text" name="author" id=in3></td>
</tr>

<tr> 
      <th>관심상품</th>
      <td><input type="checkbox" name="goods" value="의류"> 의류
      <input type="checkbox" name="goods" value="식료품"> 식료품
      <input type="checkbox" name="goods" value="컴퓨터"> 컴퓨터
      <input type="checkbox" name="goods" value="공산품"> 공산품
      <input type="checkbox" name="goods" value="관광"> 관광
      <input type="checkbox" name="goods" value="전자제품"> 전자제품
      <input type="checkbox" name="goods" value="건강제품"> 건강제품
      <input type="checkbox" name="goods" value="운동기구"> 운동기구</td>
</tr>

<tr> 
      <th>전화</th>
      <td><input type="text" name="phone1" id=in3>
       -
        <input type="text" name="phone2" id=in3>
        -
          <input type="text" name="phone3" id=in3>      
      </td>
</tr>

<tr> 
      <th>이메일</th>
      <td><input type="text" name="email1" id=in3>
      @
      <input type="text" name="email2" id=in3>
      </td>
</tr>

<tr> 
      <th>거주지</th>
    <td>
      <select name = "areacode" id=in3>
      <option value ="101" selected> 서울</option>
      <option value ="102"> 경기</option>
      <option value ="103"> 대전</option>
      <option value ="104"> 부산</option>
      <option value ="105"> 광주</option>
      <option value ="106"> 울산</option>
      <option value ="107"> 대구</option>
      <option value ="108"> 강원</option>
      <option value ="109"> 경상</option>
      <option value ="110"> 충청</option>
      <option value ="111"> 제주</option>
      </select>
    </td>
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