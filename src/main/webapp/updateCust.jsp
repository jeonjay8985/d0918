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
		alert("고객아이디를 입력하세요");
		document.frm.custid.focus();
		return false;  
	}
	if(document.frm.author.value==""){
		alert("고객성명을 입력하세요");
		document.frm.author.focus(); 
		return false;  
	}else{
	 document.frm.submit();
	}
}
</script>

</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>고객 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt = null;
    String custid = request.getParameter("custid"); 
   
   try{
	   String sql="select * from customer0918 where custid=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, custid); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String author = rs.getString("author");
		   String goods = rs.getString("goods");
		   String arr[] = goods.split(",");
		   String phone = rs.getString("phone"); //010-1111-2222
	       String ph[] = phone.split("-");
	       String phone1 = ph[0];
	       String phone2 = ph[1];
	       String phone3 = ph[2];
	       String email = rs.getString("email");
	       String em[] = email.split("@");
	       String email1 = em[0]; 
	       String email2 = em[1]; 
	       String areacode = rs.getString("areacode");
		   
%>

<form name="frm" method="post" action="updateCustProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>고객아이디</th>
      <td><input type="text" name="custid" id=in1 value="<%=custid%>"></td>
</tr>
<tr> 
      <th>고객성명</th>
      <td><input type="text" name="author" id=in1 value="<%=author%>"></td>
</tr>

<tr> 
       <th>관심상품</th>
 
       <td><input type="checkbox" name="goods" value="의류"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("의류")) out.print("checked");} %>>의류 
       <input type="checkbox" name="goods" value="식료품"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("식료품")) out.print("checked");} %>>식료품 
       <input type="checkbox" name="goods" value="컴퓨터"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("컴퓨터")) out.print("checked");} %>>컴퓨터
       <input type="checkbox" name="goods" value="공산품"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("공산품")) out.print("checked");} %>>공산품
       <input type="checkbox" name="goods" value="관광"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("관광")) out.print("checked");} %>>관광
       <input type="checkbox" name="goods" value="전자제품"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("전자제품")) out.print("checked");} %>>전자제품
       <input type="checkbox" name="goods" value="건강제품"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("건강제품")) out.print("checked");} %>>건강제품
       <input type="checkbox" name="goods" value="운동기구"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("운동기구")) out.print("checked");} %>>운동기구</td>
</tr>

<tr> 
       <th>전화</th>
      <td>
      <input type="text" name="phone1" id=in value="<%=phone1 %>">
      -
        <input type="text" name="phone2" id=in value="<%=phone2 %>">
        -
          <input type="text" name="phone3" id=in value="<%=phone3 %>">
      </td>
</tr>

<tr> 
     <th>이메일</th>
    <td>
      <input type="text" name="email1" id=in value="<%=email1 %>">
      @
      <input type="text" name="email2" id=in value="<%=email2 %>">
    </td>
</tr>
 
<tr> 
      <th>거주지</th>
    <td>
      <select name = "areacode" id=in3>
      <option value ="101" <% if(areacode.equals("101")){ %>selected <%}%>> 서울</option>
      <option value ="102" <% if(areacode.equals("102")){ %>selected <%}%>> 경기</option>
      <option value ="103" <% if(areacode.equals("103")){ %>selected <%}%>> 대전</option>
      <option value ="104" <% if(areacode.equals("104")){ %>selected <%}%>> 부산</option>
      <option value ="105" <% if(areacode.equals("105")){ %>selected <%}%>> 광주</option>
      <option value ="106" <% if(areacode.equals("106")){ %>selected <%}%>> 울산</option>
      <option value ="107" <% if(areacode.equals("107")){ %>selected <%}%>> 대구</option>
      <option value ="108" <% if(areacode.equals("108")){ %>selected <%}%>> 강원</option>
      <option value ="109" <% if(areacode.equals("109")){ %>selected <%}%>> 경상</option>
      <option value ="110" <% if(areacode.equals("110")){ %>selected <%}%>> 충청</option>
      <option value ="111" <% if(areacode.equals("111")){ %>selected <%}%>> 제주</option>
      </select>
    </td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt1 type="reset" value="취소" onclick="location.href='index.jsp'">
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