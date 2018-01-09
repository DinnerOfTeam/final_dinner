<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script src="https://use.fontawesome.com/a9eeb9d53e.js"></script>
<style type="text/css">
	.table_my {
		width: 100%;
	}
	.table_my, .table_my td {
		border: 1px solid #353535;
		padding: 0 0 15px 0;
		margin-bottom: 30px;
	}
	.table_my th {
		border-bottom: 1px solid #353535;
		text-align: center;
		padding: 15px;
	}
	.work {
		background-color: blue;
		width: 100%;
		margin: 0;
	}
	.more_img {
		float: right;
	}
	.clear {
		clear: both !important;
	}
	.left_align {
		float: left;
		text-align: left;
	}
	.text_left {
		text-align: left;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('select#groupNo').find('option').each(function() {
			if($(this).val()== '${param.groupNo}') {
				$(this).prop('selected', true);
			}
		});
		$('form select').change(function() {
			$('form').submit();
		});
	});
</script>
	<c:import url="../../inc/indigroupSide.jsp" />
				<form action="<c:url value='/indiGroup/chat/main.do' />" method="post" 
						name= "groupSelc" id= "groupSelc" style="text-align: right;">
					<label for= 'groupNo'>그룹변경 :</label> <select name= groupNo id= 'groupNo'>
						<c:forEach var="vo" items="${list }">
							<option value="${vo.groupNo }">${vo.groupName }</option>
						</c:forEach>
					</select>
				</form>
				<div class= 'col-md-8'>
					<div title="calender">
						<c:import url="/indiGroup/calender.do" />
					</div>
					<div title= 'group_board'>
						<c:import url="/indiGroup/groupBoard/listNotice.do" />
					</div>
					<div title= 'vote'>
						<c:import url="/indiGroup/vote.do" />
					</div>
				</div>
				<div class= 'col-md-4'>
					<div title= 'chatting'>
						<c:import url="/indiGroup/chat/chat.do" />
					</div>
				</div>
				
	<div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
				aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">일정 추가하기</h4>
					</div>
					<div class="modal-body" id= 'modal-body'>
						<input type="text" placeholder="일정을 작성하세요" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id= 'modal_close'>닫기</button>
						<button type="button" class="btn btn-primary" id= 'cal_add'>변경 사항 저장</button>
					</div>
				</div> <!-- 모달 콘텐츠 -->
			</div> <!-- 모달 다이얼로그 -->
		</div> <!-- 모달 전체 윈도우 -->
	</div>
			</div>
		</div>
	</article>

<%@ include file="../../inc/footer.jsp" %>