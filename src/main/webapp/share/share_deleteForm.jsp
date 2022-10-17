<%@page import="share.RoomDAO"%>
<%@page import="share.RoomDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<title>게시판</title>
<link href="test/css/main.css?after" rel="stylesheet" type="text/css" />

<script language="JavaScript">      
  function deleteSave(){	
	if(document.delForm.password.value==''){
	alert("비밀번호를 입력하십시요.");
	document.delForm.password.focus();
	return false;
 }
}       
</script>
</head>

<body bgcolor="#e0ffff">
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  
   action="/Project/share_deletePro.do?&room_no=${room_no}" 
   onsubmit="return deleteSave()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="#b0e0e6">
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="password" size="8" maxlength="12">
	   <%-- 
	      <input type="hidden" name="num" value="${num}"> 
	      <input type="hidden" name="pageNum" value="${pageNum}">
	   --%>
	   </td>
 </tr>
 <tr height="30">
    <td align=center bgcolor="#b0e0e6">
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" 
       onclick="document.location.href='/Project/share_list.do'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
