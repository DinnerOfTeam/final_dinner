<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery-ui.css'/>">

<script type="text/javascript" 
src="<c:url value='/jquery/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$.applyDatePicker('#endDate');
});
$.applyDatePicker=function(id){
	$(id).datepicker({
		dateFormat:"yy-mm-dd",
		changeYear:true,
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월',
			'10월','11월','12월']
	});
}
</script>
<div class="form-wrap">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>투표 등록</h1>
				</div>
				<div class="form-info">

					<form action="<c:url value='/indiGroup/vote/voteReg.do'/>" method="post">
						<input type="hidden" name="groupNo" value="${param.groupNo }">
						<input type="text" class="form-text" name="voteTitle" placeholder="제목을 입력하세요" required="">
						<textarea placeholder="내용을 입력하세요" class="form-text" name="voteDesc" required=""></textarea>
					
						<input type="text" class="form-text" name="itemArr" placeholder="항목입력" required="">
						<input type="text" class="form-text" name="itemArr" placeholder="항목입력">
						<input type="text" class="form-text" name="itemArr" placeholder="항목입력">
						<!-- <div class="form-comp">
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 텍스트
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
							</label>

						</div> -->
						
						<label>마감일 : </label> <input type="text" name="endDate" id="endDate"> 
						
						<!-- 다중선택가능여부 -->
						<div class="form-comp">
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox1" name="voteMultiSel" value="Y">다중선택 가능 
							</label>
						</div>

						<div class="form-comp-row">
							<div class="col-sm-6">
								<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="투표등록">
							</div>
							<div class="col-sm-6">
								<input type="button" name="cancel" class="site-btn site-btn-full" value="취소"
									onclick="location.href='<c:url value="/indiGroup/vote/list.do?groupNo=${param.groupNo }"/>'">
							</div>
						</div>


					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../inc/footer.jsp" %>    