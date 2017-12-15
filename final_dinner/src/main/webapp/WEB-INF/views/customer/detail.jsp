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
	<table border="1">
		<colgroup>
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:10%;" />	
			</colgroup>
		<tr>
			<td colspan="3">제목</td>
			<td colspan="3">${vo.questionTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${vo.memNo}</td>
			<td>등록일</td>
			<td>${vo.questionRegdate}</td>
			<td>조회수</td>
			<td>${vo.questionViewCount}</td>
		</tr>
		<tr>
			<td colspan="6" height="">${vo.questionContent }</td>
		</tr>
	</table>
</body>
</html>
<%@ include file="../inc/footer.jsp" %>