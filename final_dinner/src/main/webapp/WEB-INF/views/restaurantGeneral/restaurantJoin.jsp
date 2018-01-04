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

.ccc{
	text-align: right;	
}
</style>

 <script type="text/javascript">
 $(function(){
		$('.btn-file-del').click(function(){
			$(this).parent().parent().remove();
		});
		
		var $fileRow=$('.site-fileup-list').find('.site-fileup-row').eq(0).clone(true);
		$fileRow.find('input[type=file]').val('');
		
		$('.btn-file-add').click(function(){
			$(this).parent().parent().find('.site-fileup-list').append($fileRow.clone(true));
		});
 });
 
</script>

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
						
					<div class="form-row">
						<div class="col-xs-3">
								<select class="form-select" name="resTypeNo">
									<option>식당종류</option>
										<c:forEach var="vo" items="${typeList }"> 
											<option value="${vo.resTypeNo }">${vo.resTypeName }</option>
										</c:forEach>
								</select>
						</div>
					</div>		
						
						
						<input type="text" class="form-text" name="resName" placeholder="식당이름" required="">

						<textarea placeholder="소개" name="resIntroduce" class="form-text" required=""></textarea>
						<input type="text" class="form-text" name="resWorkDay" placeholder="영업일(월~금, 연중무휴, ...)" required="">
						<input type="text" class="form-text" name="resWorkHour" placeholder="영업시간" required="">
						
						<div class="form-group">
							<label for="imageThumb">썸네일</label>
							<input type="file" name="imageThumb" id="imageThumb">
						</div>
						
					<div class="row form-group">
						<label class="col-xs-9">첨부파일</label>
						<div class="col-xs-3">
							<input type="button" class="btn-file-add site-btn-submit btn-block" value="추가">
						</div>
						<div class="site-fileup-list">
							<div class="site-fileup-row">
								<div class="col-xs-9">
									<input type="file" name="imageUpload">
								</div>
								<div class="col-xs-3">
									<input type="button" class="btn-file-del site-btn btn-block" value="삭제">
								</div>
							</div>
						</div>
					</div>
						
						
						
						<input type="text" class="form-text" name="resMaxPerson" placeholder="최대인원" required="">
												
						
						<div class="form-row">
							<div class="col-xs-3">
								<select class="form-select" name="resContact1">
									<option>02</option>
									<option>032</option>
									<option>031</option>
									<option>033</option>
									<option>041</option>
									<option>043</option>
									<option>063</option>
									<option>062</option>
									<option>061</option>
									<option>054</option>
									<option>053</option>
									<option>055</option>
									<option>052</option>
									<option>051</option>
									<option>064</option>
									
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
							<div class="col-sm-6 ccc">
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