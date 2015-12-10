<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<div style="boarder:1px solid gray;">
<c:if test="${not empty loginUser}">
	${loginUser.name}(${loginUser.id})님
	<a href="${pageContext.request.contextPath}/auth/logout.do">|로그아웃|</a>
</c:if>
<c:if test="${empty loginUser}">
  <a href="${pageContext.request.contextPath}/auth/login.do">|로그인|</a>
</c:if>
  
  <a href="${pageContext.request.contextPath}/member/add.do">회원가입|</a>
  
  <c:if test="${loginUser.id=='admin'}">  
  <a href="${pageContext.request.contextPath}/member/list.do">회원관리|</a>
  </c:if>
  
  <c:if test="${not empty loginUser.id}">  
  <a href="${pageContext.request.contextPath}/member/mydetail.do?id=${loginUser.id}">내 정보|</a>
  </c:if>
</div>
 