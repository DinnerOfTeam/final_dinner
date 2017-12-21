<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>

<script type="text/javascript">

	$(function(){
		var arrLoc=[];
		
		function getLocLabel(idx, value){
			return $("<span class='label label-info food-search-loc-label' data-loc-idx='"+ idx +"'>"
					+ value +
					"<button type='button' class='close food-search-loc-del' aria-label='delete'>"
					+"<span aria-hidden='true'>×</span></button></span>");
		}
		
		function reDrawLocation(){
			var local_arrLoc=arrLoc, local_getLocLabel=getLocLabel;
			
			var	hidden_loc_var=local_arrLoc.join(",");
			$("#search_hidden_loc").val(hidden_loc_var);
			
			$("#search-location-view").empty();
			
			for(var i=0, len=local_arrLoc.length; i<len; i++){
				var locVal=local_arrLoc[i];
				$locLabel=local_getLocLabel(i, locVal);
				
				$("#search-location-view").append($locLabel);
			}
			
		}
		
		$(document).on("click", ".food-search-loc-label > .food-search-loc-del", function(){
			var idx=$(this).parent().data("loc-idx");
			arrLoc.splice(idx, 1);
			
			reDrawLocation();
		});
		
		$(document).on("click", "#form_location_clear", function(){
			arrLoc=[];
			
			reDrawLocation();
		});
		
		$(document).on("click", ".search-tab-content .row > div > a", function(){
			event.preventDefault();
			
			var locationValue=$(this).data("loc");
			arrLoc.push(locationValue);
			
			reDrawLocation();
		});
		
		$("form[name=searchFrm]").submit(function(){
			reDrawLocation();
			
		});
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
				<ul class="nav nav-pills search-tabs">
					<li class="active"><a href="#seoul" data-toggle="tab">서울</a></li>
					<li class=""><a href="#incheon" data-toggle="tab">인천</a></li>
					<li class=""><a href="#gyeonggi" data-toggle="tab">경기</a></li>
				</ul>
				<div class="search-tab-content tab-content">
					<div class="tab-pane fade active in" id="seoul">
						<div class="row">
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="구로">구로</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="금천">금천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강남">강남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="여의도">여의도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="용산">용산</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="구로">구로</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="금천">금천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강남">강남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="여의도">여의도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="용산">용산</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="구로">구로</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="금천">금천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강남">강남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="여의도">여의도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="용산">용산</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="구로">구로</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="금천">금천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강남">강남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="여의도">여의도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="용산">용산</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="구로">구로</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="금천">금천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강남">강남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="여의도">여의도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="용산">용산</a>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="incheon">
						<div class="row">
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부평구">부평구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="남동구">남동구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="서구">서구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="연수구">연수구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강화도">강화도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부평구">부평구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="남동구">남동구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="서구">서구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="연수구">연수구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강화도">강화도</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부평구">부평구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="남동구">남동구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="서구">서구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="연수구">연수구</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="강화도">강화도</a>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="gyeonggi">
						<div class="row">
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부천">부천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="시흥">시흥</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="성남">성남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="고양">고양</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="의정부">의정부</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부천">부천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="시흥">시흥</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="성남">성남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="고양">고양</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="의정부">의정부</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="부천">부천</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="시흥">시흥</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="성남">성남</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="고양">고양</a>
							</div>
							<div class="col-xs-6 col-sm-3 col-md-2">
								<a href="#" data-loc="의정부">의정부</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="shadow-box wow fadeIn animated" data-wow-delay=".5s">
				<div class="form-simple">
					<form action="#" method="post" name="searchFrm">
					
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
					
						<input type="hidden" name="location" id="search_hidden_loc">
						<input type="text" class="form-text" name="email" placeholder="식당명">
						<input type="text" class="form-text" name="email" placeholder="인원">
						
						<input type="submit" class="site-btn-submit site-btn-full" value="검색">
					</form>
				</div>
			</div>
		</div>
		<div class="food-search-result wow fadeIn animated" data-wow-delay=".5s">
			<div class="container">
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당1 이름</h2>
								<h4>평점 : 3.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당2 이름</h2>
								<h4>평점 : 2.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당3 이름</h2>
								<h4>평점 : 5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당4 이름</h2>
								<h4>평점 : 1.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당5 이름</h2>
								<h4>평점 : 2.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당6 이름</h2>
								<h4>평점 : 3.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
				<div class="restaurant-search-result col-xs-12 col-sm-4">
					<a href="#">
						<div class="restaurant-search-inner">
							<div class="restaurant-search-img col-xs-4 col-sm-12">
								<img src="http://placehold.it/150x150"/>
							</div>
							<div class="restaurant-search-desc col-xs-8 col-sm-12">
								<h2>식당7 이름</h2>
								<h4>평점 : 0.5/5</h4>
								<p>설명</p>
							</div>
						</div>
					</a>
				</div>
				
			</div>
		</div>
	</div>
	<!-- //search -->







<%@include file="inc/footer.jsp" %>