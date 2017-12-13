<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="tab_menu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#container	{
	/*clear: both;*/
	width:60%;margin: 0 auto;
	float: right;
	overflow: auto;
	background: white;
	}
</style>
</head>
<body>
	<div id="container">
		<table summary="">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:50%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:10%;" />	
			</colgroup>
			<thead>
			  <tr>
			    <th scope="col">번호</th>
			    <th scope="col">제목</th>
			    <th scope="col">작성자</th>
			    <th scope="col">작성일</th>
			    <th scope="col">조회수</th>
			  </tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">해당하는 데이터가 없습니다.
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list }">
						<tr style="text-align:center">
						<td>${vo.qna_question_no }</td>
						<td style="text-align:left">
						<a href
					="<c:url value='/customer/countUpdate.do?no=${vo.question_view_count}'/>">
						${vo.question_title }
					</a>
						</td>
						<td>${vo.mem_no}</td>
						<td><fmt:formatDate value="${vo.question_regdate }"
							pattern="yyyy-MM-dd"/></td>
						<td>${vo.question_view_count }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ include file="../inc/footer.jsp" %>