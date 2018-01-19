<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate var="nowDate" value="${today}" type="Date" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="startDate" value="${eVO.eventStartDate}" type="Date" pattern="yyyy-MM-dd"/>
<fmt:formatDate var="endDate" value="${eVO.eventEndDate}" type="Date" pattern="yyyy-MM-dd"/>
<c:if test="${param.mode!='admin' }">
	<%@include file="../inc/top.jsp" %>
</c:if>

<c:if test="${param.mode=='admin' }">
<!DOCTYPE html>
<html>
<head>
<title></title>
<!-- bootstrap-css -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!-- //font -->
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/codestyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/site-event.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.event-set-end').click(function(){
			var src=$(this).attr('href');
			var trigger=src.substr(-1);
			var msg="";
			if(trigger=='Y'){
				msg='선택한 이벤트를 종료하시겠습니까?';
			}else if(trigger=='N'){
				msg='선택한 이벤트의 종료를 취소하고 다시 진행하겠습니까?';
			}else{
				return;
			}
			
			return confirm(msg);
		});
		
		$('.event-set-approve').click(function(){
			return confirm("선택한 이벤트를 승인하시겠습니까?");
		});
		
		$('.event-set-del').click(function(){
			return confirm("선택한 이벤트를 삭제하시겠습니까?");
		});
	});
	
	
</script>
</head>
<body>
</c:if>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/site-event.css">

<c:if test="${param.mode!='admin' }">
<div class="site-top-title site-title-skyblue" >
	<div class="container">
		<h1>이벤트</h1>
	</div>
</div>
</c:if>

<div class="site-content-wrap">
	<div class="container">
		<div class="shadow-box">
			<div class="row">
				<div class="col-sm-3">
					<div class="eventListImg">
						<c:if test="${empty eVO.eventThumb }">
							<img src="${pageContext.request.contextPath }/images/noImages.png">
						</c:if>
						<c:if test="${!empty eVO.eventThumb }">
							<img src="${pageContext.request.contextPath }/upfiles/upl_images/${eVO.eventThumb }">
						</c:if>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="event-info-wrap">
						<h2 class="event-detail-title">${eVO.eventTitle }</h2>
						
						<p class="event_info">
							기간: ${startDate } ~ ${endDate }
							&nbsp;
							<c:if test="${eVO.eventApprove=='Y' }">
								<c:choose>
									<c:when test="${eVO.eventIsEnd=='Y' || endDate<nowDate }">
										<span class="label label-danger">종료</span>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${startDate>nowDate }">
												<span class='label label-default'>준비중</span>
											</c:when>
											<c:otherwise>
												<span class="label label-primary">진행중</span>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${eVO.eventApprove=='N' }">
								<span class="label label-default">승인 대기중</span>
							</c:if>
						</p>
						
						<c:if test="${eVO.resNo!=0 }">
							<p class="event_info">업체명 : ${rVO.resName }</p>
							<p class="event_info">주소 : ${rVO.resAddress }</p>
							<p class="event_info">영업일 : ${rVO.resAddress } ${rVO.resWorkDay }</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<div class="shadow-box">
			<div class="event-detail-content">
				${eVO.eventContent }
			</div>
		</div>
		
		<c:url var="goEventList" value="/event/eventList.do"/>
		
		<c:if test="${param.mode=='member' }">
			<c:url var="goEventList" value="/member/event/eventList.do"/>
		</c:if>
		<c:if test="${param.mode=='admin' }">
			<c:url var="goEventList" value="/admin/event/eventList.do"/>
		</c:if>
		
		<div class="event-detail-btn">
			<c:if test="${param.mode=='admin' || param.mode=='member' }">
				<script type="text/javascript">
					$(function(){
						$('.event-set-end').click(function(){
							var src=$(this).attr('href');
							var trigger=src.substr(-1);
							var msg="";
							if(trigger=='Y'){
								msg='선택한 이벤트를 종료하시겠습니까?';
							}else if(trigger=='N'){
								msg='선택한 이벤트의 종료를 취소하고 다시 진행하겠습니까?';
							}else{
								return;
							}
							
							return confirm(msg);
						});
					});
				</script>
				
				<c:if test="${eventVO.eventEndDate>=nowDate && eventVO.eventIsEnd=='N' }">
					<a href="<c:url value='/admin/event/eventEndSet.do?eventNo=${eventVO.eventNo }&eventIsEnd=Y'/>"
							class="site-btn event-set-end">이벤트 종료</a>
				</c:if>
				<c:if test="${eventVO.eventEndDate>=nowDate && eventVO.eventIsEnd=='Y' }">
					<a href="<c:url value='/admin/event/eventEndSet.do?eventNo=${eventVO.eventNo }&eventIsEnd=N'/>"
							class="site-btn event-set-end">종료 취소</a>
				</c:if>
			</c:if>
			
			<c:if test="${param.mode=='admin' }">
				<script type="text/javascript">
						$('.event-set-approve').click(function(){
							return confirm("선택한 이벤트를 승인하시겠습니까?");
						});
						
						$('.event-set-del').click(function(){
							return confirm("선택한 이벤트를 삭제하시겠습니까?");
						});
					});
				</script>
				<c:if test="${eVO.eventApprove=='N' }">
					<a href="<c:url value='/admin/event/eventApprove.do?eventNo=${eventVO.eventNo }'/>"
							class="site-btn event-set-approve">이벤트 승인</a>
				</c:if>
				<a href="<c:url value='/admin/event/eventDelete.do?eventNo=${eventVO.eventNo }'/>"
						class="site-btn event-set-del">이벤트 삭제</a>
			</c:if>
			
			<a href="${goEventList }" class="site-btn-submit">목록</a>
		</div>
		
	</div>
</div>

<c:if test="${param.mode!='admin' }">
	<%@include file="../inc/footer.jsp" %>
</c:if>

<c:if test="${param.mode=='admin' }">
	</body>

</html>
</c:if>