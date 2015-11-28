<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시판-상세정보</title>
</head>
<body>
	<c:if test="${not empty project}">
		<form action="update" method="post" id="form1">
			<table border="1">
				<tr>
					<th>번호</th>
					<td><input type="text" name="no" value="${project.no}"></td>
				</tr>
				<tr>
					<th>프로젝트명</th>
					<td><input type="text" name="title" value="${project.title}"></td>
				</tr>
				<tr>
					<th>시작일</th>
					<td><input type="text" name="startDate"
						value="${project.startDate}"></td>
				</tr>
				<tr>
					<th>종료일</th>
					<td><input type="text" name="endDate" value="${project.endDate}"></td>
				</tr>
				<tr>
					<th>멤버</th>
					<td><input type="text" name="member" value="${project.member}"></td>
				</tr>

			</table>
			<p>
				<button id="update" type="submit">수정</button>
				<button id="delete" type="submit" onclick="deleteProject()">삭제</button>
			</p>
		</form>
	</c:if>
	<c:if test="${empty project}">
		없어 임마
	</c:if>
	<jsp:include page="/Copyright.jsp"></jsp:include>
	<script type="text/javascript">
		function deleteProject() {
			document.getElementById("form1").action = "delete";
		}
	</script>
</body>
</html>