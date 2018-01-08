<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.aaa{
	padding: 3px;
}
.pad_0 {
	padding: 0px !important;
}

.bbb{
	width: 12%;
}

.ccc{
	padding: 0px !important;
	font-size: 15px !important;
}

.ddd{
	margin-bottom: 10px;
}

.eee{
	
	width: 200px;
}




</style>
<script type="text/javascript">
	$(function() {
		$('.right-menu1').hide();
		$('.right-toggle1').click(function() {
			$('.right-menu1').toggle();
		});
	
		$('.right-menu2').hide();
		$('.right-toggle2').click(function() {
			$('.right-menu2').toggle();
		});
	
		$('.eee').find('li').hover(function(){
			$(this).css('background', 'gray');
		}, function(){
			$(this).css('background', '');
		});
	});
	
	
	
</script>


	<header class="MOD_HEADER1">
	<div data-layout="_r">
		<div data-layout="al16 de10" class="MOD_HEADER1_Title"></div>
		<div data-layout="al16 de6" class="MOD_HEADER1_Details">
			<!-- Search -->
			<form name="Header1" action="" method=""></form>
		</div>
	</div>
	</header>



<section class="MOD_SUBNAVIGATION1 container">
	<div class="col-md-3">
		
		<div data-layout="al16 al-o2 de-o1 de6 ec4">
			<nav class="MOD_SUBNAVIGATION1_Menu" >
			<p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">${ sessionScope.memId}</p>
			<!-- <ul>
				<li><a href="/dinner/member/memberEdit.do">회원정보 수정</a></li>
				<li><a href="/dinner/member/memberOut.do">회원탈퇴</a></li>
			</ul> -->
			<li class="list-group-item search-location-tabs">
				<ul class="nav nav-tabs nav-tabs2" id="tab">
					<c:if test="${ sessionScope.resNo==0}">
						<li class="active"><a href="#general" data-toggle="tab">일반회원</a></li>
					</c:if>
					<c:if test="${ sessionScope.resNo!=0}">
						<li class=""><a href="#general" data-toggle="tab">일반회원</a></li>
						<li class="active"><a href="#business" data-toggle="tab">업체회원</a></li>
					</c:if>
				</ul>
				<div class="tab-content">
					<c:if test="${ sessionScope.resNo==0}">

					<div class="tab-pane fade active in" id="general">
						<a href="<c:url value='/member/memberEdit.do'/>">회원정보수정</a><br> 
						<a href="<c:url value='/book/booking.do'/>">예약정보 조회</a><br>
						<a href="<c:url value='/restaurant/restaurantJoin.do'/>">식당등록</a><br>						
						<a href="<c:url value='/member/memberOut.do'/>">회원탈퇴</a>
					</div>
					</c:if>
					<c:if test="${ sessionScope.resNo!=0}">
					<div class="tab-pane fade" id="general">
							<a href="${pageContext.request.contextPath }/member/memberEdit.do">회원정보수정</a><br> 
							<a href="${pageContext.request.contextPath }/book/booking.do">예약정보 조회</a><br>
							<a href="${pageContext.request.contextPath }/restaurant/restaurantJoin.do">식당등록</a><br>						
							<a href="${pageContext.request.contextPath }/member/memberOut.do">회원탈퇴</a>
					</div>
					
					<div class="tab-pane fade active in" id="business">
						<a href="<c:url value='/member/memberEdit.do'/>">회원정보수정</a><br>
						
						<c:if test="${sessionScope.resNo!=null }">
							<a href="<c:url value='/restaurantEnterprise/restaurantInformation.do?resNo=${sessionScope.resNo }'/>">식당정보확인</a><br>
						</c:if>
						
						<a href="<c:url value='/book/restaurantBookList.do'/>">식당예약조회</a><br>
						<div class='container pad_0'>
							<div class='col-md-1 pad_0 bbb'>
								<a class="right-toggle1" data-toggle="right" href="#"> 식당정보수정
									<span class="caret"></span>
								</a>
							</div>
							<div class="right-menu1 eee col-md-2 pad_0">
								<ul>
									<li><a href="<c:url value='/restaurantEnterprise/menuList.do'/>" class="pad_0 ccc">메뉴 목록</a></li>
									<li><a href="<c:url value='/restaurantEnterprise/writeMenu.do'/>" class="pad_0 ccc">메뉴종류 등록</a></li>
									<li><a href="<c:url value='/restaurantEnterprise/foodWrite.do'/>" class="pad_0 ccc">메뉴등록</a></li>
									<li><a href="<c:url value='/restaurantEnterprise/menuDelete.do'/>" class="pad_0 ccc">메뉴삭제</a></li>
									<li><a href="<c:url value='/restaurantEnterprise/menuRestore.do'/>" class="pad_0 ccc">메뉴 백업/복원</a></li>
								</ul>
							</div>
						</div>
					 
						<div class='container pad_0'>
							<div class='col-md-1 pad_0 bbb'>
								<a class="right-toggle2" data-toggle="right" href="#"> 이벤트수정
									<span class="caret"></span>
								</a>
							</div>
							<div class="right-menu2 eee col-md-2 pad_0">
								<ul>
									<li><a href="<c:url value= '/member/event/writeEvent.do' />" class="pad_0 ccc">이벤트등록</a></li>
									<li><a href="<c:url value= '/member/event/eventList.do' />" class="pad_0 ccc">이벤트관리</a></li>
								</ul>
							</div>
						</div> 
						<a href="<c:url value='/restaurantEnterprise/restaurantOut.do'/>">식당탈퇴</a><br> 
						<a href="<c:url value='/member/memberOut.do'/>">회원탈퇴</a>
					</div>
					</c:if>
				</div>
			</li>



			</nav>
		</div>
		
	</div>
	
	<div class="col-md-9">