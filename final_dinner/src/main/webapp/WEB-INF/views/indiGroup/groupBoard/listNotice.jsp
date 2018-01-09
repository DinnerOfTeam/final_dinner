<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	#imgLine {
		width: 100%;
		height: 6px;
	}
</style>
<div title= 'board_review'>
	<div title= "header">
		<i class="fa fa-comments-o left_align" aria-hidden="true"> 그룹게시판</i>
		<span>
			<a href= "<c:url value='/indiGroup/groupBoard/list.do?groupNo=${param.groupNo }' />">
				<img class= 'more_img' alt="더보기 이미지" src="${pageContext.request.contextPath }/images/more.JPG">
			</a>
		</span>
		<div class= 'clear'>
			<img id= 'imgLine' alt="라인" src="${pageContext.request.contextPath }/images/Line.JPG">
		</div>
	</div>
	
	<div>
		<table class= 'table_my' >
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.memName }</td>
							<td><a class= 'vote_list' href="<c:url value= '#' />">${vo.gboardTitle }</a></td>
							<td><fmt:formatDate value="${vo.gboardRegdate }" pattern="yy-MM-dd" /></td>
						<tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr><td colspan="3" style="text-align: center;">그룹게시판이 비었습니다.</td></tr>
				</c:if>
		</table>
	</div>
	
</div>