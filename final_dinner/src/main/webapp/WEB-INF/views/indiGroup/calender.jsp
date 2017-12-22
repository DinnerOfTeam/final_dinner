<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.cal_detail {
		position: relative;
		background-color: green;
		font-size: 0.7em;
		font-weight: bold;
		color: white;
	}
	.green {
		color: green;
	}
	.table_cal {
		width: 100%;
	}
	.table_cal, .table_cal td {
		border: 1px solid #353535;
		padding: 0 0 15px 0;
		margin-bottom: 30px;
	}
	.table_cal td {
		max-width: 55px;
	}
	.table_cal th {
		border-bottom: 1px solid #353535;
		text-align: center;
		padding: 15px;
	}

</style>
<script type="text/javascript">
	$(function() {
		function take() {
			$('.table_cal tr td').each(function() {
				bring($(this));
			});
		}
		take();
/* 		$('.table_cal tr td div').click(function() {
 			$(this).find('div.cal_detail').toggleClass('green'); */
/*    			event.stopPropagation(); */
/* 		}); */
		
		$('.table_cal tr td').click(function() {
			var y= $(this).find('input[type=hidden]').eq(0).val(); 
			var m= $(this).find('input[type=hidden]').eq(1).val(); 
			var h= $(this).find('input[type=hidden]').eq(2).val();
			var div= '<label><span>'+ y+ '</span> - <span>'+ m+ '</span> - <span>'+ h+ '</span></label><br>';
			div+= '<input type="text" placeholder="일정을 작성하세요" />';
			$('#modal-body').html(div);
		})
		$('#cal_add').click(function() {
			var y, m, d;
			$('#modal-body').find('span').each(function(idx) {
				if(idx== 0) {
					y= $(this).text();
				}else if(idx== 1) {
					m= $(this).text();
				}else if(idx== 2) {
					d= $(this).text();
				}
			});
			var c= $('#modal-body').find('input').val();
			if(confirm(y+ '년 '+ m+ '월 '+ d+ '일 예약 내용 : '+ c+ '이 맞습니까?')) {
				if(c== ''|| c== null) {
					alert('일정을 입력하세요');
					$('#modal-body').find('input').focus();
				}else {
					$.ajax({
						type: "post",
						url: "<c:url value= '/indiGroup/calender/appAdd.do' />",
						data:{
							calYear: y,
							calMonth: m,
							calDate: d,
							groupNo: ${param.groupNo},
							calContents: c,
						},
						success: function() {
							take();
							$('#modal_close').click();
						},
						error: function(xhr, sta, err) {
							alert(sta+ " => "+ err);
						}
					});
				}
			}
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
				},
				error: function(xhr, sta, err) {
					alert(sta+ " => "+ err);
				}
			});
		}
	});
</script>
<div>
	<div title= "header">
		<a title= '이전달 보기' href="<c:url value= '/indiGroup/chat/main.do?year=${today.year }&month=${today.month-1 }&p_date=${today.date }&groupNo=${param.groupNo }' />" class= 'ajex'><-</a>&nbsp;&nbsp;
<%-- 							<a href="<c:url value= '#' />" class= 'ajex'><-</a>&nbsp;&nbsp; --%>
		<i class="fa fa-calendar" aria-hidden="true"> 일정(<fmt:formatDate value="${today }" pattern="yyyy-MM"/>)</i>
		&nbsp;&nbsp;<a title= '다음달 보기' href="<c:url value= '/indiGroup/chat/main.do?year=${today.year }&month=${today.month+1 }&p_date=${today.date }&groupNo=${param.groupNo }' />" class= 'ajex'>-></a>&nbsp;&nbsp;
		<%-- <a href="<c:url value= '#' />" class= 'ajex'>-></a> --%>
	</div>
	<table class= 'table_cal table-boardered table-hover'>
		<tr>
			<th title= 'sunday' class= 'col-md-1'>일</th>
			<th title= 'monday' class= 'col-md-1'>월</th>
			<th title= 'tuesday' class= 'col-md-1'>화</th>
			<th title= 'wendsday' class= 'col-md-1'>수</th>
			<th title= 'thurday' class= 'col-md-1'>목</th>
			<th title= 'friday' class= 'col-md-1'>금</th>
			<th title= 'saterday' class= 'col-md-1'>토</th>
		</tr>
		<c:forEach var="date" items="${date_list }" varStatus="idx">
			<c:if test="${idx.count% 7== 1 }"><tr></c:if>
			<td class= 'text_left' data-toggle="modal" data-target="#myModal">
				<c:if test="${idx.count% 7== 1 }"><span style="color: red"></c:if>
				<c:if test="${idx.count% 7== 0 }"><span style="color: blue;"></c:if>
				<input type="hidden" value="<fmt:formatDate value='${date }' pattern='yyyy'/>" />
				<input type="hidden" value="<fmt:formatDate value='${date }' pattern='M'/>" />
				<input type="hidden" value="<fmt:formatDate value='${date }' pattern='d'/>" />
				<c:if test="${today.date== date.date }"><span class="badge badge-danger"></c:if>
				<c:if test="${date.date!= 1 }">
					<fmt:formatDate value="${date }" pattern="d"/>
				</c:if>
				<c:if test="${date.date== 1 }">
					<fmt:formatDate value="${date }" pattern="M/d"/>
				</c:if>
				<c:if test="${today.date== date.date }"></span></c:if>
				<c:if test="${idx.count% 7== 1 }"></span></c:if>
				<c:if test="${idx.count% 7== 0 }"></span></c:if>
				<div style="background-color: green"><div class= 'cal_detail'></div></div>
			</td>
			<c:if test="${idx.count% 7== 0 }"></tr></c:if>
		</c:forEach>
	</table>
	
</div>