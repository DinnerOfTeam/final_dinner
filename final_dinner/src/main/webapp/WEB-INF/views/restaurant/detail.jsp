<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath }/css/res-detail.css" rel="stylesheet" type="text/css">
<style type="text/css">
	
</style>

<script type="text/javascript">
	$(function(){
		/* 모달 */
		var modalLayer = $("#modalLayer");
		var modalLink = $(".modalLink");
		var modalCont = $(".modalContent");
		var marginLeft = modalCont.outerWidth()/3;
		var marginTop = modalCont.outerHeight()/3; 

		modalLink.click(function(){
		  bgLayerOpen();
		  modalLayer.fadeIn("slow");
		  modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		  $(this).blur();
		  $(".modalContent").focus();
		  $("#bookNum").focus();
		  
		  return false;
		});

		function bgLayerOpen() {
		    if(!$('.bgLayer').length) {
		        $('<div class="bgLayer"></div>').appendTo($('body'));
		    }
		    var object = $(".bgLayer");
		    var w = $(document).width()+12;
		    var h = $(document).height();

		    object.css({'width':w,'height':h}); 
		    object.fadeIn(500); 
		}
		function bgLayerClear(){
		    var object = $('.bgLayer');
		   if(object.length) {
		       object.fadeOut(500, function() {
		            object.remove();
		      });
		    }
		}

		$('.closeModal').hover(function(){
		   $(this).css('opacity','0.3');
		},function(){
		   $(this).css('opacity','1');
		});
		
		//datepicker
		$('#s_bookDate').datepicker({
			dateFormat:'yy-mm-dd'
		});
		
		$(".cancelbw").click(function(){
			bgLayerClear();
			$("#modalLayer").hide();
		});
	});
</script>

<style type="text/css">
	/* 모달관련 css */
	.mask {
	   width: 100%;
	   height: 100%;
	   position: fixed;
	   left: 0;
	   top: 0;
	   z-index: 20;
	   background: #000;
	   opacity: .5;
	   filter: alpha(opacity = 50);
	}
	
	#modalLayer {
	   display: none;
	   position: absolute;
	   left: 50%;
	   top: 40%;
	}
	
	#modalLayer .modalContent {
	   width: 800px;
	   height:400px;
	   padding: 5px;
	   border: 1px solid #ccc;
	   position: absolute;
	   left: 50%;
	   top: 40%;
	   transform: translateX(-25%);
	   z-index: 20;
	   border-radius: 10px;
	   background: #FDFDFD;
	}
	
	#modalLayer .modalContent button {
	   position: absolute;
	   right: 0;
	   top: 0;
	   cursor: pointer;
	}
	
	.bgLayer {
	   display: none;
	   position: absolute;
	   top: 0;
	   left: 0;
	   width: 100%;
	   height: 100%;
	   background: #000;
	   opacity: .5;
	   filter: alpha(opacity = 50);
	   z-index: 10;
	}
	
	.carousel-inner > .item > img{
		width: 100%;
		min-width: 100%;
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
				<button class="modalLink site-btn site-btn-full">예약하기</button>
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
															alt="${photo.resPhotoTitle }"
															onerror="errImg(this)">
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

<div id="modalLayer">
     <div class="modalContent">
        <div style="padding:5px; margin:0 auto; width:95%; height:90%; position:relative;">
	        <div class="newsDetail" style="margin:0 auto; width:100%; height:95%;">
		          
				<!-- 모달로 띄워지는 예약 페이지 -->
				<div class="form-wrap">
					<div class="container" style="width: 750px;">
						<h2 class="eee">예약</h2>
						<div class="form-simple">
							 <form action="<c:url value='/book/restaurantBooking.do' />" method="post">
						
								<input type="hidden" name="resNo" value="${vo.resNo}">
								
								<div class="form-row">
									<div class="col-sm-4">
										<input type="text" class="form-text" name="bookNum" id="bookNum" placeholder="인원" required>
									</div>
									
									<div class="col-sm-4">
										<input type="text" class="form-text" name="bookTime" id="bookTime" placeholder="시간" required>
									</div>
									
									<div class="col-sm-4">
									<input type="text" class="form-text"  name="s_bookDate" id="s_bookDate" placeholder="예약날짜" required>
									</div>
								
								</div>
								
								<div class="form-comp-row" style="padding-left: 200px">
									<div class="col-sm-4">
										<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="예약">
									</div>
									<div class="col-sm-4">
										<input type="reset" name="cancel" class="site-btn site-btn-full cancelbw" value="취소">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../inc/footer.jsp"%>