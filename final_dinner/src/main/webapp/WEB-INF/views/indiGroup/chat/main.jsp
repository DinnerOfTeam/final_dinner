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
		$('.cal_detail').hide();
		$('.table_my tr td').each(function() {
			bring($(this));
		});
		$('select#groupNo').find('option').each(function() {
			if($(this).val()== '${param.groupNo}') {
				$(this).prop('selected', true);
			}
		});
		$('form select').change(function() {
			$('form').submit();
		});
		$('.table_my tr td').click(function() {
			bring($(this));
			$(this).find('div.cal_detail').parent().last('&nbsp;').remove();
			$(this).find('div.cal_detail').toggle();
		});
		function bring(ele) {
			var y= $(ele).find('input[type=hidden]').eq(0).val();
			var m= $(ele).find('input[type=hidden]').eq(1).val();
			var d= $(ele).find('input[type=hidden]').eq(2).val();
			var g= ${param.groupNo};
/* 			alert(y+ ", "+ m+ ', '+ d+ ', '+ g); */
			$.ajax({
				type: "post",
				url: "<c:url value= '/indiGroup/calender/search.do' />",
				data:{
					calYear: y,
					calMonth: m,
					calDate: d,
					groupNo: g,
				},
				success: function(res) {
					if(res== "") return;
					var data= '';
					for(var idx in res) {
						data+= '<p>'+ res[idx].calContents+ '</p>';
					}
					$(ele).find('div.cal_detail').html(data);
					$(ele).find('div.cal_detail').parent().append('&nbsp;');
				},
				error: function(xhr, sta, err) {
					alert(sta+ " => "+ err);
				}
			});
		}
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