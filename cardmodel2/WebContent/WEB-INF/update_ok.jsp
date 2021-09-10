<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<style>

</style>
<meta charset="UTF-8">
<title>업데이트완료</title>

</head>
<body>
	<c:if test="${flag }">
		<script type="text/javascript">
			alert("수정이 완료 되었습니다.");
			location.href="selectForm.do";
		</script>
	</c:if>
	
	<c:if test="${!flag }">
		<script type="text/javascript">
			alert("수정을 실패 하였습니다.");
			location.href="selectForm.do";
		</script>
	</c:if>
	
</body>
</html>