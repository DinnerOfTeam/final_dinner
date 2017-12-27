<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                if(document.getElementById('resZipcode')!= null) {
	                document.getElementById('resZipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('resAddress').value = fullRoadAddr;
	                document.getElementById('resAddressDetail').value = data.jibunAddress;
                }else if(document.getElementById('memZipcode')!= null) {
	                document.getElementById('memZipcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('memAdd').value = fullRoadAddr;
	                document.getElementById('memAddDetail').value = data.jibunAddress;
                }

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
        
        
    }
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
								<li><a href="<c:url value= '/login/logout.do'/>">로그아웃</a>
								<a href="<c:url value= '/member/myPage.do'/>">마이페이지</a></li>
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
					<h1><a href="<c:url value='/index.do'/>"><img src="<c:url value= '/images/logo.jpg'/>" alt="" /></a></h1>
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
								<li><a href="<c:url value= '/intro/intro.do' />" class="active">브랜드소개</a></li>
								<li><a href="<c:url value= '/about.do'/>">통합검색</a></li>
								<li><a href="<c:url value= '/board/list.do'/>">게시판</a></li>
								<li><a href="<c:url value= '/event/eventList.do'/>">이벤트</a></li>								
								<li><a href="<c:url value= '/customer/mainNotice.do'/>">고객센터</a></li>
								<li><a href="<c:url value= '/indiGroup/groupMain.do'/>">그룹</a></li>
								<li><a href="<c:url value= '/code.do'/>">코드</a></li>
							</ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</header>
	<section>