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
	<h1 align="center">답글</h1>
	<form id='form1' method='post' action="../reply/update.do"
		align="center">
		<table border="1" align="center">
			<p>
				<c:forEach var="reply" items="${replys}">
					<c:if test="${empty reply}">답글이 없습니다</c:if>
					<tr>
						<c:if test="${loginUser.id != reply.id}">
							<tr>
								<td>아이디 : ${reply.id}</td>
								<td>등록날짜 : ${reply.date}</td>
							</tr>
							<td colspan="4"><textarea rows='10' name='reply' cols='80'
									readonly="readonly">${reply.reply}</textarea></td>
						</c:if>
						<c:if test="${loginUser.id == reply.id}">
							<tr>
								<td>아이디 : ${reply.id}</td>
								<td>등록날짜 : ${reply.date}</td>
								<td><button>변경</button></td>
								<td><a href="../reply/delete.do?no=${reply.no}">삭제</a></td>
								<input type="hidden" name="id" value="${reply.id}">
								<input type="hidden" name="no" value="${reply.no}">
							</tr>
							<td colspan="4"><textarea rows='10' name='reply' cols='80'>${reply.reply}</textarea></td>
						</c:if>
					</tr>
				</c:forEach>

			</p>
		</table>
	</form>
</body>
</html>
