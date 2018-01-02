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
			var sidoVal=$('#search-select-sido > option:selected');
			var sidoData=sidoVal.data("sido");
			sidoVal=sidoVal.val();
			
			if(sidoVal>0){
				var $row=$('<div></div>').attr('class', 'row');
				var $sigungu=$('<div></div>').attr('class', 'col-xs-6 col-sm-3 col-md-2');
				var $sigunguAnchor=$('<a href="#"></a>');
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
					createSigunguList(sidoData ,sigunguCache[sidoData]);
				}else{
					$.ajax({
						url: '<c:url value="/addr/getSigungu.do"/>',
						data: 'sidoNo='+sidoVal,
						dataType: 'json',
						success: function(res){
							createSigunguList(sidoData ,res);
							
							sigunguCache[sidoData]=res;
						},
						error:function(xhr, status, msg){
							$siList.html("<p>에러가 발생했습니다</p>");
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
	});
</script>

<link href="css/site-search.css" rel="stylesheet" type="text/css" media="all" />

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
								<option value="${sido.sidoNo }"
									data-sido="${sido.sidoName }">
									${sido.sidoName }
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="search-tab-content" id="search-list-sigungu"></div>
					
					<%-- <div class="search-tab-content tab-content">
						<c:forEach var="addr" items="${addrList }">
							<div class="tab-pane fade active in" id="sido-no-${addr.sidoVO.sidoNo }">
								<div class="row">
									<c:forEach var="sigungu" items="${addr.sigunguList }">
										<div class="col-xs-6 col-sm-3 col-md-2">
											<a href="#" data-loc="${sigungu.sigunguName }">${sigungu.sigunguName }</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div> --%>
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
										<div class="restaurant-search-img col-xs-4 col-sm-12">
											<c:if test="${empty resItem.resThumbnail }">
												<img src="${pageContext.request.contextPath }/images/noImages1x1.png"/>
											</c:if>
											<c:if test="${!empty resItem.resThumbnail }">
												<img src="${pageContext.request.contextPath }/upfiles/upl_images/${resItem.resThumbnail}"/>
											</c:if>
										</div>
										<div class="restaurant-search-desc col-xs-8 col-sm-12">
											<h2>${resItem.resName }</h2>
											<h4>평점 : ${resItem.resGrade }/5</h4><%-- 별점표시로 변경예정 --%>
											<p>영업일 : ${resItem.resWorkDay }</p>
										</div>
										<div class="restaurant-search-overlay">
											<div class="restaurant-overlay-btn">
												<div class="col-md-6">
													<a href="#" class="site-btn-submit site-btn-full">예약</a>
												</div>
												<div class="col-md-6">
													<a href="#" class="site-btn site-btn-full">상세보기</a>
												</div>
											</div>
										</div>
									</div>
								<!-- </a> -->
							</div>
						</c:forEach>
					</c:if>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- //search -->







<%@include file="inc/footer.jsp" %>