<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@ page import = "regDAO.DAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@include file="color.jsp" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8, minimum-scale=0.8, maximum-scale=0.8">

<title>명함등록</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	body
	{
		background-color : black;
		background-size: 100% 100%;
		font-family: 'Hanna', serif;
	}
	input
	{
		border: 0px;
		background-color: #ffffe0;
	}
	input:focus
	{
		outline:none;
	}
</style>
</head>

<body bgcolor="<%=bodyback_c%>">
  <br />
  <br />
  <h1 align="center">Card registration</h1>
  <br />
  <br />
  <br />
  
  <form name="insForm" method="post" action="insertPro.jsp" onsubmit="return inputCheck()">
    <table width="650" height="350" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="50" align="center" bgcolor="<%=title_c%>"> 
         <td colspan="3" style="font-size: 22px;"><b>명함</b></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>이름</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="name" maxlength="10" placeholder="이름을 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>회사명</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="company" maxlength="30" placeholder="회사명을 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>직책</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="position" maxlength="30" placeholder="직책을 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>연락처</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="tell" maxlength="50" placeholder="연락처를 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>메일</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="email" maxlength="100" placeholder="메일을 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
        <td width="100" bgcolor="<%=title_c%>" align="center" style="font-size: 22px;"><b>주소</b></td>
        <td colspan="2" width="200" bgcolor="<%=value_c%>"> 
		  <input type="text" name="address" maxlength="100" placeholder="주소를 입력하세요"
		  	width="200" bgcolor="<%=value_c%>" autocomplete="off" style="font-size: 22px;"></td>
      </tr>
      <tr> 
         <td colspan="3" align="center"  bgcolor="<%=title_c%>"> 
           <input type="submit" value="명함등록" style="font-size: 18px;"> 
              &nbsp; &nbsp; &nbsp; &nbsp;
           <input type="reset" value="입력취소" style="font-size: 18px;"> 
         </td>
       </tr>
      <tr>
      	<td colspan="3" align="center"  bgcolor="<%=title_c%>" style="font-size: 22px;">
      		<a href="selectForm.jsp">목록보기</a>
      	</td>
      </tr>
    </form>
  </table>
</body>
</html>
