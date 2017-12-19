<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<script src="https://use.fontawesome.com/a9eeb9d53e.js"></script>
<style type="text/css">
	.table, .table td {
		border: 1px solid #353535;
		padding: 15px 0px !important;
		text-align: center;
	}
	.table th {
		border-bottom: 1px solid #353535;
		text-align: center;
		padding: 5px !important;
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
					<div title= 'board_review'>
						<c:import url="/indiGroup/board_review.do" />
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
			</div>
		</div>
	</article>

<%@ include file="../../inc/footer.jsp" %>