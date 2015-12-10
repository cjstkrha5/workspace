<%-- EL을 이용하여 게시물 데이터 출력하기 --%>
<%@page
	import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl"%>
<%@page
	import="org.springframework.web.context.request.RequestAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시판-목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
#haha {
	font-size: 40px;
	color: red;
}
</style>
<body align="center">
	<jsp:include page="/Header.jsp" />
	<h1 id="haha">영혼의 듀오 대여점</h1>
	<jsp:include page="/cssmenu/index.html"></jsp:include>
	<p>
		<c:if test="${loginUser.id=='admin'}">
			<a href='add.do'>상품 등록</a>
		</c:if>
	<p>
		<jsp:include page="Search.jsp" />
	<table border='1' align="center">
		<tr>
			<th>이미지</th>
			<th>제목</th>
			<th>평점</th>
			<th>종류</th>
			<th>장르</th>
			<th>대여가능수량</th>
		</tr>

		<c:forEach var="product" items="${products}">

			<tr>
				<td><img height="60" width="44"
					src='../photo/s-${(empty product.photo)?"anonymous.png":product.photo}'>
				</td>
				<c:if test="${loginUser.id=='admin'}">
					<td><a href='detail.do?name=${product.name}'>${product.name}</a></td>
				</c:if>
				<c:if test="${loginUser.id!='admin'}">
					<td><a href='detail2.do?name=${product.name}'>${product.name}</a></td>
				</c:if>
				<td>${product.grade}</td>
				<td>${product.kind}</td>
				<td>${product.genre}</td>
				<td>${product.amount}</td>
			</tr>
		</c:forEach>

	</table>

  <div style="overflow: ;">
    <div class="form-group">
      <div class="row">
        <div class="col-md-8">
          <div id="datetimepicker12"></div>
        </div>
      </div>
    </div>
  </div>
	<jsp:include page="/Copyright.jsp" />

</body>
  <script type="text/javascript">
      $(function() {
        $('#datetimepicker12').datetimepicker({
          inline : true,
          sideBySide : true
        });
      });
    </script>
</html>





