<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <link href="${pageContext.request.contextPath }/css/#.css" rel="stylesheet" type="text/css"> --%>
<style type="text/css">
	.res-head{
		padding: 2.5em;
		background-color: rgb(158, 22, 22);
		color: white;
	}
	
	.res-grade{
		display: inline-block;
		min-width: 7.5em;
	}
	
	.res-thumb-wrap{
		padding: 0.5em;
	}
	
	.res-thumb{
		position: relative;
		background-color: #777;
		overflow: hidden;
	}
	
	.res-thumb:before{
		content: "";
		display: block;
		padding-top: 100%;
	}
	
	.res-thumb > img{
		width: 100%;
		max-height: 100%;
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background-color: #555;
		margin: auto;
	}
	
	.res-info{
		margin: 1em 0;
	}
	
	.res-info ul.nav{
		margin: 0;
	}
	
	.res-info .nav > li{
		margin: 0 !important;	
	}
	
	.res-info .nav > li > a {
	    padding: 15px;
	    color: #000;
	    font-weight: bold;
	    border-radius: 0;
	}
	
	.res-info .nav > li > a:hover{
		background-color: #DDD;
	}
	
	.res-info .nav > li.active > a,
	.res-info .nav > li.active > a:hover,
	.res-info .nav > li.active > a:focus{
		background-color: rgb(158, 22, 22);
		color: #FFF;
	}
	
	.res-info .tab-content{
		padding: 0.75em;
	}
	
	.res-info .tab-content>div{
		min-height: 15em;
	}
	
	.res-info #carousel-res-photo .carousel-inner > div > img{
		width: 100%;
	}
	
	.res-info .panel-title > a{
		display: block;
	}
</style>

<div class="res-head">
	<div class="container">
		<div class="row">
			<div class="col-sm-3 res-thumb-wrap">
				<div class="res-thumb">
					<c:if test="${!empty vo.resThumbnail }">
						<img src="${pageContext.request.contextPath }/upfiles/upl_images/${vo.resThumbnail }">
					</c:if>
					<c:if test="${empty vo.resThumbnail }">
						<img src="${pageContext.request.contextPath }/images/noImages1x1.png">
					</c:if>
				</div>
			</div>
			
			<div class="col-sm-9">
				<h1>${vo.resName }</h1>
				<p>평점 : 
					<c:set var="gradeB" value="${vo.resGrade%1 }"/>
					<c:set var="gradeA" value="${vo.resGrade-gradeB}"/>
					<span class="res-grade">
						<c:forEach begin="1" end="${gradeA }">
							<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						<c:if test="${gradeB>0 }">
							<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
						</c:if>
					</span>
					${vo.resGrade }/5
				</p>
				<p>장소 : ${vo.resAddress } ${vo.resAddressDetail }</p>
				<p>영업일 : ${vo.resWorkDay }</p>
				<p>‎영업시간 : ${vo.resWorkHour }</p>
				<p>‎연락처 :
					${vo.resContact1 } -
					${vo.resContact2 } -
					${vo.resContact3 }
				</p>
				<p>‎최대 인원수 : ${vo.resMaxPerson }명</p>
				
			</div>
			
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<a href="<c:url value='/book/restaurantBooking.do'/>" class="site-btn site-btn-full">
					예약하기
				</a>
			</div>
		</div>
	</div>
</div>

<div class="res-info">
	<div class="container">
		<div class="shadow-box-fit">
			<div role="tabpanel">
				
				<!-- Nav tabs -->
				<ul class="nav nav-pills" role="tablist">
					<li role="presentation" class="active"><a href="#res-intro" aria-controls="home" role="tab" data-toggle="tab">소개</a></li>
					<li role="presentation"><a href="#res-photo" aria-controls="profile" role="tab" data-toggle="tab">사진</a></li>
					<li role="presentation"><a href="#res-menu" aria-controls="profile" role="tab" data-toggle="tab">메뉴</a></li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="res-intro">
						<div>
							${vo.resIntroduce }
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="res-photo">
						<div>
							<c:if test="${!empty photoList }">
								<div class="row">
									<div class="col-md-9 col-xs-6">
										<div id="carousel-res-photo" class="carousel slide" data-ride="carousel">
											<!-- Indicators -->
											<ol class="carousel-indicators">
												<c:forEach var="i" begin="0" end="${fn:length(photoList)-1 }">
													<li data-target="#carousel-res-photo" data-slide-to="${i }"
													<c:if test="${i==0 }">
														class="active"
													</c:if>
													></li>
												</c:forEach>
											</ol>
											
											<!-- Wrapper for slides -->
											<div class="carousel-inner" role="listbox">
												<c:forEach var="photo" items="${photoList }" varStatus="photoStatus">
													<c:set var="itemAct" value="${photoStatus.index==0? ' active' : '' } "/>
													<div class="item${itemAct }">
														<img src="${pageContext.request.contextPath }/upfiles/upl_images/${photo.resPhotoName}"
															alt="${photo.resPhotoTitle }">
													</div>
												</c:forEach>
											</div>
										
											<!-- Controls -->
											<a class="left carousel-control" href="#carousel-res-photo" role="button" data-slide="prev">
												<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a>
											<a class="right carousel-control" href="#carousel-res-photo" role="button" data-slide="next">
												<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${empty photoList }">
								<p>등록된 사진이 없습니다</p>
							</c:if>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="res-menu">
						<c:if test="${!empty menuList }">
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<c:forEach var="menu" items="${menuList }">
									<c:set var="menuVar" value="${menu.foodMenuVO }"/>
									<c:set var="itemVar" value="${menu.foodItemList }"/>
									
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="menu${menuVar.foodMenuNo }">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion" href="#item${menuVar.foodMenuNo }"
														aria-controls="item${menuVar.foodMenuNo }">
													${menuVar.foodMenuName }
												</a>
											</h4>
										</div>
										<div id="item${menuVar.foodMenuNo }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="menu${menuVar.foodMenuNo }">
											<div class="panel-body">
												<p>${menuVar.foodMenuDesc }</p>
												<hr>
												<ul>
													<c:forEach var="menuItem" items="${itemVar }">
														<li>
															<h5>${menuItem.foodItemName } - ₩
																<fmt:formatNumber value="${menuItem.foodItemPrice }" pattern="#,###"/>
															</h5>
															<p>${menuItem.foodItemDesc }</p>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty menuList }">
							<p>등록된 메뉴가 없습니다</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/footer.jsp"%>