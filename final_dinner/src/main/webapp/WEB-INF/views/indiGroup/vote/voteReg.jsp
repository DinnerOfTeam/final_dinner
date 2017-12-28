<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<div class="form-wrap">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>투표 등록</h1>
				</div>
				<div class="form-info">

					<form action="<c:url value='/indiGroup/vote/voteReg.do'/>" method="post">
						<input type="text" class="form-text" name="voteTitle" placeholder="제목을 입력하세요" required="">
						<textarea placeholder="내용을 입력하세요" class="form-text" name="voteDesc" required=""></textarea>
					
						<input type="text" class="form-text" name="itemTitle" placeholder="항목입력" required="">
						<input type="text" class="form-text" name="itemTitle" placeholder="항목입력">
						<input type="text" class="form-text" name="itemTitle" placeholder="항목입력">
						<!-- <div class="form-comp">
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 텍스트
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
							</label>

						</div> -->
						
						<label>마감일 : </label> <input type="text" name="endDate"> 
						
						<!-- 다중선택가능여부 -->
						<div class="form-comp">
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox1" name="voteMultiSel" value="voteMultiSel">다중선택 가능 
							</label>
						</div>

						<div class="form-comp-row">
							<div class="col-sm-6">
								<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="Sign up">
							</div>
							<div class="col-sm-6">
								<input type="submit" name="cancel" class="site-btn site-btn-full" value="Cancel">
							</div>
						</div>


					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../inc/footer.jsp" %>    