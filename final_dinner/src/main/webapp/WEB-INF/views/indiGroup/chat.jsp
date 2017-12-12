<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.div_list {
		border: 1px solid silver;
		font-size: 0.9em;
		overflow: hidden;
		padding: 5px;
	}
	.user_icon {
		overflow: hidden;
	}
	.text_left {
		text-align: left;
	}
</style>
<div class= 'vote'>
	<div title= "header">
		<i class="fa fa-comments-o left_align" aria-hidden="true">우리들의 채팅</i>
		<span>
			<a href= "<c:url value='/board/list.do' />"></a>
		</span>
		<div class= 'clear'>
			<img id= 'imgLine' alt="라인" src="${pageContext.request.contextPath }/images/Line.JPG">
		</div>
	</div>
	
	<div title= 'user_list' class= 'div_list'>
		<i class="fa fa-users" aria-hidden="true">유저 목록</i>
		<div class= 'div_list'>
			<c:forEach var="vo" items="${user_list }">
				<span class= 'user_icon'><i class="fa fa-user-o left_align" aria-hidden="true"> ${vo } </i></span>
			</c:forEach>
		</div>
	</div>
	<div class= 'div_list'>
		<c:forEach var="vo" items="${chat_list }">
			<p class= 'text_left'>${vo.memNo }님 曰 : ${vo.chatContents }</p>
		</c:forEach>
	</div>
	<div class= 'div_list'>
		<input type="text" />
		<button>전송</button>
	</div>
</div>