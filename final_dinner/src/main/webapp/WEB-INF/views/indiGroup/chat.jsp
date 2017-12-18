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
	.text_08 {
		font-size: 0.8em;
	}
	.user_icon {
		overflow: hidden;
	}
	.text_left {
		text-align: left;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('button').click(chat);
		$('input').on('keypress', function(e) {
			if(e.which== 13)
				chat();
		});
		function chat() {
			alert('채팅 보내기');
			$('input#chatText').val('');
		}
	});
</script>
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
				<span class= 'user_icon'><i class="fa fa-user-o left_align" aria-hidden="true"> ${vo.memName } </i></span>
			</c:forEach>
		</div>
	</div>
	<div class= 'div_list'>
		<c:if test="${empty chat_list }">
			<p class= 'text_left text_08'><strong>최근 채팅이 없습니다</strong></p>
		</c:if>
		<c:forEach var="vo" items="${chat_list }">
			<p class= 'text_left text_08'>${vo.memNo }님 曰 : ${vo.chatContents }</p>
		</c:forEach>
	</div>
	<div class= 'div_list'>
		<input type="text" id= 'chatText' class='text_08' />
		<button>전송</button>
	</div>
</div>