<%-- EL을 이용하여 게시물 데이터 출력하기 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시판-목록</title>
</head>
<body align="center">
	<jsp:include page="/Header.jsp" />
	<h1>대여점</h1>
	<br>
	<p>
  <jsp:include page="Search.jsp"/> <a href='../product/list.do'>메인</a>
  </p>
        
  
	<table border='1' align="center">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>대여중인 상품</th>
		</tr>

		<c:forEach var="member" items="${members}">
			<tr>
				<td>${member.id}</td>
				<td><a href='detail.do?id=${member.id}'>${member.name}</a></td>
				<td>${member.tel}</td>
				<td>${member.email}</td>
				<td>${member.rentproduct}</td>
			</tr>
		</c:forEach>
	</table>

	<jsp:include page="/Copyright.jsp" />

</body>
</html>





