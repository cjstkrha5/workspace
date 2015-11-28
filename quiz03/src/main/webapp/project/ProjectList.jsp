<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시판-새글</title>
</head>
<body>
	<a href="form.html">프로젝트 등록</a>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>프로젝트명</td>
			<td>시작일</td>
			<td>종료일</td>
			<td>멤버</td>
		</tr>
		<c:forEach var="project" items="${projects}">
			<tr>
				<td>${project.no}</td>
				<td><a href="update?no=${project.no}">${project.title}</a></td>
				<td>${project.startDate}</td>
				<td>${project.endDate}</td>
				<td>${project.member}</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="/Copyright.jsp"></jsp:include>

</body>
</html>