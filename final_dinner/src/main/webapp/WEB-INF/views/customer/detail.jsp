<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글 상세보기</h2>
	<table>
		<tr>
			<td>제목</td>
			<td>${vo.questionTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.}</td>
			<td>등록일</td>
			<td>${vo.questionRegdate}</td>
			<td>조회수</td>
			<td>${vo.questionViewCount}</td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</body>
</html>
<%@ include file="../inc/footer.jsp" %>