<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>common/message.jsp</title>
</head>
<body>
<%
	/* String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
	String ctxPath = request.getContextPath();
	url = ctxPath+ url;  */
	
	
%>

	<script type="text/javascript">		
		<c:if test="${!empty msg}">
			alert("${msg}");
		</c:if>
		<c:choose>
			<c:when test="${back=='yes' }">
				history.back();
			</c:when>
			<c:otherwise>
				location.href="<c:url value='${url}'/>"; 
			</c:otherwise>
		</c:choose>
		
		
	</script>
	
	<noscript>
		<c:if test="${!empty msg}">
			<h2>${msg}</h2>
		</c:if>
		<c:choose>
			<c:when test="${back}">
				뒤로가기 버튼을 클릭해서 이동
			</c:when>
			<c:otherwise>
				<a href="<c:url value='${url}'/>">여기를 클릭해서 이동</a>
			</c:otherwise>
		</c:choose>
	</noscript>
</body>
</html>







