<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jquery/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath }/css/modules.css"
	rel="StyleSheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/style.min.css"
	rel="StyleSheet" type="text/css">

<style type="text/css">
.aaa{
	text-align: center;
}
.bbb{
	padding: 0px !important;
	margin: 0px !important;
}
</style>

<!-- <script type="text/javascript">
	$(function () {
		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',]
		});
		
		$('button').click(function () {
			var d = $('#startDay').datepicker('getDate');
			alert(d);
		});
	});
</script> -->

<%@include file="../inc/mypageSide.jsp" %>


<title>Insert title here</title>
</head>
<body>
		<!-- login -->
	<div class="form-wrap">
		<div class="row">
			<div class="form-body " style="width: 75%;">
				<div class="form-heading">
					<h1>식당등록</h1>
				</div>
				<div class="form-info">
					<form action="<c:url value='/restaurant/restaurantJoin.do' />" method="post"
						enctype="multipart/form-data" >
						<input type="text" class="form-text" name="resNo" placeholder="식당번호" required="">
						<input type="text" class="form-text" name="memNo" placeholder="회원번호" required="">
						<input type="text" class="form-text" name="foodTypeNo" placeholder="음식종류번호" required="">
						<input type="text" class="form-text" name="resTypeNo" placeholder="식당종류번호" required="">
						<input type="text" class="form-text" name="resName" placeholder="식당이름" required="">

						<textarea placeholder="소개" name="resIntroduce" class="form-text" required=""></textarea>
						<input type="text" class="form-text" name="resWorkDay" placeholder="영업일(월~금, 연중무휴, ...)" required="">
						<input type="text" class="form-text" name="resWorkHour" placeholder="영업시간" required="">
						
						<input type ="file" name="imageUpload" id="imageUpload" required="">
						
						
						<input type="text" class="form-text" name="resMaxPerson" placeholder="최대인원" required="">
												
						
						<div class="form-row">
							<div class="col-xs-3">
								<select class="form-select" name="resContact1">
									<option>010</option>
									<option>011</option>
									<option>012</option>
									<option>016</option>
									<option>019</option>
								</select>
							</div>
							<span class="form-txt form-static">-</span>
							<div class="col-xs-3">
								<input type="text" class="user form-text" name="resContact2">
							</div>
							<span class="form-txt form-static">-</span>
							<div class="col-xs-3">
								<input type="text" class="user form-text" name="resContact3">
							</div>
						</div>
						
						
					<!-- 	<input type="text" name="startDay" id="startDay" placeholder="영업일">
						<button>버튼</button> -->
						
					
						
						
						<div >
							<div class="col-sm-7">
							<label for='resZipcode' class= 'sr-only'>주소</label>
							<input type="text" class="form-text bbb"  required="" name="resZipcode"id="resZipcode" ReadOnly title="우편번호">
							</div>
							<div class="col-sm-5">
							  <input type="Button" value="우편번호 찾기" onclick="sample4_execDaumPostcode()"><br />
							</div>
							
							<div class="">
							<span class="sp1"></span> 
								<input type="text" class="form-text bbb"  required="" name="resAddress"id="resAddress" ReadOnly title="주소">
							</div>
							
							<div> 
								<span class="sp1"></span> 
								<input type="text" class="form-text"  required="" name="resAddressDetail"id="resAddressDetail" ReadOnly title="주소">
								<span id="guide" style="color:#999"></span>
							</div>
						</div>
						

						
						<div class="form-comp-row">
							<div class="col-sm-6">
								<input type="submit" name="Sign In" class="site-btn-submit" value="등록">
							</div>
							<div class="col-sm-6">
								<input type="submit" name="cancel" class="site-btn" value="취소">
							</div>
						</div>
						
						

						
						<div class="signup-text">
							<a href="login.html">Already have an account? Login here.</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>










<%@include file="../inc/footer.jsp"%>