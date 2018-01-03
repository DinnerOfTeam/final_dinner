<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
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
<!-- <link href="//fonts.googleapis.com/css?family=Arimo" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Dosis:300,400,500,600" rel="stylesheet"> -->
<!-- //font -->
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet" type="text/css">
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
<link href="${pageContext.request.contextPath }/css/codestyle.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<style type="text/css">
	.admin-tabs li a {
		padding: 10px 20px;
	}
	.admin-tabs {
		display: inline-block;
		margin-bottom: 0;
	}
	form#ad_log {
		float: right;
	}
	form#ad_log label {
		font-size: 0.8em;
		color: white;
	}
	form#ad_log input {
		color: black;
	}
</style>
<title>DOT 관리자 페이지</title>
</head>
<body>
	<header class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-right">
						<div class="top-header-right-info">
							<c:if test="${empty sessionScope.memId }">
							<form id= 'ad_log' action="<c:url value= '/admin/login/login.do'/>" method="post" >
								<label>아이디 : <input type="text" name= 'memId' size="5"></label>
								<label>비밀번호 : <input type="text" name= 'memPwd' size="8"></label>
							</form>
							</c:if>
							<ul>
								<c:if test="${empty sessionScope.memId }">
								<li><a href="<c:url value= '#'/>">로그인</a></li>
								<li><a href="<c:url value= '/member/signup.do'/>">회원가입</a></li>
								</c:if>
								
								<c:if test="${!empty sessionScope.memId }">								
								<li><a href="<c:url value= '/login/logout.do'/>">로그아웃</a>
								<a href="<c:url value= '/member/myPage.do'/>">마이페이지</a></li>
								</c:if>
							</ul>
						</div>
						
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div>
				</div>
			</div>
			<ul class="nav-pills admin-tabs">
				<li class=""><a href="#AMember" data-toggle="tab">회원관리</a></li>
				<li class=""><a href="#ABoard" data-toggle="tab">게시판관리</a></li>
				<li class=""><a href="#ABook" data-toggle="tab">예약관리</a></li>
				<li class="active"><a href="#ARes" data-toggle="tab">업체지도</a></li>
				<li class=""><a href="#ARest" data-toggle="tab">업체관리</a></li>
				<li class=""><a href="#AQna" data-toggle="tab">질문관리</a></li>
			</ul>
		</div>
		<div class="fadeIn animated" data-wow-delay=".5s">
			<div class="search-tab-content tab-content">
				<div class="tab-pane fade" id="AMember">
					<div class="container" title="회원">
						<c:import url="/admin/member/Amember.do"></c:import>
					</div>
				</div>
				<div class="tab-pane fade" id="ABoard">
					<div class="container" title="게시판">
						<c:import url="/admin/board/Aboard.do"></c:import>
					</div>
				</div>
				<div class="tab-pane fade" id="ABook">
					<div class="container" title="예약">
						<c:import url="/admin/book/Abook.do"></c:import>
					</div>
				</div>
				<div class="tab-pane fade active in" id="ARes">
					<div class="container" title="업체지도">
						<c:import url="/admin/restaurant/Ares.do"></c:import>
					</div>
				</div>
				<div class="tab-pane fade" id="ARest">
					<div class="container" title="업체관리">
						<c:import url="/admin/restaurant/ArestList.do"></c:import>
					</div>
				</div>
				<div class="tab-pane fade" id="AQna">
					<div class="container" title="질문관리">
						<c:import url="/admin/qna/Aqna.do"></c:import>
					</div>
				</div>
			</div>
		</div>
	</header>

</body>
</html>