<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>

<script type="text/javascript">

	$(function(){
		var arrLoc=[];
		
		var $searchLocLabel=$("<span class='label label-primary food-search-loc-label'></span>");
		var $searchLocDel=$("<button type='button' class='close food-search-loc-del' aria-label='delete'><span aria-hidden='true'>×</span></button>");
		
		function getLocLabel(value){
			return $searchLocLabel.clone().text(value).append($searchLocDel.clone());
		}
		
		function reDrawLocation(){
			var local_arrLoc=arrLoc, local_getLocLabel=getLocLabel;
			
			var	hidden_loc_var=local_arrLoc.join(",");
			$("#search_hidden_loc").val(hidden_loc_var);
			
			$("#search-location-view").empty();
			
			for(var i=0, len=local_arrLoc.length; i<len; i++){
				var locVal=local_arrLoc[i];
				$locLabel=local_getLocLabel(locVal);
				
				$("#search-location-view").append($locLabel);
			}
			
		}
		
		$(document).on("click", "#search-location-view > .food-search-loc-label > .food-search-loc-del", function(){
			var idx=$(this).parent().index()
			arrLoc.splice(idx, 1);
			
			reDrawLocation();
		});
		
		$(document).on("click", "#form_location_clear", function(){
			arrLoc=[];
			
			reDrawLocation();
		});
		
		$(document).on("click", ".search-tab-content .row > div > a", function(){
			event.preventDefault();
			
			var locationValue=$(this).data("sido") +"-"+ $(this).data("loc");
			arrLoc.push(locationValue);
			
			reDrawLocation();
		});
		
		$("form[name=searchFrm]").submit(function(){
			reDrawLocation();
		});
		
		var sigunguCache=new Array();
		
		$('#search-select-sido').change(function(){
			var sidoSel=$('#search-select-sido > option:selected');
			var sidoVal=sidoSel.val();
			var sidoLoc=$.trim(sidoSel.text());
			var sidoData="sido_" + sidoVal;
			
			if(sidoVal>0){
				var $row=$('<div/>', {'class' : "row"});
				var $sigungu=$('<div/>', {'class' : 'col-xs-6 col-sm-3 col-md-2'});
				var $sigunguAnchor=$('<a/>', {'href' : "#"});
				var $siList=$('#search-list-sigungu');
				
				function createSigunguList(data , res){
					var $rowClone=$row.clone();
					
					for(var i=0, len=res.length; i<len; i++){
						var resSigungu=res[i];
						$rowClone.append(
							$sigungu.clone().html(
								$sigunguAnchor.clone()
									.text(resSigungu.sigunguName)
									.data('loc', resSigungu.sigunguName)
									.data('sido', data)
							)
						);
					}
					
					if(res.length>0){
						$siList.html($rowClone);
					}
					
				}
				
				if(sidoData in sigunguCache){
					createSigunguList(sidoLoc ,sigunguCache[sidoData]);
				}else{
					$.ajax({
						url: '<c:url value="/addr/getSigungu.do"/>',
						data: 'sidoNo='+sidoVal,
						dataType: 'json',
						success: function(res){
							if(res.length>0){
								createSigunguList(sidoLoc, res);
							
								sigunguCache[sidoData]=res;
							}
						},
						error:function(xhr, status, msg){
							$siList.html($("<p/>", {'text' : '에러가 발생했습니다'}));
						}
					});
				}
				
			}
		});
		

		var locationValue=$("#search_hidden_loc").val();
		if(locationValue!=""){
			arrLoc=locationValue.split(",");
		}
		reDrawLocation();
		
		
		/*모달  */
		var modalLayer = $("#modalLayer");
		var modalLink = $(".modalLink");
		var modalCont = $(".modalContent");
		var marginLeft = modalCont.outerWidth()/3;
		var marginTop = modalCont.outerHeight()/3; 

		modalLink.click(function(){
		   var resNo = $(this).prev("input[type=hidden]").val();
		   $(".modalContent").find("input[name=resNo]").val(resNo);
		   
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
			dateFormat:'yy-mm-dd',
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
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
</style>

<link href="css/site-search.css" rel="stylesheet" type="text/css" media="all" />
	
	<c:url var="listURL" value='/search.do'>-
		<c:param name="location" value="${param.location }"></c:param>
		<c:param name="keyword" value="${param.keyword }"></c:param>
	</c:url>

	<div class="site-top-title site-title-default" >
		<div class="container">
			<h1>통합 검색</h1>
		</div>
	</div>
	
	<!-- search-->
	<div class="search">
		<div class="container">
			<div class="shadow-box-fit wow fadeIn animated" data-wow-delay=".5s">
				<c:if test="${empty sidoList }">
					<p>현재 지역 검색을 이용할 수 없습니다.</p>
				</c:if>
				<c:if test="${!empty sidoList }">
					<%-- <ul class="nav nav-pills search-tabs">
						<c:forEach var="addr" items="${addrList }">
							<li><a href="#sido-no-${addr.sidoVO.sidoNo }" data-toggle="tab">${addr.sidoVO.sidoName }</a></li>
						</c:forEach>
					</ul> --%>
					<div class="form-simple">
						<select class="form-select" id="search-select-sido">
							<option value="0">시/도 선택</option>
							<c:forEach var="sido" items="${sidoList }">
								<option value="${sido.sidoNo }">
									${sido.sidoName }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="search-tab-content" id="search-list-sigungu"></div>
				</c:if>
				
			</div>
			
			<div class="shadow-box wow fadeIn animated" data-wow-delay=".5s">
				<div class="form-simple">
					<form action="<c:url value='/search.do'/>" method="get" name="searchFrm" id="search-food">
					
						<div class="form-comp">
							<span class="form-static">
								<span class="form-txt">지역</span>
								<button type="button" class="btn btn-danger btn-xs" id="form_location_clear">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									모두 지우기
								</button>
							</span>
							<span id="search-location-view" class="form-static"></span>
						</div>
						
						<input type="hidden" name="location" id="search_hidden_loc" value="${param.location }">
						<input type="text" class="form-text" name="keyword" placeholder="식당명" value="${param.keyword }">
						<input type="submit" class="site-btn-submit site-btn-full" value="검색">
					</form>
				</div>
			</div>
		</div>
		<div class="food-search-result wow fadeIn animated" data-wow-delay=".5s">
			<div class="container">
				<div class="row">
				
					<c:if test="${empty list }">
						<div class="shadow-box ali-center">
							<p>검색결과가 없습니다</p>
						</div>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="resItem" items="${list }">
							<div class="restaurant-search-result col-xs-12 col-sm-4">
								<!-- <a href="#"> -->
									<div class="restaurant-search-inner">
										<div class="col-xs-4 col-sm-12">
											<div class="restaurant-search-img">
												<c:if test="${empty resItem.resThumbnail }">
													<img src="${pageContext.request.contextPath }/images/noImages1x1.png"/>
												</c:if>
												<c:if test="${!empty resItem.resThumbnail }">
													<img src="${pageContext.request.contextPath }/upfiles/upl_images/${resItem.resThumbnail}"/>
												</c:if>
											</div>
										</div>
										<div class="restaurant-search-desc col-xs-8 col-sm-12">
											<h2>${resItem.resName }</h2>
											<h4>
												평점 : 
												<c:set var="gradeB" value="${resItem.resGrade%1 }"/>
												<c:set var="gradeA" value="${resItem.resGrade-gradeB}"/>
												<span class="res-grade">
													<c:forEach begin="1" end="${gradeA }">
														<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
													</c:forEach>
													<c:if test="${gradeB>0 }">
														<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
													</c:if>
												</span>
												<span>${resItem.resGrade }/5</span>
											</h4>
											<p>영업일 : ${resItem.resWorkDay }</p>
										</div>
										<div class="restaurant-search-overlay">
											<div class="restaurant-overlay-btn">
												<div class="col-md-6">
													<%-- <a href="${pageContext.request.contextPath }/book/restaurantBooking.do?resNo=${resItem.resNo}" class="site-btn-submit site-btn-full">예약</a> --%>
													<input type="hidden" value="${resItem.resNo }">	
													<button class="modalLink site-btn-submit site-btn-full">예약</button>
												</div>
												<div class="col-md-6">
													<a href='<c:url value="/restaurant/detail.do?resNo=${resItem.resNo }"/>' class="site-btn site-btn-full">상세보기</a>
												</div>
											</div>
										</div>
									</div>
								<!-- </a> -->
							</div>
						</c:forEach>
					</c:if>
					
					
				</div>
				
				<div>
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
										<a href="${listURL}&currentPage=${paging.currentPage-1}">
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
										<a href="${listURL}&currentPage=${paging.currentPage+1}">
											다음&nbsp;
											<i class="fa fa-angle-right"></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					
					<!-- 페이징 -->
					<c:if test="${!empty sidoList }">
						<div class="board-list-sub col-xs-12 hidden-xs">
							<ul class="pagination">
								<c:choose>
									<c:when test="${paging.currentPage>1 }">
										<li>
											<a href="${listURL}&currentPage=1" aria-label="First">
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
											<a href="${listURL}&currentPage=${paging.firstBlockPage-1}" aria-label="Previous">
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
												<a href="${listURL}&currentPage=${i}">
													${i}
												</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${paging.lastBlockPage<paging.totalPage }">
										<li>
											<a href="${listURL}&currentPage=${paging.lastBlockPage+1}" aria-label="Next">
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
											<a href="${listURL}&currentPage=${paging.totalPage}" aria-label="Last">
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
	<!-- //search -->
	
	
	<!-- 모달-->
	<div id="modalLayer">
     <div class="modalContent">
        <div style="padding:5px; margin:0 auto; width:95%; height:90%; position:relative;">
        <div class="newsDetail" style="margin:0 auto; width:100%; height:95%;">
          <!-- 컨텐츠 부분-->
          
          <!-- 모달로 띄워지는 예약 페이지 -->
	
	<div class="form-wrap">
		<div class="container" style="width: 750px;">
			<h2 class="eee">예약	</h2>
			<div class="form-simple">
				 <form action="<c:url value='/book/restaurantBooking.do' />" method="post">
			
					<input type="hidden" name="resNo" >
					
					<div class="form-row">
						<div class="col-sm-4">
							<input type="text" class="form-text" name="bookNum" id="bookNum" placeholder="인원" required="">
						</div>
						
						<div class="col-sm-4">
							<input type="text" class="form-text" name="bookTime" id="bookTime" placeholder="시간" required="">
						</div>
						
						<div class="col-sm-4">
						<input type="text" class="form-text"  name="s_bookDate" id="s_bookDate" placeholder="예약날짜" required="" >
						</div>
					
					</div>
				<!-- 	<div class="form-row">
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="이름">
						</div>
					</div>
					<div class="form-row">
					<p class="bbb">연락처</p>
						<div class="col-xs-3">
							<select class="form-select">
								<option>010</option>
								<option>011</option>
								<option>012</option>
								<option>016</option>
								<option>019</option>
							</select>
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
					</div> 
					
					
					<textarea placeholder="요청사항을 적어주세요" class="form-text" required=""></textarea> -->
					
					<div class="form-comp-row" style="padding-left: 200px">
						<div class="col-sm-4">
							<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="예약">
						</div>
						<div class="col-sm-4">
							<input type="reset" name="cancel" class="site-btn site-btn-full cancelbw" value="취소">
						</div>
					</div>

					
					<div class="signup-text">
						<a href="login.html">Already have an account? Login here.</a>
					</div>
				</form>
			</div>
		</div>
	</div>
        </div>
        </div>
     </div>
   </div>







<%@include file="inc/footer.jsp" %>