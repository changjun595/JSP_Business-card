<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	table
	{
		margin-right: auto;
		margin-left: auto;
	}
	body
	{
		font-family: 'Hanna', serif;
	}
	.text
	{
		text-align: center;
		margin-bottom: 30px;
	}
	
</style>
<title>회원 목록보기</title>
</head>
<body>
	<h1 align="center">회원 목록보기</h1>
	<div class="text"><a href="index.do">처음으로</a></div>
	<table border="1" >
		<tr>
			<th>이름</th>
			<th>회사</th>
			<th>직책</th>
			<th>전화</th>
			<th>메일</th>
			<th>주소</th>
			<th>보기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${list}">	
		<tr>
			<td> ${dto.getName()}</td>
			<td> ${dto.getCompany()}</td>
			<td> ${dto.getPosition()}</td>
			<td> ${dto.getTell()} </td>
			<td> ${dto.getEmail()} </td>
			<td> ${dto.getAddress()} </td>
			<td><a href="select.do?name=${dto.getName() }">보기</a></td>
			<td><a href="update.do?name=${dto.getName() }">수정</a></td>
			<td><a href="delete.do?name=${dto.getName() }">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
