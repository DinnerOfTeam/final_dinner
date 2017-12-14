<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<c:import url="../inc/indigroupSide.jsp" />
<style type="text/css">
	input.btn1.btn-1.btn-1b {
		color: #FFF;
		border: none;
		background: #9E1616;
		padding: .5em 1.5em;
		font-size: 1em;
		outline: none;
	}
	a {
		color: red;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#btnChkGroupName').click(function() {
			//중복확인 버튼 클릭시 새창 열기
			var name = $('#groupName').val();
			window.open("<c:url value='../indiGroup/checkName.do?groupName="+ name+"'/>",
			'chk','left=0,top=0,width=400,height=250,locations=yes,resizable=yes');
		});
		$('button').click(function() {
			if(!$('#dupli').val()) {
				alert("중복확인을 하셔야 합니다.");
				return false;
			}
		});
	});
</script>
				<div class="contact-form wow fadeInUp animated text_left"
					data-wow-delay=".5s"
					style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
					<h4>그룹 생성</h4>
					<hr>
					<form action="<c:url value= '/indiGroup/create.do' />" method="post">
						<input type="text" placeholder="그룹 이름" id='groupName' name= 'groupName' 
								required=""> 
						<input type="button" id="btnChkGroupName" title="새창열림"
								class="btn1 btn-1 btn-1b" value= '중복확인' />
						<textarea placeholder="그룹 설명" id= 'groupInfo' name= 'groupInfo'  required=""></textarea>
						<input type="hidden" id= 'dupli' name= 'dupli' required="" />
						<button class="btn1 btn-1 btn-1b">그룹 생성</button>
					</form>
				</div>
			</div>
		</div>
	</article>
<%@ include file="../inc/footer.jsp" %>