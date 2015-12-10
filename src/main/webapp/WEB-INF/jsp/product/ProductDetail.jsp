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
		<form id='form1' action='update.do' method='post' align="center"
			enctype="multipart/form-data">
			 <a href="list.do" >리스트</a>
			<table border='1' align="center">	
				<tr>
					<td rowspan="7">
            <img height="200" width="180" src='../photo/${(empty product.photo)?"anonymous.png":product.photo}' style="height: 200px; width: 180px">
          </td>
					<th>제목</th>
					<td><input type='text' name='name' value='${product.name}'
						readonly>
					</td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><textarea rows='10' name='story' cols='45'>${product.story}</textarea></td>
				</tr>
				<tr>
					<th>평점</th>
					<td>${product.grade}</td>
				</tr>
				<tr>
					<th>출시일</th>
					<td><input type="date" name="date" value="${product.date}">${product.date}</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>
						<input type="radio" name="kind" value="all">전체
  					<input type="radio" name="kind" value="comic">만화 
					  <input type="radio" name="kind" value="novel">소설 
					  <input type="radio" name="kind" value="dvd">DVD</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>
				  	<input type="radio" name="genre" value="all">전체
  					<input type="radio" name="genre" value="ero">에로 
					  <input type="radio" name="genre" value="comic">코믹 
					  <input type="radio" name="genre" value="action">액션 
					  <input type="radio" name="genre" value="melo">멜로
					</td>
				</tr>
				<tr style="width: 520px; ">
          <th>이미지</th>
          <td> 
           <input type="file" name="file">
           <input type="hidden" name="photo" value="${product.photo}">
          </td>
        </tr>
	
			</table>
			<p>
  			<a href="rent.do?name=${product.name}" class="button2">[대여]  </a>
  			<a href="returnProduct.do?name=${product.name}" class="button2">[반납]  </a>
				<button name='update' type='submit' class='button1'>[변경]</button>
        <a href="delete.do?name=${product.name}" class="button2">  [삭제]  </a>
			</p>
			<p>
			</p>
		</form>
	</c:if>
	
  <jsp:include page="Reply.jsp" />

	<c:if test="${empty product}">
		<p>해당 번호의 게시물을 찾을 수 없습니다.</p>
	</c:if>

	<jsp:include page="/Copyright.jsp" />

</body>
</html>
