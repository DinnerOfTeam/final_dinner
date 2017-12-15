<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>

<!-- search-->
<link href="css/site-search.css" rel="stylesheet" type="text/css" media="all" />
<div class="search">
	<div class="food-search-form">
		<div class="container">
			<div>
				<form class="form-horizontal">
					<ul class="list-group wow fadeInUp animated" data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
						<li class="list-group-item search-location-tabs">
							<ul class="nav nav-tabs search-tabs">
								<li class="active"><a href="#seoul" data-toggle="tab">서울</a></li>
								<li class=""><a href="#incheon" data-toggle="tab">인천</a></li>
								<li class=""><a href="#gyeonggi" data-toggle="tab">경기</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade active in" id="seoul">
									<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
								</div>
								<div class="tab-pane fade" id="incheon">
									<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
								</div>
								<div class="tab-pane fade" id="gyeonggi">
									<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="form-group">
								<label for="search-location" class="col-sm-2 control-label">텍스트 필드</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="search-location" placeholder="텍스트 필드">
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="form-group">
								<label for="search-location" class="col-sm-2 control-label">텍스트 필드2</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="search-location" placeholder="텍스트 필드2">
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="form-group">
								<span class="col-sm-2 control-label">체크 박스</span>
								<div class="col-sm-10">
									<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox1" value="option1"> 1
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox2" value="option2"> 2
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" id="inlineCheckbox3" value="option3"> 3
									</label>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="form-group">
								<span class="col-sm-2 control-label">라디오 박스</span>
								<div class="col-sm-10">
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
									</label>
								</div>
							</div>
						</li>
						<li class="list-group-item btn-bottom">
							<div class="form-group">
								<input class="btn btn-primary" type="submit" value="검색">
								<input class="btn btn-default" type="reset" value="리셋">
							</div>
						</li>
					</ul>
				</form>
			</div>
			
			
		</div>
	</div>
	<div class="food-search-result wow fadeInUp animated"
				data-wow-delay=".5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
		<div class="container">
			<div class="restaurant-search-result col-xs-12 col-sm-4">
				<a href="#">
					<div class="restaurant-search-inner">
						<div class="restaurant-search-img col-xs-4 col-sm-12">
							<img src="http://placehold.it/150x150"/>
						</div>
						<div class="restaurant-search-desc col-xs-8 col-sm-12">
							<h3>식당1 이름</h3>
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
							<h3>식당2 이름</h3>
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
							<h3>식당3 이름</h3>
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
							<h3>식당4 이름</h3>
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
							<h3>식당5 이름</h3>
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
							<h3>식당6 이름</h3>
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
							<h3>식당7 이름</h3>
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