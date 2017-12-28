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
</script>




<title>foodWrite.jsp</title>
</head>
<body>

	
					<!-- 	<textarea name="editor" id="editor"
							style="width: 700px; height: 400px;"></textarea> -->
		
 	<!-- login -->
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
	</div>
</body>
</html>


<%@include file="../inc/footer.jsp"%>