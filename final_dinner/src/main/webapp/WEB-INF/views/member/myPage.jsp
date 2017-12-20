<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../inc/top.jsp"%>



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
	<section class="MOD_SUBNAVIGATION1 container">
	<div style="display: inline-block; float: left;" class="col-md-3">
		
		<div data-layout="al16 al-o2 de-o1 de6 ec4">
			<nav class="MOD_SUBNAVIGATION1_Menu" >
			<p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">sss님</p>
			<ul>
				<li><a href="/dinner/member/memberEdit.do">회원정보 수정</a></li>
				<li><a href="#">회원탈퇴</a></li>
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
						<a href="/dinner/member/memberEdit.do">회원정보수정</a><br> 
						<a href="/dinner/book/booking.do">예약정보 조회</a><br>
						<a href="/dinner/restaurant/restaurantJoin.do">식당등록</a><br>						
						<a href="#">회원탈퇴</a>
					</div>
					<div class="tab-pane fade" id="business">
						<a href="/dinner/member/memberEdit.do">회원정보수정</a><br> 
						<a href="/dinner/restaurantEnterprise/restaurantListView.do">식당정보확인</a><br>
						<a href="#">식당예약조회</a><br>
						<div class='container pad_0'>
							<div class='col-md-1 pad_0 bbb'>
								<a class="right-toggle1" data-toggle="right" href="#"> 식당정보수정
									<span class="caret"></span>
								</a>
							</div>
							<div class="right-menu1 eee col-md-2 pad_0">
								<ul>
									<li><a href="#" class="pad_0 ccc">메뉴등록</a></li>
									<li><a href="#" class="pad_0 ccc">메뉴삭제</a></li>
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
									<li><a href="#" class="pad_0 ccc">이벤트등록</a></li>
									<li><a href="#" class="pad_0 ccc">이벤트삭제</a></li>
								</ul>
							</div>
						</div> 
						<a href="#">식당탈퇴</a><br> 
						<a href="#">회원탈퇴</a>
					</div>
				</div>
			</li>



			</nav>
		</div>
		
	</div>
	
	<div style="display: inline-block; float: left;" class="col-md-9">
	<h2 class="ddd">&nbsp;&nbsp;내정보</h2>
		
			<!-- <table border="2" width="600px" height="200" class="table">
				 <tbody>
					<tr>
						<td class="left_top" colspan="4">
							<b class="cDg">tjdgus52</b>님의 회원정보입니다.
						</td>
					</tr>
					<tr>
						<td class="left_top eee">아이디</td>
						<td class="right_top">tjdgus52</td>

						
					</tr>

					<tr>
					
					<td class="left_top eee">성명</td>
						<td class="right_top">
							띠로리
						</td>
					

					</tr>

					<tr>
						<td class="left_top eee">회원상태</td>
						<td class="right_top">
							일반회원
						<a href="#" onclick="javascript:subSellerTabMenu();" class="st_bn3 fr">
						<span style="color:#5c68e1;">판매자</span>신청</a></td>

						


					</tr>

					<tr>
						<td class="left_top eee">보너스</td>
						<td class="right_top">
							<b class="cDg">0<img src="http://wimg.filekok.com/images/icon/icon_b.gif" alt="보너스포인트"/>
						</td>
						
					</tr>

				</tbody>
			</table> -->
	
			<table border="2" width="600px" height="200" class="table">
				  <tbody>
					<tr >
						<td class="left_top" colspan="4">
							<b class="cDg">tjdgus52</b>님의 회원정보입니다.
						</td>	
					</tr>
					<tr>
						<td class="left_top eee">아이디</td>
						<td class="right_top">tjdgus52</td>
					</tr>
					<tr>
						<td class="left_top eee">성명</td>
						<td class="right_top">
							띠로리
						</td>
					</tr>
					<tr>
						<td class="left_top eee">회원상태</td>
						<td class="right_top">
							일반회원
						<a href="#" onclick="javascript:subSellerTabMenu();" class="st_bn3 fr">
						<span style="color:#5c68e1;">판매자</span>신청</a></td>
						
					</tr>
					<tr>
						<td class="left_top eee">보너스</td>
						<td class="right_top">
							<b class="cDg">0<img src="http://wimg.filekok.com/images/icon/icon_b.gif" alt="보너스포인트"/>
						</td>
					</tr>
						
					        </tbody>
			</table>
	
	
	
	<h2 class="ddd">&nbsp;&nbsp;공지사항</h2>
		
			<table border="2" width="600px" height="200" class="table">
				  <tbody>
					<tr >
							<td class="left_top">번호</td>
							<td class="left_top">제목</td>
							<td class="left_top">조회수</td>
							<td class="left_top">등록일</td>
					</tr>
															<tr>
						<td align="center">1</td>
						<td>
							<a href="/main/bbs.php?table=notice&action=view&num=65" >[안내] 12월 22일, 28일 토스 결제 서비스 점검 공지</a>
						</td>
						<td align="center">2</td>
						<td align="center">
							2017-12-14						</td>
					</tr>
										<tr>
						<td align="center">2</td>
						<td>
							<a href="/main/bbs.php?table=notice&action=view&num=64" >[안내] LG U+ 휴대폰 본인확인 서비스 중단 발생 안내</a>
						</td>
						<td align="center">84</td>
						<td align="center">
							2017-12-12						</td>
					</tr>
										<tr>
						<td align="center">3</td>
						<td>
							<a href="/main/bbs.php?table=notice&action=view&num=63" >[안내] 11월 26일 SC제일은행 관련 결제 일시 중단 안내</a>
						</td>
						<td align="center">417</td>
						<td align="center">
							2017-11-24						</td>
					</tr>
										<tr>
						<td align="center">4</td>
						<td>
							<a href="/main/bbs.php?table=notice&action=view&num=62" >[공지] 파일콕 서비스 임시 점검 안내</a>
						</td>
						<td align="center">860</td>
						<td align="center">
							2017-11-21						</td>
					</tr>
										<tr>
						<td align="center">5</td>
						<td>
							<a href="/main/bbs.php?table=notice&action=view&num=61" >[공지] 정보통신망을 이용한 영상물(비디오물) 등급분류관련 ..</a>
						</td>
						<td align="center">739</td>
						<td align="center">
							2017-11-16						</td>
					</tr>
					        </tbody>
			</table>
	</div>
	</section>

	<%@include file="../inc/footer.jsp"%>