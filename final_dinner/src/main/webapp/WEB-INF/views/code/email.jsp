<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>
</head>
<body>
	<div class="form-wrap">
		<div class="container">
			<h4>이메일 발송하기</h4>
			<div class="form-simple">
				<form action="<c:url value='/code/email.do' />" method="post">
					<input type="text" class="form-text" name="from" placeholder="받을 이메일 주소@email.com" required="">
					<input type="text" class="form-text" name="sendTo" placeholder="보낼 이메일 주소@email.com" required="">
					<input type="text" class="form-text" name="title" placeholder="title" required="">
					
					<textarea placeholder="Message" class="form-text" name= 'msg' required=""></textarea>
					
					<div class="form-comp-row">
						<div class="col-sm-6">
							<input type="submit" name="send" class="site-btn-submit site-btn-full" value="이메일 보내기">
						</div>
						<div class="col-sm-6">
							<input type="reset" name="cancel" class="site-btn site-btn-full" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>