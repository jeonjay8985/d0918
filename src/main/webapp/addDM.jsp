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
		document.frm.custid.focus(); 
		return false;           
	}
	if(document.frm.maildate.value==""){
		alert("발송일자를 입력하세요");
		document.frm.maildate.focus();
		return false;  
	}
	if(document.frm.contents.value==""){
		alert("dm내용을 입력하세요");
		document.frm.contents.focus(); 
		return false;  
	}
	if(document.frm.dept.value==""){
		alert("발송부서를 입력하세요");
		document.frm.dept.focus(); 
		return false;  
	}
	if(document.frm.campain.value==""){
		alert("캠페인 구분을 입력하세요");
		document.frm.campain.focus(); 
		return false;  
	}

	frm.action="addDMProcess.jsp";

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}

 function changesubmit()/*이벤트이름*/ {
    //alert("경고");
	document.frm.submit();//form이름 frm 
 }
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>dm 정보 등록</h1>
<%@ include file = "dbconn.jsp" %>


<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
    
    String custid=request.getParameter("custid");
    String maildate=request.getParameter("maildate");
    String contents=request.getParameter("contents");
    String dept=request.getParameter("dept");
    String grade=request.getParameter("grade");
    String campain=request.getParameter("campain");
    
    String author="";
    if(custid == null) {
    	custid="";
    }
    if(maildate == null) {
    	maildate="";
    }
    if(contents == null) {
    	contents="";
    }
    if(dept == null) {
    	dept="";
    }
    if(grade == null) {
    	grade="";
    }
    if(campain == null) {
    	campain="";
    }else{
		  try{
    	  String sql = "select author from customer0918 where custid=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, custid);
    	  rs=pstmt.executeQuery();
    	  if(rs.next()){
    		  author = rs.getString(1);
    		 }else{
    		  %>
    		  <script>
    		  alert("등록되지 않은 아이디입니다");
    		  </script>
    		  <%
    		 }
		  }
    	  catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
   	}
   
 %>


<form name="frm" method="post" action="addDM.jsp" method="post">
<table border=1 id="tab2">

<% 
   pstmt=null;
   rs=null;
   String sql = "select max(dmno) from dm0918";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int dmno = 0;
   if(rs.next()) {
	   dmno = rs.getInt(1)+1;
   }
%>


<tr> 
      <th>dm 발송번호</th>
      <td><input type="text" name="dmno" value="<%=dmno %>" id=in1> 마지막번호+1</td>
</tr>

<tr> 
      <th>고객아이디</th>
      <td width=30%><input type="text" name="custid"  value="<%=custid %>" id=in1 onchange="changesubmit();"></td>
      <th>고객명</th>
      <td><input type="text" name="author"  value="<%=author %>" id=in1></td>
</tr>

<tr> 
      <th>발송일자</th>
      <td><input type="text" name="maildate" value="<%=maildate %>" id=in1></td>
      <th>dm내용</th>
      <td><input type="text" name="contents" value="<%=contents %>" id=in1></td>
</tr>

<tr> 
      <th>발송부서</th>
      <td width=30%><input type="text" name="dept" value="<%=dept %>"  id=in1></td>
      <th>고객등급</th>
      <td><select name = "grade" id=in1>
      <option value ="1" <% if(grade.equals("1")){ %>selected <%}%>> 1</option>
      <option value ="2" <% if(grade.equals("2")){ %>selected <%}%>> 2</option>
      <option value ="3" <% if(grade.equals("3")){ %>selected <%}%>> 3</option>
      <option value ="4" <% if(grade.equals("4")){ %>selected <%}%>> 4</option>
      <option value ="5" <% if(grade.equals("5")){ %>selected <%}%>> 5</option>
      <option value ="v" <% if(grade.equals("v")){ %>selected <%}%>> v</option>
      <option value ="w" <% if(grade.equals("w")){ %>selected <%}%>> w</option>
      </select>
      </td>
</tr>

<tr> 
      <th>캠페인 구분</th>
      <td width=30%><input type="text" name="campain" value="<%=campain %>"  id=in1></td>
</tr>



<tr>
    <td colspan = 4 align = center>
    <input id=bt1 type="button" value="목록" onclick="check()"> 
    <input id=bt1 type="submit" value="저장" onclick="check()">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>


</body>
</html>