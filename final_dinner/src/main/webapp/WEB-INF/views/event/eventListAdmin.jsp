<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


<c:url var="listURL" value='/admin/event/eventList.do'></c:url>
<jsp:useBean id="nowDate" class="java.util.Date"/>

<div class="site-content-wrap">
	<div class="container">
		<div class="table-box">
			<table class="table-table table-hover" id="event_list">
				<colgroup>
					<col class="col-sm-3">
					<col class="col-sm-6">
					<col class="col-sm-3">
				</colgroup>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="3" class="table-tr-nodata">
								이벤트가 없습니다.
							</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="eventVO" items="${list }">
							<tr>
								<td>
									<div class="eventListImg">
										<c:if test="${empty eventVO.eventThumb }">
											<img src="${pageContext.request.contextPath }/images/noImages.png">
										</c:if>
										<c:if test="${!empty eventVO.eventThumb }">
											<img src="${pageContext.request.contextPath }/upfiles/upl_images/${eventVO.eventThumb }">
										</c:if>
									</div>
								</td>
								<td>
									<a href="<c:url value='/event/eventDetail.do?mode=admin&eventNo=${eventVO.eventNo }'/>">
										${eventVO.eventTitle }
									</a>
									&nbsp;
									<c:if test="${eventVO.eventApprove=='Y' }">
										<c:choose>
											<c:when test="${eventVO.eventIsEnd=='Y' || eventVO.eventEndDate<nowDate }">
												<span class="label label-danger">종료</span>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${nowDate<eventVO.eventStartDate }">
														<span class='label label-default'>준비중</span>
													</c:when>
													<c:otherwise>
														<span class="label label-primary">진행중</span>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${eventVO.eventApprove=='N' }">
										<span class="label label-default">승인 대기중</span>
									</c:if>
									
									<p class="event_date">
										<fmt:formatDate value="${eventVO.eventStartDate }" pattern="yyyy-MM-dd"/>
										~
										<fmt:formatDate value="${eventVO.eventEndDate }" pattern="yyyy-MM-dd"/>
									</p>
								</td>
								<td>
									<c:if test="${eventVO.eventApprove=='N' }">
										<p>
											<a href="<c:url value='/admin/event/eventApprove.do?eventNo=${eventVO.eventNo }'/>"
													class="site-btn site-btn-full event-set-approve">이벤트 승인</a>
										</p>
									</c:if>
									<p>
										<c:if test="${eventVO.eventEndDate>=nowDate && eventVO.eventIsEnd=='N' }">
											<a href="<c:url value='/admin/event/eventEndSet.do?eventNo=${eventVO.eventNo }&eventIsEnd=Y'/>"
													class="site-btn site-btn-full event-set-end">이벤트 종료</a>
										</c:if>
										<c:if test="${eventVO.eventEndDate>=nowDate && eventVO.eventIsEnd=='Y' }">
											<a href="<c:url value='/admin/event/eventEndSet.do?eventNo=${eventVO.eventNo }&eventIsEnd=N'/>"
													class="site-btn site-btn-full event-set-end">종료 취소</a>
										</c:if>
									</p>
									<p>
										<a href="<c:url value='/admin/event/eventDelete.do?eventNo=${eventVO.eventNo }'/>"
												class="site-btn site-btn-full event-set-del">이벤트 삭제</a>
									</p>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
				</tbody>
			</table>
			<div class="table-comp" id="event_paging">
				<!-- 페이징(모바일) -->
				<div class="visible-xs">
					<ul class="pager">
						<c:choose>
							<c:when test="${paging.currentPage<=1 }">
								<li class="previous disabled">
									<span>
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="previous">
									<a href="${listURL}?currentPage=${paging.currentPage-1}">
										<i class="fa fa-angle-left"></i>&nbsp;
										이전
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						<li class="current">
							<span>${paging.currentPage }</span>
						</li>
						<c:choose>
							<c:when test="${paging.currentPage>=paging.totalPage }">
								<li class="next disabled">
									<span>
										다음&nbsp;
										<i class="fa fa-angle-right"></i>
									</span>
								</li>
							</c:when>
							<c:otherwise>
								<li class="next">
									<a href="${listURL}?currentPage=${paging.currentPage+1}">
										다음&nbsp;
										<i class="fa fa-angle-right"></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			
				<!-- 페이징 -->
				<c:if test="${!empty list }">
					<div class="board-list-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<c:choose>
								<c:when test="${paging.currentPage>1 }">
									<li>
										<a href="${listURL}?currentPage=1" aria-label="First">
											<i class="fa fa-angle-double-left"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="First">
											<i class="fa fa-angle-double-left"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${paging.firstBlockPage>1 }">
									<li>
										<a href="${listURL}?currentPage=${paging.firstBlockPage-1}" aria-label="Previous">
											<i class="fa fa-angle-left"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Previous">
											<i class="fa fa-angle-left"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${paging.firstBlockPage}" end="${paging.lastBlockPage}">
								<c:choose>
									<c:when test="${i==paging.currentPage }">
										<li class="active">
											<span>
												${i}
											</span>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${listURL}?currentPage=${i}">
												${i}
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${paging.lastBlockPage<paging.totalPage }">
									<li>
										<a href="${listURL}?currentPage=${paging.lastBlockPage+1}" aria-label="Next">
											<i class="fa fa-angle-right"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Next">
											<i class="fa fa-angle-right"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${paging.currentPage<paging.totalPage }">
									<li>
										<a href="${listURL}?currentPage=${paging.totalPage}" aria-label="Last">
											<i class="fa fa-angle-double-right"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="disabled">
										<span aria-label="Last">
											<i class="fa fa-angle-double-right"></i>
										</span>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

</body>
</html>