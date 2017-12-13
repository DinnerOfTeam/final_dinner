<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Triplex a Interior Category Flat Bootstrap responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Triplex Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Arimo" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" rel="stylesheet">
<!-- //font -->
<script src="${pageContext.request.contextPath }/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>	
<!--animate-->
<link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
<body>
	<!-- header -->
	<header class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
					</div>
					<div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
						<div class="top-header-right-info">
							<ul>
								<c:if test="${empty sessionScope.memId }">
								<li><a href="<c:url value= '/login/login.do'/>">로그인</a></li>
								<li><a href="<c:url value= '/member/signup.do'/>">회원가입</a></li>
								</c:if>
								
								<c:if test="${!empty sessionScope.memId }">								
								<li><a href="<c:url value= '/login/login.do'/>">로그아웃</a>
								<a href="<c:url value= '/member/memberEdit.do'/>">회원정보수정</a>
								<a href="<c:url value= '/member/signup.do'/>">마이페이지</a></li>
								</c:if>
							</ul>
						</div>
						
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="bottom-header">
			<div class="container">
				<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
					<h1><a href="index.html"><img src="<c:url value= '/images/logo.jpg'/>" alt="" /></a></h1>
				</div>
				<div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
					<nav class="navbar navbar-default">
						<div class="container">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="<c:url value= '/#' />" class="active">브랜드소개</a></li>
								<li><a href="<c:url value= '/about.do'/>">통합검색</a></li>
								<li><a href="<c:url value= '/board/list.do'/>">게시판</a></li>
								<li><a href="<c:url value= '/#'/>">이벤트</a></li>								
								<li><a href="<c:url value= '/customer/list.do'/>">고객센터</a></li>
								<li><a href="<c:url value= '/indiGroup/main.do'/>">그룹</a></li>
							</ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</header>
	<section>