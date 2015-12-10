<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<meta http-equiv="Refresh" content="2;url=list">
<title>게시판-상세정보</title>
</head>
<body>
	<p>
		<c:choose>
			<c:when test="${errorCode == '401'}">401 에러 임마</c:when>		
			<c:otherwise>기타에러 임마</c:otherwise>
		</c:choose>
	</p>
	<jsp:include page="/Copyright.jsp"></jsp:include>
</body>
</html>