<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../jquery/jquery-ui.min.js"></script>



<style type="text/css">
	.eee{
		padding-bottom: 10px;
	}
	.bbb{
	padding-left: 15px;	
	}
</style>


<%@include file="../inc/mypageSide.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(function () {
	$('#startDay').datepicker({
		dateFormat:'yy-mm-dd',
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
	});
	

});
</script>

</head>
<body>


<!-- form-simple -->
	
	<div class="form-wrap">
		<div class="container" style="width: 750px;">
			<h2 class="eee">예약	</h2>
			<div class="form-simple">
				 <form action="<c:url value='/book/restaurantBooking.do' />" method="post">
			
					
					<div class="form-row">
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="인원" required="">
						</div>
						
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="시간" required="">
						</div>
						
						<div class="col-sm-4">
						<input type="text" class="form-text" name="startDay" placeholder="날짜" id="startDay">
						</div>
					
					</div>
					<div class="form-row">
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="이름">
						</div>
					</div>
					<div class="form-row">
					<p class="bbb">연락처</p>
						<div class="col-xs-3">
							<select class="form-select">
								<option>010</option>
								<option>011</option>
								<option>012</option>
								<option>016</option>
								<option>019</option>
							</select>
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
					</div> 
					
					
					<textarea placeholder="요청사항을 적어주세요" class="form-text" required=""></textarea>
					
					<div class="form-comp-row">
						<div class="col-sm-6">
							<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="예약">
						</div>
						<div class="col-sm-6">
							<input type="submit" name="cancel" class="site-btn site-btn-full" value="취소">
						</div>
					</div>

					
					<div class="signup-text">
						<a href="login.html">Already have an account? Login here.</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	


</body>
</html>












<%@include file="../inc/footer.jsp"%>