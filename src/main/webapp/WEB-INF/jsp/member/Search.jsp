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
<body>
	<form action="search.do" method="post">
		<tr>
	  <input type="text" name="name">
	  <button>검색</button>
		</tr>
	</form>
</body>
</html>





