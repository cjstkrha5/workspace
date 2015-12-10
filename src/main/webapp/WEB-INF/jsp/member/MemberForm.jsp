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
  <title>회원-새글</title>
</head>
<body align="center">
<h1>회원</h1>
<form action='add.do' method='post' align="center" enctype="multipart/form-data">
<table border='1' align="center">
<tr>
  <th>아이디</th>
  <td><input type='text' name='id'></td>
</tr>
<tr>
  <th>비밀번호</th>
  <td><input type='text' name='password'></td>
</tr>
<tr>
  <th>이름</th>
  <td ><input type='text' name='name'></td>
</tr>
<tr>
  <th>전화번호</th>
  <td><input type='text' name='tel'></td>
</tr>
<tr>
  <th>이메일</th>
  <td><input type='text' name='email'></td>
</tr>
<tr>
  <th>사진등록</th>
  <td><input type='file' name='file'></td>
</tr>
</table>

<p><button type='submit'>등록</button></p>

</form>

<jsp:include page="/Copyright.jsp" />


</body>
</html>





    