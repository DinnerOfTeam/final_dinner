<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/modules.css"
	rel="StyleSheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/style.min.css"
	rel="StyleSheet" type="text/css">

<style type="text/css">
a {
	color: #353535;
}

.nav-tabs2 li a {
	font-size: 85%;
}

.nav-tabs2 li {
	width: 50%;
}
</style>

<title>Insert title here</title>
<body>


	<header class="MOD_HEADER1">
	<div data-layout="_r">
		<div data-layout="al16 de10" class="MOD_HEADER1_Title"></div>
		<div data-layout="al16 de6" class="MOD_HEADER1_Details">
			<!-- Search -->
			<form name="Header1" action="" method=""></form>
		</div>
	</div>
	</header>
	<!--
END MODULE AREA 1: Header 1
-->

	<!--
START MODULE AREA 2: Sub Navigation 1
-->
	<section class="MOD_SUBNAVIGATION1">
	<div data-layout="_r">
		<div data-layout="al16 al-o2 de-o1 de6 ec4">
			<nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
			<p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">sss님</p>
			<ul>
				<li><a href="#">Sub menu item 1</a></li>
				<li><a href="#">Sub menu item 2</a></li>
				<li><a href="#">Sub menu item 3</a></li>
				<li><a href="#">Sub menu item 4</a></li>
				<li><a href="#">Sub menu item 5</a></li>
			</ul>
			<li class="list-group-item search-location-tabs">
				<ul class="nav nav-tabs nav-tabs2" id="tab">
					<li class="active"><a href="#general" data-toggle="tab">일반회원</a></li>
					<li class=""><a href="#business" data-toggle="tab">업체회원</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active in" id="general">
						<a href="#">회원정보수정</a><br> <a href="#">회원탈퇴</a>
					</div>
					<div class="tab-pane fade" id="business">
						<!-- <a href="#">회원정보수정</a><br> <a href="#">식당정보확인</a><br>
						<ul>
							<li class="dropdown"><a href="#" date-toggle="dropdown-menu">식당정보수정</a><br>
								<ul class="dropdown-menu" role="menu">
									<li><a role="menuitem" href="#">메뉴등록</a></li>
								</ul>
							</li>
						</ul> 
						<a href="#">이벤트등록요청</a><br> <a href="#">회원탈퇴</a>
					</div>
				</div>
			</li>



			</nav>
		</div>
		<div data-layout="al-o1 de-o2 de10" class="MOD_SUBNAVIGATION1_Page">
			<h1>Large page title</h1>
			<p class="MOD_SUBNAVIGATION1_Excerpt" data-theme="_ts2_bb2">Lorem
				ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua.</p>
			<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
				laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
				dolor in reprehenderit in voluptate velit esse cillum dolore eu
				fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
				proident, sunt in culpa qui officia deserunt mollit anim id est
				laborum.</p>
			<img class="AP_article_image"
				src="https://unsplash.it/800/300/?random" alt="">
			<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
				laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
				dolor in reprehenderit in voluptate velit esse cillum dolore eu
				fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
				proident, sunt in culpa qui officia deserunt mollit anim id est
				laborum.</p>
		</div>
	</div>
</body>
</html>

<%@include file="../inc/footer.jsp"%>