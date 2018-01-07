<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../inc/mypageSide.jsp" %>

	<script type="text/javascript">
		$(function(){
			
		});
	</script>
	
	<div class="shadow-box">
		<h3>메뉴 백업/복원</h3>
	</div>
	
	<div class="shadow-box">
		<h3>백업</h3>
		<p>아래의 버튼을 클릭하시면 식당메뉴를 엑셀(xlsx)파일로 백업받을 수 있습니다</p>
		<div>
			<a href="<c:url value='/restaurantEnterprise/menuBackUp.do'/>"
					class="site-btn-submit site-btn-full food-menu-add">
				메뉴 백업 받기
			</a>
		</div>
	</div>
	
	<div class="shadow-box">
		<div class="form-simple">
			<form action="<c:url value='/restaurantEnterprise/menuRestore.do'/>" method="post"
					name="restoreFoodMenu" enctype="multipart/form-data">
				<h3>복원</h3>
				<div class="form-comp">
					<label for="menuFile"></label>
					<input type="file" name="menuFile" id="menuFile">
				</div>
				<div class="form-comp">
					<label>기존 메뉴 삭제</label>
					<input type="radio" name="isOverwrite" value="Y" id="overwriteY">
					<label for="overwriteY">삭제</label>
					<input type="radio" name="isOverwrite" value="N" id="overwriteN" checked>
					<label for="overwriteN">보존</label>
				</div>
					
				<div class="row">
					<div class="col-sm-6 form-comp">
						<input type="submit" class="site-btn-submit site-btn-full" value="복원">
					</div>
					<div class="col-sm-6 form-comp">
						<input type="reset" class="site-btn site-btn-full" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>