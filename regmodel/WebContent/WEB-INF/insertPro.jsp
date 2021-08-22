<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@ page import = "com.exam.dao.DAO" %>
<%@include file="color.jsp" %>

<% 
  request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="regBean" class="com.exam.dto.DTO" />
<jsp:setProperty name="regBean" property="*" />

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

<h1 align="center"><font color="">카드가 등록 되었습니다.</font></h1>
<br />
<br />
<body>
    <table width="600" border="0" cellspacing="0" cellpadding="2"  align="center">
      <tr height="80" align="center" bgcolor="<%=title_c%>"> 
        <td colspan="2"><font size="22px"><b><jsp:getProperty name="regBean" property="name" /></b></font></td>
      </tr>
      <tr> 
         <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">직책</font></td>
         <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		   <jsp:getProperty name="regBean" property="position" /></td>  
      </tr>
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">회사명</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=<jsp:getProperty name="regBean" property="company" />"><jsp:getProperty name="regBean" property="company" /></a></td>  
      </tr>
      <tr> 
         <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">연락처</font></td>
         <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		  <a href="tel:<jsp:getProperty name="regBean" property="tell" />"><jsp:getProperty name="regBean" property="tell" /></a></td>  
      </tr>
	   <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">SMS</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px">	
		  <a href="sms:<jsp:getProperty name="regBean" property="tell" />"><jsp:getProperty name="regBean" property="tell" /></a></td>  
      </tr> 
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">이메일</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		   <a href="mailto:<jsp:getProperty name="regBean" property="email" />"><jsp:getProperty name="regBean" property="email" /></a></td>  
      </tr>
      <tr> 
        <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em">주소</font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href="http://maps.google.com/maps?q=<jsp:getProperty name="regBean" property="address" />"><jsp:getProperty name="regBean" property="address" /></a></td>  
      </tr>
	  <td width="100" height="40" align="center" bgcolor="<%=value_c%>"><font size="5em"></font></td>
        <td width="400" bgcolor="<%=value_c%>" align="center" style="font-size: 25px"> 
		  <a href=index.do>이전으로</a>
		   &nbsp; &nbsp;
		  <a href=selectForm.do>목록보기</a>
		</td>  
      </tr>      
  </table>
</body>
</html>
