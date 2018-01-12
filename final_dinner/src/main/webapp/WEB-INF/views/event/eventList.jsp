<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery-ui.min.event.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/site-event.css">

<script type="text/javascript">
	$(function(){

		var $formEvent=$("form[name=eventForm]");
		var $eventDate=$("#eventDate");
		var $eventPaging=$("#event_paging");
		var $eventPage=$("#eventPaging");
		
		function setDateField(dateText){
			if(dateText==""){
				$("#eventSelectedDate").text("전체 검색결과");
			}else{
				var arrDate=dateText.split('-');
				$("#eventSelectedDate").text(arrDate[0] +"년 "+ arrDate[1] +"월 "+ arrDate[2] +"일");
			}
			$eventDate.val(dateText);
		}
		
		var $tableTr=$('<tr></tr>');
		var $tableTd=$('<td></td>');
		var $emptyTd=$tableTd.clone().attr({
				"class" : "table-tr-nodata",
				"colspan" : "2"
		});
		
		function loadEventData(){
			$("#eventTotal").text(0);
			var $eventList=$('#event_list>tbody');
			$eventList.empty();
			$trError=$tableTr.clone()
					.append($emptyTd.clone().text("오류가 발생했습니다"));
			$eventList.append($tableTr.clone()
					.append($emptyTd.clone().text("로딩중")));
			
			$.ajax({
				url: "<c:url value='/event/getEventList.do'/>",
				method: "post",
				data: $formEvent.serialize(),
				dataType: "json",
				success: function(res){
					
					$eventList.empty();
					$eventPaging.empty();
					
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
									(oneEvent.eventThumb? "/upfiles/upl_images/"+oneEvent.eventThumb : "/images/noImages.png" );
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
								var eThumb=$tableTd.clone()
									.append($('<div class="eventListImg"></div>')
												.append($("<img>").attr("src", eventThumb))
									);
								
								//제목, 기간, 링크
								var eTitle=$tableTd.clone();
								eTitle.append($("<a>"+ eventTitle +"</a>")
										.attr("href", "<c:url value='/event/eventDetail.do?eventNo="+ eventNo +"'/>"));
								if(eventIsEnd){
									eTitle.append("&nbsp;<span class='label label-danger'>종료</span>");
								}else{
									if(nowDate<eventStartDate){
										eTitle.append("&nbsp;<span class='label label-default'>준비중</span>");
									}else{
										eTitle.append("&nbsp;<span class='label label-primary'>진행중</span>");
									}
								}
								eTitle.append("<p class='event_date'>"+ startDate +"~"+ endDate +"</p>");
								
								eRow.append(eThumb).append(eTitle);
								
								$eventList.append(eRow);
							}
							
							//페이징
							var pageinfo=res.paging;
							
							var i_next=$('<i class="fa fa-angle-right"></i>');
							var i_prev=$('<i class="fa fa-angle-left"></i>');
							
							var btn=$('<li><a href="#"></a></li>');
							var btn_disabled=$('<li class="disabled"><span></span></li>');
							
							//모바일 페이징
							var m_pagerwrap=$('<div class="table-sub visible-xs"></div>');
							var m_pager=$('<ul class="pager"></ul>');
							
							//페이징
							var pagerwrap=$('<div class="table-sub col-xs-12 hidden-xs"></div>');
							var pager=$('<ul class="pagination"></ul>');
							
							var p_prev_m, p_first;
							if(pageinfo.currentPage<=1){
								p_prev_m=btn_disabled.clone();
								p_prev_m.find('span').text(" 이전").prepend(i_prev.clone());
								
								p_first=btn_disabled.clone();
								p_first.find('span').html('<i class="fa fa-angle-double-left"></i>');
							}else{
								p_prev_m=btn.clone();
								p_prev_m.find('a').data("page", pageinfo.currentPage-1).text(" 이전").prepend(i_prev.clone());
								
								p_first=btn.clone();
								p_first.find('a').data("page", 1).html('<i class="fa fa-angle-double-left"></i>');
							}
							
							m_pager.append(p_prev_m.addClass("previous"));
							pager.append(p_first);
							
							var p_prev;
							if(pageinfo.firstBlockPage<=1){
								p_prev=btn_disabled.clone();
								p_prev.find('span').html(i_prev.clone());
							}else{
								p_prev=btn.clone();
								p_prev.find('a').data("page", pageinfo.firstBlockPage-1).html(i_prev.clone());
							}
							
							pager.append(p_prev);
							
							m_pager.append('<li class="current"><span>'+ pageinfo.currentPage +'</span></li>');
							
							for(var i=pageinfo.firstBlockPage; i<=pageinfo.lastBlockPage; i++){
								var pageList;
								
								if(i==pageinfo.currentPage){
									pageList=btn_disabled.clone().attr("class", "active");
									pageList.find('span').text(i);
								}else{
									pageList=btn.clone();
									pageList.find('a').text(i).data("page", i);
								}
								pager.append(pageList);
								
							}
							
							var p_next;
							if(pageinfo.lastBlockPage>=pageinfo.totalPage){
								p_next=btn_disabled.clone();
								p_next.find('span').html(i_next.clone());
							}else{
								p_next=btn.clone();
								p_next.find('a').data("page", pageinfo.lastBlockPage+1).html(i_next.clone());
							}
							
							pager.append(p_next);
							
							var p_next_m, p_last;
							if(pageinfo.currentPage>=pageinfo.totalPage){
								p_next_m=btn_disabled.clone();
								p_next_m.find('span').text("다음 ").append(i_next.clone());
								
								p_last=btn_disabled.clone();
								p_last.find('span').html('<i class="fa fa-angle-double-right"></i>');
							}else{
								p_next_m=btn.clone();
								p_next_m.find('a').data("page", pageinfo.currentPage+1).text("다음 ").append(i_next.clone());
								
								p_last=btn.clone();
								p_last.find('a').data("page", pageinfo.lastBlockPage).html('<i class="fa fa-angle-double-right"></i>');
							}
							
							m_pager.append(p_next_m.addClass("next"));
							pager.append(p_last);
							
							$eventPaging
								.append(m_pagerwrap.append(m_pager))
								.append(pagerwrap.append(pager));
							

							$("#eventTotal").text(res.paging.totalRecord);
						}else{
							$eventList.append($tableTr.clone()
									.append($emptyTd.clone().text("해당날짜에 진행중인 이벤트가 없습니다")));
						}
					}else{
						$eventList.append($trError);
					}
				},
				error: function(xhr, status, error){
					$eventList.empty();
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
		
		$('#eventDatePick').datepicker({
			inline: true,
			changeYear : true,
			changeMonth : true,
			yearSuffix: '',
			dateFormat: 'yy-mm-dd',
			onSelect:function(dateText, inst) {
				setDateField(dateText);
				$eventPage.val(1);
				loadEventData();
			}
		});
		
		$(document).on("click", "#event_paging li>a", function(){
			event.preventDefault();
			$eventPage.val($(this).data("page"));
			loadEventData();
		});
		
		$(document).on("click", "a#event_select_all", function(){
			event.preventDefault();
			$('#eventDatePick').datepicker('setDate', null);
			$eventPage.val(1);
			setDateField("");
			loadEventData();
		});
		
	});
</script>

<div class="site-top-title site-title-skyblue" >
	<div class="container">
		<h1>이벤트</h1>
	</div>
</div>

<div class="site-content-wrap">
	<div class="container">
		<div class="col-sm-5 col-sm-push-7 col-md-4 col-md-push-8">
			<div class="shadow-box-fit">
				<a href='#' class="site-btn-submit site-btn-full" id="event_select_all">이벤트 모두 보기</a>
			</div>
			
			<div class="shadow-box">
				<div id="eventDatePick"></div>
			</div>
			
		</div>
		<div class="col-sm-7 col-sm-pull-5 col-md-8 col-md-pull-4">
			<div>
				<div class="shadow-box">
					<form name="eventForm"
							action="<c:url value='/event/getEventList.do'/>" method="post">
						<input type="hidden" name="eventDate" id="eventDate">
						<input type="hidden" name="page" id="eventPaging" value="1">
					</form>
					<span id="eventSelectedDate">0000년 00월 00일</span>
					(<span id="eventTotal"></span>건)
				</div>
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
								<li class="active">
									<a href="#">
										1
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