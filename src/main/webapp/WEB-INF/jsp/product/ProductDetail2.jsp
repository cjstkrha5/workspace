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

	<jsp:include page="/Header.jsp" />

	<h1 align="center">정보</h1>

	<c:if test="${not empty product}">
		<form id='form1' method='post' align="center">
			<p>
				<a href="list.do" >리스트</a>
			</p>
			<table border='1' align="center">
				<tr>
					<td rowspan="7"><img height="200" width="180"
						src='../photo/${(empty product.photo)?"anonymous.png":product.photo}'
						style="height: 200px; width: 180px"></td>
					<th>제목</th>
					<td>${product.name}</td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><textarea rows='10' name='story' cols='60' readonly>${product.story}</textarea></td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${product.grade}</td>
				</tr>
				<tr>
					<th>출시일</th>
					<td>${product.date}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>${product.kind}</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>${product.genre}</td>
				</tr>
			</table>
		</form>
	</c:if>
	<jsp:include page="Reply.jsp" />

	<c:if test="${empty product}">
		<p>해당 번호의 게시물을 찾을 수 없습니다.</p>
	</c:if>

	<jsp:include page="/Copyright.jsp" />

</body>
</html>
