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

</style>
<script type="text/javascript">
	$(function() {
		$('.right-menu').hide();
		$('.right-toggle').click(function() {
			$('.right-menu').toggle();
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
			<nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
			<p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">sss님</p>
			<ul>
				<li><a href="#">회원정보 수정</a></li>
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
						<a href="#">회원정보수정</a><br> 
						<a href="#">식당정보확인</a><br> 
						<div class= 'container pad_0'>
							<div class= 'col-md-1 pad_0 bbb'>
								<a class="right-toggle" data-toggle="right" href="#">식당정보
									수정 <span class="caret"></span>
								</a>							
							</div>
							<div class="right-menu col-md-2 pad_0">
								<ul >
									<li><a href="#" class="pad_0 ccc">메뉴등록</a></li>
									<li><a href="#" class="pad_0 ccc">메뉴삭제</a></li>
								</ul>
							</div>
						</div>
						<br> <a href="#">이벤트등록요청</a><br> <a href="#">회원탈퇴</a>
					</div>
				</div>
			</li>



			</nav>
		</div>
		
	</div>
	
	<div style="display: inline-block; float: left;" class="col-md-9">
	<h2 class="ddd">&nbsp;&nbsp;내정보</h2>
		
			<table border="2" width="600px" height="200" class="table">
				 <tbody>
					<tr>
						<td class="left_top" colspan="4">
							<b class="cDg">tjdgus52</b>님의 회원정보입니다.&nbsp;<a href="mypage.php?doc=mb_pass" class="st_bn3 rbn">회원정보수정</a>
						</td>
					</tr>
					<tr>
						<td class="left_top">아이디</td>
						<td class="right_top">tjdgus52</td>

						<td class="left_top">쿠폰</td>
						<td class="right_top">0<img src="http://wimg.filekok.com/images/icon/icon_c.gif" alt="쿠폰"/></td>
					</tr>

					<tr>
						<td class="left_top">회원상태</td>
						<td class="right_top">
							일반회원
						<a href="#" onclick="javascript:subSellerTabMenu();" class="st_bn3 fr">
						<span style="color:#5c68e1;">판매자</span>신청</a></td>
													

						<td class="left_top">마일리지</td>
						<td class="right_top">
							0<img src="http://wimg.filekok.com/images/icon/icon_m.gif" alt="마일리지"/>
						</td>

					</tr>

					<tr>
						<td class="left_top">포인트</td>
						<td class="right_top">
							<b class="cLr">0</b><img src="http://wimg.filekok.com/images/icon/icon_p.gif" alt="포인트" />
							<a href="charge.php?doc=point" class="st_bn25 fr"><span class="red1">포인트</span>충전</a>
						</td>

						<td class="left_top">정액제</td>
						<td class="right_top" style="margin-left:10px;!impo">
							<a href="charge.php?doc=fixedcard">정액제 없음	</a>&nbsp;
							<span id = "ticket"></span>
						</td>


					</tr>

					<tr>
						<td class="left_top">보너스</td>
						<td class="right_top">
							<b class="cDg">0<img src="http://wimg.filekok.com/images/icon/icon_b.gif" alt="보너스포인트"/>
						</td>
						<td class="left_top">보유정액권</td>
						<td class="right_top">
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