<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<style type="text/css">
	
	#event_list tbody td{
		padding: 0.75em;
	}
	
	#event_list tbody td>img{
		width: 100%;
	}
		
	#eventDatePick > *{
		margin: 0 auto;
	}
	
	.event_date{
		font-size: 0.75em;
		margin: 0.5em 0 0 0;
		color: #777;
	}
	
	#event_list tr:hover .event_date{
		color: #FFF;
	}
	
	@media (max-width: 767px) {
	
		#event_list tbody tr{
			border-bottom: 1px solid lightgray;
		}
	
		#event_list td,
		#event_list th{
			padding: 0.5em;
			display: block;
			border: none;
			text-align: center;
		}
		
		#event_list td img{
			margin: 0 auto;
		}
	}
</style>
<script type="text/javascript">
	$(function(){
		
		function setDateField(dateText){
			var arrDate=dateText.split('-');
			$('#eventYear').text(arrDate[0]);
			$('#eventMonth').text(arrDate[1]);
			$('#eventDay').text(arrDate[2]);
			$('#eventDate').val(dateText);
		}
		
		function makeEventList(resource){
			
		}
		
		var $tableTr=$('<tr></tr>');
		var $tableTd=$('<td></td>');
		var $emptyTd=$tableTd.clone().attr({
				"class" : "table-tr-nodata",
				"colspan" : "2"
		});
		
		function loadEventData(currPage){
			var page=currPage || 1;
			var $eventList=$('#event_list>tbody');
			var $eventPaging=$('#event_paging > div');
			$eventList.empty();
			$eventPaging.empty();
			$trError=$tableTr.clone()
					.append($emptyTd.clone().text("오류가 발생했습니다"));
			$eventList.append($tableTr.clone()
					.append($emptyTd.clone().text("로딩중")));
			
			$.ajax({
				url: "<c:url value='/event/getEventList.do'/>",
				method: "post",
				data: { 
					"eventDate" : $("#eventDate").val() ,
					"page" : page ,
				},
				dataType: "json",
				success: function(res){
					console.log(res);
					
					$eventList.empty();
					
					if(res.status=="success"){
						if(res.list.length!=0){
							
							//현재날짜 구하기
							var nowDate=new Date();
							nowDate.setHours(0);
							nowDate.setMinutes(0);
							nowDate.setSeconds(0);
							nowDate.setMilliseconds(0);
							
							for(var i=0, len=res.list.length; i<len; i++){
								//데이터 구하기
								var oneEvent=res.list[i];
								var eventNo=oneEvent.eventNo;
								var eventTitle=oneEvent.eventTitle;
								var eventThumb="${pageContext.request.contextPath }"+
									(oneEvent.eventThumb? "/upfiles/upl_images/"+oneEvent.eventThumb : "/images/noThumb250x150.gif" );
								var eventStartDate=new Date(oneEvent.eventStartDate);
								var eventEndDate=new Date(oneEvent.eventEndDate);
								var eventIsEnd=(oneEvent.eventIsEnd=='Y') || (eventEndDate<nowDate);
								
								var eRow=$tableTr.clone();
								
								//날짜 문자열화
								var startDate=eventStartDate.getFullYear()
										+"-"+ (eventStartDate.getMonth()+1)
										+"-"+ eventStartDate.getDate();
								var endDate=eventEndDate.getFullYear()
										+"-"+ (eventEndDate.getMonth()+1)
										+"-"+ eventEndDate.getDate();
								
								//썸네일
								var eThumb=$tableTd.clone().append($("<img>").attr("src", eventThumb));
								
								//제목, 기간, 링크
								var eTitle=$tableTd.clone();
								eTitle.append($("<a>"+ eventTitle +"</a>")
										.attr("href", "<c:url value='/event/eventDetail.do?eventNo="+ eventNo +"'/>"));
								if(eventIsEnd){
									eTitle.append("<span class='label label-danger'>종료</span>");
								}else{
									eTitle.append("<span class='label label-primary'>진행중</span>");
								}
								eTitle.append("<p class='event_date'>"+ startDate +"~"+ endDate +"</p>");
								
								eRow.append(eThumb).append(eTitle);
								
								$eventList.append(eRow);
							}
						}else{
							$eventList.append($tableTr.clone()
									.append($emptyTd.clone().text("해당날짜에 진행중인 이벤트가 없습니다")));
						}
					}else{
						$eventList.append($trError);
					}
				},
				error: function(xhr, status, error){
					$eventList.append($trError);
				}
			});
		}
		
		var now=new Date();
		var nowText=now.getFullYear()+
			"-"+(now.getMonth()+1)+
			"-"+ now.getDate();
		
		
		setDateField(nowText);
		loadEventData(1);
		
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
		
		$('#eventDatePick').datepicker({
			inline: true,
			dateFormat: 'yy-mm-dd',
			onSelect:function(dateText, inst) {
				setDateField(dateText);
				loadEventData();
			}
		});
		
	});
</script>

<div class="site-top-title site-title-skyblue" >
	<div class="container">
		<h1>이벤트</h1>
	</div>
</div>

<div class="site-container-wrap">
	<div class="container">
		<div class="col-sm-5 col-sm-push-7 col-md-4 col-md-push-8">
		
			<div class="shadow-box">
				<div id="eventDatePick"></div>
			</div>
		</div>
		<div class="col-sm-7 col-sm-pull-5 col-md-8 col-md-pull-4">
			<div>
				<div class="shadow-box">
					<span id="eventYear"></span>년
					<span id="eventMonth"></span>월
					<span id="eventDay"></span>일
				</div>
				<input type="hidden" name="eventDate" id="eventDate">
			</div>
			<div>
				<div class="table-box">
					<table class="table-table table-hover" id="event_list">
						<colgroup>
							<col class="col-sm-3">
							<col class="col-sm-9">
						</colgroup>
						<tbody>
							
						</tbody>
					</table>
					<div class="table-comp" id="event_paging">
						<!-- 페이징(모바일) -->
						<div class="table-sub visible-xs">
							<ul class="pager">
								<li class="previous disabled">
									<a href="#">
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</a>
								</li>
								<li class="current">
									<span>1</span>
								</li>
								<li class="next">
									<a href="#">
										다음&nbsp;
										<i class="fa fa-angle-right"></i>
									</a>
								</li>
							</ul>
						</div>
						
						<!-- 페이징 -->
						<div class="table-sub col-xs-12 hidden-xs">
							<ul class="pagination">
								<li class="disabled">
									<a href="#" aria-label="First">
										<i class="fa fa-angle-double-left"></i>
									</a>
								</li>
								<li class="disabled">
									<a href="#" aria-label="Previous">
										<i class="fa fa-angle-left"></i>
									</a>
								</li>
								<li>
									<a href="#">
										1
									</a>
								</li>
								<li class="active">
									<a href="#">
										2
									</a>
								</li>
								<li class="disabled">
									<a href="#" aria-label="Next">
										<i class="fa fa-angle-right"></i>
									</a>
								</li>
								<li class="disabled">
									<a href="#" aria-label="Last">
										<i class="fa fa-angle-double-right"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/footer.jsp" %>