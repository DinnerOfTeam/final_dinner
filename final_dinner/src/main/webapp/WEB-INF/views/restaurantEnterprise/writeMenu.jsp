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
			$(document).on("click", ".food-menu-box .food-menu-del", function(){
				if($('form[name=addFoodMenu]>div.food-menu-list>div.food-menu-box').length>1){
					$(this).closest('div.food-menu-box').remove();
				}
			});
			
			var foodMenuBox=$("form[name=addFoodMenu]>div.food-menu-box").eq(0).detach();
			
			$(document).on("click", "form[name=addFoodMenu] .food-menu-add", function(){
				$('form[name=addFoodMenu]>div.food-menu-list').append(foodMenuBox.clone());
			});
			
			$('form[name=addFoodMenu]>div.food-menu-list').append(foodMenuBox.clone());
			
			$('form[name=addFoodMenu]').submit(function(){
				if($('form[name=addFoodMenu]>div.food-menu-list>div.food-menu-box').length<=0){
					$(this).find('.food-menu-add').click();
					return false;
				}
				
				var errFlag=true;
				$(this).find('.food-menu-name').each(function(index, element){
					if($(element).val()==""){
						alert("메뉴명을 입력하세요");
						$(element).focus();
						errFlag=false;
						return false;
					}
				});
				
				return errFlag;
			});
			
		});
	</script>
	<div class="form-simple">
		<form action="#" method="post" name="addFoodMenu">
			<div class="shadow-box">
				<div class="form-row">
					<div class="col-xs-6 col-sm-10">
						<h3>메뉴 종류 추가</h3>
					</div>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="site-btn-submit site-btn-full food-menu-add" value="추가">
					</div>
				</div>
				
			</div>
			
			<div class="shadow-box food-menu-box">
				<div class="row">
					<div class="col-sm-2 col-sm-push-10 form-comp">
						<input type="button" class="site-btn site-btn-full food-menu-del" value="제거">
					</div>
					<div class="col-sm-10 col-sm-pull-2">
						<input type="text" class="form-text food-menu-name" placeholder="종류명" name="foodMenuName">
					</div>
				</div>
				<textarea placeholder="설명" class="form-text food-menu-desc" name="foodMenuDesc" required="required"></textarea>
			</div>
			
			<div class="food-menu-list">
				
			</div>
			
			<div class="row">
				<div class="col-sm-6 form-comp">
					<input type="submit" class="site-btn-submit site-btn-full" value="등록">
				</div>
				<div class="col-sm-6 form-comp">
					<a href="#" class="site-btn site-btn-full">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>
<!--//BoardPage-->
	
<%@include file="../inc/footer.jsp" %>