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
<h1 align="center">대 여</h1>
<form action='rent.do' method='post' align="center">
<table border='1' align="center">
<tr>
  <th>대여상품</th>
  <td><input type='text' name='name' value="${name}"></td>
</tr>
<tr>
  <th>대여인 아이디</th>
  <td><input type='text' name='rentmember'></td>
</tr>
</table>

<p><button type='submit'>확인</button></p>

</form>

<jsp:include page="/Copyright.jsp" />


</body>
</html>





    