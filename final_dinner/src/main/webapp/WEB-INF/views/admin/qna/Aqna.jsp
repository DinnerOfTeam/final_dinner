<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.tr_hover:hover {
		background-color: rgb(158, 22, 22);
		color: white;
	}
	.answer_div {
		clear: both;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.answer_div').hide();
		$('.tr_hover').click(function() {
			$(this).find('div.answer_div').find('div').html('');
			$(this).find('div.answer_div').find('div').each(function(idx) {
				if(idx== 0) {
					var msgEl= $("<strong>답변하기</strong>");
					$(this).append(msgEl);
				}else if(idx== 1) {
					var inputEl= $('<input type= text placeholder= "답변입력" style= "width: 100%"/>');
					$(this).append(inputEl);
				}else if(idx== 2) {
					var buttonEl= $('<button>답변</button>'+
							'<button>취소</button>');
					$(this).append(buttonEl);
				}
			});
			$('.answer_div').show();
		});
	});
</script>
<p>질문 목록</p>
<div class= 'container'>
	<c:forEach var="vo" items="${list }">
		<div class= 'row tr_hover'>
			<div class= 'col-sm-2'>${vo.memName }</div>
			<div class= 'col-sm-3'>${vo.questionTitle }</div>
			<div class= 'col-sm-7'>${vo.questionContent }</div>
			<div class= 'answer_div'>
				<div class= 'col-sm-2'></div>
				<div class= 'col-sm-8'></div>
				<div class= 'col-sm-2'></div>
			</div>
		</div>
	</c:forEach>
</div>