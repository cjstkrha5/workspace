<%-- 게시물 상세정보 및 변경 폼 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>내정보</title>
<link rel="stylesheet" type="text/css" href="../css/common.css">
</head>
<body align="center">

	<jsp:include page="/Header.jsp" />

	<h1 align="center">내정보</h1>

	<c:if test="${not empty member}">
		<form id='form1' action='update.do' method='post' align="center"
			enctype="multipart/form-data">
			<a href='list.do'>리스트</a>
			<table border='1' align="center">
				<tr>
					<td rowspan="7"><img height="200" width="130"
						src='../image/${(empty member.image)?"anonymous.png":member.image}'>
				  </td>
					<th>아이디</th>
					<td><input type='text' name='id' value='${member.id}' readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type='text' name='name' value='${member.name}'
						readonly></td>
				</tr>
				<tr>
					<th>전화번호</th>
          <td><input type='text' name='tel' value='${member.tel}'></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type='text' name='email' value='${member.email}'></td>
				</tr>
        <tr>
          <th>현재 대여 기록</th>
          <td><input type='text' name='rentproduct' value='${member.rentproduct}'></td>
        </tr>
				<tr>
					<th>누적 대여 기록</th>
					<td><input type='text' name='record' value='${member.record}'></td>
				</tr>
				<tr>
					<th>내 이미지</th>
					<td> 
					 <input type='file' name='file'>
					 <input type='hidden' name='image' value="${member.image}">
					</td>
				</tr>
			</table>
			<p>
				<button name='update' type='submit' class='button1'>변경</button>
			  <a href="delete.do?name=${member.id}&password=${member.password}" class="button2">탈퇴</a>
		  </p>
		</form>
	</c:if>

	<c:if test="${empty member}">
		<p>해당 번호의 게시물을 찾을 수 없습니다.</p>
	</c:if>

	<jsp:include page="/Copyright.jsp" />

</body>
</html>
