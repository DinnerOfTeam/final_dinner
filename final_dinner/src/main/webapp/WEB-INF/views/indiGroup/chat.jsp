<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
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
	.chat_list {
		max-height: 600px;
		overflow-y: scroll; 
	}
</style>
<script type="text/javascript">
	$(function() {
		$('button').click(chat);
		$('input').on('keypress', function(e) {
			if(e.which== 13)
				chat();
			else {
				
			}
		});
		function chat() {
			/* var mNo = $('#memNo').val();
			var gNo = $('#groupNo').val();
			var chatCont = $('#chatText').val();
			
			$.ajax({
				type: "post",
				url: "<c:url value= '/indiGroup/chat/chatAdd.do' />",
				data:{
					memNo: mNo,
					groupNo: gNo,
					chatContents: chatCont
				},
				success: function(result){
					if(result==1){
 						Alert('#successMessage', 2000); 
					}else if(result==0){
 						Alert('#warningMessage', 2000); 
					}
				}
			});
			$('#chatText').val(''); */
		}
		$('.chat_list .is_me').each(function() {
			if($(this).val()== '${sessionScope.memNo}') {
				$(this).next('p.badge').addClass('badge-primary');
			}else {
				$(this).next('p.badge').addClass('badge-warning');
			}
		});
 		$('.chat_user .is_exist').each(function() {
			if($(this).val()!= 'Y') {
				$(this).next('i').addClass('user_none');
			}
		});
 		

/*  		function chatList(type){
 			$.ajax({
 				type: "post",
 				url: "<c:url value= '/indiGroup/chat.do' />",
 				data:{
 					listType: chat_list
 				},
 				success: function(data){
 					if(data=="") return;
 					var parsed = JSON.parse(data);
 					var result = parsed.result;
 					for(var i = 0;i < result.length; i++){
 						addChat(result[i][0].value, result[i][1].value, result[i][2].value);
 					}
 					lastID=Number(parsed.last);
 				}
 			});
 		}
 		function addChat(ele1, ele2, ele3) {
 			alert(ele1);
 		}
 		function getInfinity(){
 			setInterval(function(){
 				chatList(lastID);
 			},500);
 		} */
	});
</script>
<div class= 'chat'>
	<div title= "header">
		<i class="fa fa-comments-o left_align" aria-hidden="true">우리들의 채팅</i>
		<span>
			<a href= "<c:url value='/board/list.do' />"></a>
		</span>
		<div class= 'clear'>
			<img id= 'imgLine' alt="라인" src="${pageContext.request.contextPath }/images/Line.JPG">
		</div>
	</div>
	<div class= 'div_list'>
	<fieldset class= 'chat_user border_fieldset pad_both0'>
		<legend><i class="fa fa-users" aria-hidden="true">유저 목록</i></legend>
		<c:forEach var="vo" items="${user_list }">
			<span class= 'user_icon'><input type="hidden" class= 'is_exist' value= "${vo.chatUserExist }" /><i class="fa fa-user left_align" aria-hidden="true"> ${vo.memName } </i></span>
		</c:forEach>
	</fieldset>
	<fieldset class= 'chat_list border_fieldset pad_both0'>
	<legend>채팅목록</legend>
<!-- 		<input type="hidden" class= 'is_me' value= '3' /><p class='badge'>장요한曰 : 하이요~</p><span class='chat_time'>11:58</span>
		<input type="hidden" class= 'is_me' value= '2' /><p class='badge'>최정규曰 : 안녕안녕!</p><span class='chat_time'>11:59</span>
		<input type="hidden" class= 'is_me' value= '1' /><p class='badge'>손성현曰 : 허허허~</p><span class='chat_time'>11:59</span>
		<input type="hidden" class= 'is_me' value= '4' /><p class='badge'>김은영曰 : 안녕하세요</p><span class='chat_time'>12:00</span>
		<input type="hidden" class= 'is_me' value= '3' /><p class='badge'>장요한曰 : 잘해봅시다</p><span class='chat_time'>12:01</span> -->
		<c:if test="${empty chat_list }">
			<p class= 'text_left text_08'><strong>최근 채팅이 없습니다</strong></p>
		</c:if>
		<c:forEach var="vo" items="${chat_list }">
			<div class='chat_time'><input type="hidden" class= 'is_me' value= '${vo.memNo }' /><p class='badge'>${vo.memName }曰 : ${vo.chatContents }</p><fmt:formatDate value="${vo.chatRegdate }" pattern="HH:mm" /> </div>
		</c:forEach>
	</fieldset>
	<div class= 'row'>
		<form action="<c:url value='/indiGroup/chat/chatAdd.do' />" method="post">
			<input type="hidden" name= 'groupNo' id= 'groupNo' value="${param.groupNo }" />
			<input type="hidden" name= 'memNo' id= 'memNo' value="${sessionScope.memNo }" />
			<div class='col-sm-7'><input type="text" name= 'chatContents' id= 'chatText' /></div>
			<div class='col-sm-5'><button>전송</button></div>
		</form>
	</div>
	</div>
</div>