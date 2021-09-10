<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@include file="color.jsp" %>

<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=0.6,minimum-scale=0.6,maximum-scale=0.6" />
<title>명함등록 확인</title>
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
</style>
</head>

<br />
<br />

<h1 align="center"><font color="">명함내용</font></h1>
<br />
<br />
<body>
	
    <table width="600" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="80" align="center" bgcolor="<%=title_c%>"> 
        <td colspan="2"><font size="22px"><b>${ dto.getName() }</b></font></td>
      </tr>
      <tr> 
         <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">직책</font></td>
         <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		   ${ dto.getPosition() }</td>  
      </tr>
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">회사명</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=${ dto.getCompany()}">${ dto.getCompany()}</a></td>  
      </tr>
      <tr> 
         <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">연락처</font></td>
         <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		  <a href="tel:${ dto.getTell()}"> ${ dto.getTell() }</a></td>  
      </tr>
	   <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">SMS</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		  <a href="sms:${ dto.getTell()}"> ${ dto.getTell() }</a></td>  
      </tr> 
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">이메일</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		   <a href="mailto:${ dto.getEmail()} "> ${ dto.getEmail() }</a></td>  
      </tr>
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">주소</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href="http://maps.google.com/maps?q=${ dto.getAddress()} "> ${ dto.getAddress() }</a></td>  
      </tr>
	  <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em"></font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href=index.do>처음으로</a>
		   &nbsp; &nbsp;
		  <a href=selectForm.do>이전으로</a>
		</td>  
      </tr>      
  </table>
</body>
</html>
