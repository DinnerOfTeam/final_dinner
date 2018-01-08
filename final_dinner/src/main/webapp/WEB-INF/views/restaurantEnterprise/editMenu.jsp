<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>

<%@include file="../inc/mypageSide.jsp" %>

	<!-- 메뉴종류 추가 -->
	<script type="text/javascript">
		$(function(){
			$('form[name=editFoodMenu]').submit(function(){
				$(this).find('.food-menu-name').each(function(index, element){
					if($(element).val()==""){
						alert("메뉴명을 입력하세요");
						$(element).focus();
						errFlag=false;
						return false;
					}
				});
				
				return true;
			});
			
		});
	</script>
	<div class="form-simple">
		<form action="<c:url value='/restaurantEnterprise/editMenu.do'/>" method="post" name="editFoodMenu">
			<div class="shadow-box">
				<h3>메뉴 종류 편집</h3>
			</div>
			
			<div class="shadow-box food-menu-box">
				<input type="hidden" name="foodMenuNo" value="${menuVO.foodMenuNo }">
				<input type="text" class="form-text food-menu-name" placeholder="종류명" name="foodMenuName" value="${menuVO.foodMenuName }">
				<textarea placeholder="설명" class="form-text food-menu-desc" name="foodMenuDesc">${menuVO.foodMenuDesc }</textarea>
			</div>
			
			<div class="form-comp">
				<input type="submit" class="site-btn-submit site-btn-full" value="편집">
			</div>
		</form>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>