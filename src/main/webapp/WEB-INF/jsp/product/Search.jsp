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
		<tr>종류
			<select name="kind">
		    <option value="all">전체</option>
				<option value="comic">만화</option>
				<option value="novel">소설</option>
				<option value="DVD">DVD</option>
			</select>
			장르
			<select name="genre">
			  <option value="all">전체</option>
				<option value="melo">멜로</option>
				<option value="comic">코믹</option>
				<option value="action">액션</option>
				<option value="ero">에로</option>
			</select>
			<input type="text" name="name">
			<button>검색</button>
		</tr>
	</form>
</body>
</html>





