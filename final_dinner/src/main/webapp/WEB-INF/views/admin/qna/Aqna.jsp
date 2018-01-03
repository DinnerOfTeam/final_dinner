<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.tr_hover:hover {
		background-color: rgb(158, 22, 22);
		color: white;
	}
	.tr_hover button, .tr_hover input, .tr_hover textarea {
		color: black;
	}
	.answer_div {
		clear: both;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.answer_div').hide();
		$('.add_reple').click(function() {
/* 			$(this).parent().parent().find('div.answer_div').find('div').html('');
			$(this).parent().parent().find('div.answer_div').find('div').each(function(idx) {
				if(idx== 0) {
					var msgEl= $("<strong>답변하기</strong>");
					$(this).append(msgEl);
				}else if(idx== 1) {
					var inputEl= $('<input type= text placeholder= "답변입력" style= "width: 100%"/>');
					$(this).append(inputEl);
				}else if(idx== 2) {
					var buttonEl1= $('<button class="submit_bt">답변</button>');
					var buttonEl2= $('<button class="clear_bt">취소</button>');
					$(this).append(buttonEl1);
					$(this).append(buttonEl2);
				}
			});
			$('.answer_div').show(); */
			$(this).parent().parent().find('.answer_div').toggle();
		});
		$('.clear_bt').click(function() {
			$(this).parent().prev('div').find('textarea').val('');
		});
/* 		$('.submit_bt').click(function() {
			var qno= $(this).parent().prev('div').find('input:eq(0)').val();
			var contents= $(this).parent().prev('div').find('textarea').val();
			location.href= "<c:url value= '/answer/reply.do?qnaQuestionNo="+ qno+ "&answerContent="+ contents+ "' />";
		}); */
	});
</script>
<p>질문 목록</p>
<div class= 'container'>
	<c:forEach var="vo" items="${list }">
		<div class= 'row tr_hover'>
			<div class= 'col-sm-2'>${vo.memName }</div>
			<div class= 'col-sm-3'>${vo.questionTitle }</div>
			<div class= 'col-sm-6'>${vo.questionContent }</div>
			<div class= 'col-sm-1'><input type="button" class="add_reple" value= '답변하기' /></div>
			<form class= 'answer_div' action="<c:url value= '/answer/reply.do' />">
				<div class= 'col-sm-2'>
					<strong>답변하기</strong>
				</div>
				<div class= 'col-sm-8'>
					<input type="hidden" name= 'qnaQuestionNo' value= '${vo.qnaQuestionNo }' />
					<textarea placeholder= "답변입력" name= answerContent style= "width: 100%" ></textarea>
				</div>
				<div class= 'col-sm-2'>
					<button class="submit_bt">답변</button>
					<input type="button" class="clear_bt" value= '취소' />
				</div>
			</form>
		</div>
	</c:forEach>
</div>