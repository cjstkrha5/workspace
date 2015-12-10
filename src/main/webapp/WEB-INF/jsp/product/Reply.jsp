<%-- 게시물 상세정보 및 변경 폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시판-상세정보</title>
<link rel="stylesheet" type="text/css" href="../css/common.css">
</head>
<body align="center">
	<h1 align="center">답글</h1>
	<form id='form1' method='post' action="../reply/add.do" align="center">
		<table border="1" align="center">
			<tr>
				<th>리플달기</th><td><button>확인</button></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows='10' id='r' cols='80' name="content"></textarea></td>
				<input type="hidden" name="id" value="${loginUser.id}">
				<input type="hidden" name="name" value="${product.name}">
			</tr><br>
			<p>
			</p>
		</table>
		<jsp:include page="ReplyModify.jsp"/>

	</form>
</body>
</html>
