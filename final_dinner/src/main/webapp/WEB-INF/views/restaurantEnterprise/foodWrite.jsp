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
    $(function(){
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
    });
</script>




<title>foodWrite.jsp</title>
</head>
<body>

	<!-- form-info -->
	<div class="form-wrap">
		<div class="row">
			<div class="form-body" style="width: 90%;">
				<div class="form-heading">
					<h1>메뉴등록</h1>
				</div>
				<div class="form-info">
					
						<form action="<c:url value='/restaurantEnterprise/foodWrite.do' />" method="post" id="insertBoardFrm"
						enctype="multipart/form-data">

						<select class="form-select aaa">
							<option>음식종류</option>
							<option>한식</option>
							<option>중식</option>
							<option>양식</option>
							<option>분식</option>
						</select> 
						<br>
						<select class="form-select aaa">
							<option>메뉴종류</option>
							<option>22222</option>
							<option>3333333</option>
							<option>44444</option>
							<option>555</option>
						</select> 
						
						<br>
						<input type="text" class="form-text iii" name="email" placeholder="식당이름" required=""> 
						
						<input type="password" name="password" class="form-text iii" placeholder="비밀번호"> 
						
						<input type="password" name="password" class="form-text iii" placeholder="비밀번호 확인">

				


				
						<textarea name="editor" id="editor"
							style="width: 700px; height: 400px;"></textarea>
					




					<div class="form-comp-row bbb">
						<div class="col-sm-6 i">
							<input type="submit" name="Sign In" class="site-btn-submit"
								id="insertBoard" value="등록">
						</div>
						<div class="col-sm-6 ii">
							<input type="submit" name="cancel" class="site-btn" value="취소">
						</div>
					</div>


					</form>





				</div>
			</div>
		</div>
	</div>

</body>
</html>


<%@include file="../inc/footer.jsp"%>