<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>



<%@include file="../inc/mypageSide.jsp"%>


<style type="text/css">
.aaa {
	width: 40% !important;
}

.i {
	text-align: right;
	padding: 0px;
}

.ii {
	text-align: left;
}

.iii{
	width: 50% !important;
}

</style>

<!-- 메뉴 추가 -->
<script type="text/javascript">
		$(function(){
			$('form[name=editFoodItem]').submit(function(){
				
				if($(this).find('#foodMenuNo').val()==0){
					alert("메뉴 종류를 선택하세요");
					$(this).find('#foodMenuNo').focus();
					return false;
				}
				
				var errFlag=true;
				$(this).find('.food-item-name').each(function(index, element){
					if($(element).val()==""){
						alert("메뉴명을 입력하세요");
						$(element).focus();
						errFlag=false;
						return false;
					}
				});
				
				if(errFlag){
					$(this).find('.food-item-price').each(function(index, element){
						if($(element).val()==""){
							alert("가격을 입력하세요");
							$(element).focus();
							errFlag=false;
							return false;
						}
					});
				}
				
				return errFlag;
			});
			
		});
</script>

	<div class="form-simple">
		<form action="<c:url value='/restaurantEnterprise/editItem.do' />" method="post" name="editFoodItem">
			<div class="shadow-box">
				<h3>메뉴 편집</h3>
			</div>
			
			<div class="shadow-box food-item-box">
				<input type="hidden" name="foodItemNo" value="${itemVO.foodItemNo }">
				<label for="foodMenuNo">메뉴 종류</label>
				<select class="form-select"
						name="foodMenuNo" id="foodMenuNo">
					<option value="0">메뉴 종류</option>
					<c:forEach var="menu" items="${menuList }">
						<option value="${menu.foodMenuNo }"
							<c:if test="${menu.foodMenuNo==itemVO.foodMenuNo }">
								selected
							</c:if>
						>${menu.foodMenuName }</option>
					</c:forEach>
					
				</select>
				<input type="text" class="form-text food-item-name" placeholder="메뉴명" name="foodItemName" value="${itemVO.foodItemName }">
				<input type="text" class="form-text food-item-price" placeholder="가격" name="foodItemPrice" value="${itemVO.foodItemPrice }">
				<textarea placeholder="설명" class="form-text food-item-desc" name="foodItemDesc">${itemVO.foodItemDesc }</textarea>
			</div>
			
			<div class="form-comp">
				<input type="submit" class="site-btn-submit site-btn-full" value="편집">
			</div>
		</form>
	</div>
</div>


<%@include file="../inc/footer.jsp"%>