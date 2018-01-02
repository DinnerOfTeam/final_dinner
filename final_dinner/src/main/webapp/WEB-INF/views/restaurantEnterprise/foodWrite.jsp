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

<script type="text/javascript">
   /*  $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "${pageContext.request.contextPath }/resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    }); */
    
    <!-- 메뉴 추가 -->
		$(function(){
			$(document).on("click", ".food-item-box .food-item-del", function(){
				if($('form[name=addFoodItem]>div.food-item-list>div.food-item-box').length>1){
					$(this).closest('div.food-item-box').remove();
				}
			});
			
			var foodItemBox=$("form[name=addFoodItem]>div.food-item-box").eq(0).detach();
			
			$(document).on("click", "form[name=addFoodItem] .food-item-add", function(){
				$('form[name=addFoodItem]>div.food-item-list').append(foodItemBox.clone());
			});
			
			$('form[name=addFoodItem]>div.food-item-list').append(foodItemBox.clone());
			
			$('form[name=addFoodItem]').submit(function(){
				if($('form[name=addFoodItem]>div.food-item-list>div.food-item-box').length<=0){
					$(this).find('.food-item-add').click();
					return false;
				}
				
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




<title>foodWrite.jsp</title>
</head>
<body>

	
					<!-- 	<textarea name="editor" id="editor"
							style="width: 700px; height: 400px;"></textarea> -->
		
 	<%-- <!-- login -->
	<div class="form-wrap">
		<div class="row">
			<div class="form-body " style="width: 75%;">
				<div class="form-heading">
					<h1>메뉴등록</h1>
				</div>
				<div class="form-info">
					<form action="<c:url value='/restaurantEnterprise/foodWrite.do' />" method="post"
						enctype="multipart/form-data" >
						
						<div class="col-xs-4">
								<select class="form-select" name="foodContact1">
									<option>메뉴등록</option>
									<option>면류</option>
									<option>밥류</option>
									<option>탕류</option>
									<option>음료</option>
								</select>
							</div>
						
						
						<input type="text" class="form-text" name="foodItemName" placeholder="이름" required="">
						
						<input type="text" class="form-text" name="foodItemPrice" placeholder="가격" required="">
						
						<textarea placeholder="설명" name="foodItemDesc" class="form-text" required=""></textarea>
						
						
						
						<input type ="file" name="imageUpload" id="imageUpload" >
						
					
						
						<div class="form-comp-row">
							<div class="col-sm-6 i">
								<input type="submit" name="Sign In" class="site-btn-submit" value="등록">
							</div>
							<div class="col-sm-6 ii">
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
	</div> --%>
	
	
		<div class="site-container-wrap">
		<div class="container">
			<div class="form-simple">
				<form action="<c:url value='/restaurantEnterprise/foodWrite.do' />" method="post" name="addFoodItem">
					<div class="shadow-box">
						<div class="form-row">
							<div class="col-xs-6 col-sm-10">
								<h3>메뉴 추가</h3>
							</div>
							<div class="col-xs-6 col-sm-2">
								<input type="button"
									class="site-btn-submit site-btn-full food-item-add" value="추가">
							</div>
						</div>
						
						
						
					</div>
					
					<div class="shadow-box food-item-box">
						<label for="foodMenuNo">메뉴 종류</label>
						<select class="form-select"
								name="foodMenuNo" id="foodMenuNo">
							<option value="0">메뉴 종류</option>
							<option value="1">식사</option>
							<option value="2">면류</option>
							<option value="3">김밥</option>
							<option value="4">튀김류</option>
							<option value="5">분식</option>
							<option value="6">기타</option>
						</select>
						<div class="row">
							<div class="col-sm-2 col-sm-push-10 form-comp">
								<input type="button"
									class="site-btn site-btn-full food-item-del" value="제거">
							</div>
							<div class="col-sm-10 col-sm-pull-2">
								<input type="text" class="form-text food-item-name" placeholder="메뉴명" name="foodItemName">
							</div>
						</div>
						<input type="text" class="form-text food-item-price" placeholder="가격" name="foodItemPrice">
						<textarea placeholder="설명" class="form-text food-item-desc" name="foodItemDesc"></textarea>
					</div>
					
					<div class="food-item-list">
						
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
	</div>
	
</body>
</html>


<%@include file="../inc/footer.jsp"%>