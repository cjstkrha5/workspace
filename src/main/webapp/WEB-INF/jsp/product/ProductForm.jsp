<%-- EL을 이용하여 게시물 데이터 출력하기 --%>
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset='UTF-8'>
  <title>게시판-새글</title>
</head>
<body align="center">
<h1>등록</h1>
<form action='add.do' method='post' enctype="multipart/form-data" align="center">
<table border='1' align="center">
<tr>
  <th>제목</th>
  <td><input type='text' name='name' placeholder="제목을 넣으세요."></td>
</tr>
<tr>
  <th>출시일</th>
  <td ><input type='date' name='date'></td>
</tr>
<tr>
  <th>입고량</th>
  <td><input type='text' name='amount'></td>
</tr>
<tr>
  <th>줄거리</th>
  <td><textarea rows='10' name='story' cols='60'
       placeholder="내용을 입력하세요."></textarea></td>
</tr>
<tr>
  <th>종류</th>
  <td>
    <input type="radio" name="kind" value="all">전체
    <input type="radio" name="kind" value="comic">만화
    <input type="radio" name="kind" value="novel">소설
    <input type="radio" name="kind" value="dvd">DVD
  </td>
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
<tr>
  <th>첨부파일</th>
  <td><input type='file' name='file'></td>
</tr>
</table>

<p><button type='submit'>등록</button></p>

</form>

<jsp:include page="/Copyright.jsp" />


</body>
</html>





    