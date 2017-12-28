<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

	<!-- 상단 타이틀 -->
	<div class="site-top-title" >		<!-- 색상은 별도의 클래스 or Style태그를 이용해서 변경 -->
		<div class="container">
			<h1>상단 타이틀</h1>
		</div>
	</div>
	
	<!-- 메뉴 추가 -->
	<script type="text/javascript">
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
	<div class="site-container-wrap">
		<div class="container">
			<div class="form-simple">
				<form action="#" method="post" name="addFoodItem">
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
						
						<label for="foodMenuNo">메뉴 종류</label>
						<select class="form-select"
								name="foodMenuNo" id="foodMenuNo">
							<option value="0">메뉴 종류</option>
							<option value="1">식사</option>
							<option value="2">면류</option>
							<option value="3">김밥</option>
							<option value="4">튀김류</option>
							<option value="5">분식</option>
						</select>
						
					</div>
					
					<div class="shadow-box food-item-box">
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
	
	<div class="site-container-wrap">
		<div class="container">
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
						<textarea placeholder="설명" class="form-text food-menu-desc" name="foodMenuDesc"></textarea>
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
	</div>
	
	<!-- table (div 버전) -->
	<div class="table-wrap">
		<div class="container">
			<div class="table-box">
				<div class="table-table table-hover">
					<div class="table-thead hidden-xs">
						<div class="col-xs-1">번호</div>
						<div class="col-xs-6">제목</div>
						<div class="col-xs-2">작성자</div>
						<div class="col-xs-2">날짜</div>
						<div class="col-xs-1">조회수</div>
					</div>
					<div class="table-tbody">
						<div class="table-tr-nodata">
							<span>글이 없습니다.</span>
						</div>
						<div class="table-tr">
							<a href="#">
								<div class="table-td table-td-center col-sm-1 hidden-xs">
									<p>1</p>
								</div>
								<div class="table-td table-td-title col-xs-12 col-sm-6">
									<p>board-td-title (스타일 설정은 부트스트랩 그리드 시스템 이용)</p>
								</div>
								<div class="table-td table-td-center table-xs-left table-xs-sub col-xs-4 col-sm-2">
									<p>col-center</p>
								</div>
								<div class="table-td table-td-center table-xs-right table-xs-sub col-xs-4 col-xs-offset-4 col-sm-2 col-sm-offset-0">
									<p>2017-01-01</p>
								</div>
								<div class="table-td table-td-center col-sm-1 hidden-xs">
									<p>3</p>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="table-comp">
					<!-- 페이징(모바일) -->
					<div class="table-sub visible-xs">
						<ul class="pager">
							<li class="previous disabled">
								<a href="#">
									<i class="fa fa-angle-left"></i>&nbsp;
									이전
								</a>
							</li>
							<li class="current">
								<span>1</span>
							</li>
							<li class="next">
								<a href="#">
									다음&nbsp;
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<div class="table-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-2 col-md-offset-10">
						<a class="site-btn-submit site-btn-full" href="#" role="button">
							<i class="fa fa-pencil"></i>&nbsp;
							글쓰기
						</a>
					</div>
					
					<!-- 페이징 -->
					<div class="table-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<li class="disabled">
								<a href="#" aria-label="First">
									<i class="fa fa-angle-double-left"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Previous">
									<i class="fa fa-angle-left"></i>
								</a>
							</li>
							<li>
								<a href="#">
									1
								</a>
							</li>
							<li class="active">
								<a href="#">
									2
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Next">
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Last">
									<i class="fa fa-angle-double-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<!-- 검색폼 -->
					<div class="form-info form-row">
						<form name="frmBoardSearch" method="get" action="#">
							<div class="col-sm-2 col-sm-offset-2">
								<select class="form-select" name="type">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="name">작성자</option>
								</select>
							</div>
							
							<div class="col-sm-4">
								<input type="text" class="form-text" id="boardSearchKeyword" name="keyword"
									placeholder="Search" value="">
							</div>
							<div class="col-sm-2">
								<input type="submit" class="site-btn-submit site-btn-full" value="검색">
							</div>
						</form>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 
	//기본틀
	<div class="table-box">
		<div class="table-table table-hover">		//table-hover : 테이블에 hover효과 적용
			<div class="table-thead hidden-xs">
						//hidden-xs : 부트스트랩 그리드 - 모바일 화면에서 숨김
						//visible-xs : 부트스트랩 그리드 - 모바일 화면에서만 표시
				<div class="부트스트랩 그리드">번호</div>
				
				...
				
				<div class="부트스트랩 그리드">조회수</div>
			</div>
			<div class="table-tbody">
				<div class="table-tr-nodata">
					<span>글이 없습니다.</span>	//데이터없음
				</div>
				<div class="table-tr">
					<a href="#">
						<div class="table-td table-td-center 부트스트랩 그리드">	//table-td-center : td중앙정렬
							<p>1</p>												//table-td-left : td왼쪽정렬
						</div>														//table-td-right : td오른쪽정렬
						<div class="table-td table-td-title 부트스트랩 그리드">	//table-td-title : 게시판 제목
							<p>board-td-title (스타일 설정은 부트스트랩 그리드 시스템 이용)</p>
						</div>
						<div class="table-td table-td-center table-xs-left table-xs-sub 부트스트랩 그리드">		//table-xs-sub : 모바일 화면에서 작고 연하게 표시
							<p>col-center</p>
						</div>
						<div class="table-td table-td-center table-xs-right table-xs-sub 부트스트랩 그리드">	//table-xs-right : 모바일 화면에서 td왼쪽정렬
							<p>2017-01-01</p>																	//table-xs-center : 모바일 화면에서 td중앙정렬
						</div>																					//table-xs-left : 모바일 화면에서 td오른쪽정렬
						<div class="table-td table-td-center 부트스트랩 그리드"> 
							<p>3</p>
						</div>
					</a>
				</div>
			</div>
		</div>
		
		<div class="table-comp">		//table-comp : 테이블 아래의 보조내용 전체 (예 : 게시판 아래의 글쓰기, 페이징, 검색폼등...)
			<div class="table-sub">	//table-sub : 테이블 아래의 보조내용 한줄
				...
			</div>
		</div>
	</div>
	 -->
	
	<!-- table(table 태그 이용 버전) -->
	<div class="table-wrap">
		<div class="container">
			<div class="table-box">
				<table class="table-table table-hover">
					<colgroup>
						<col class="col-xs-1">
						<col class="col-xs-6">
						<col class="col-xs-2">
						<col class="col-xs-2">
						<col class="col-xs-1">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" class="table-tr-nodata">
								글이 없습니다.
							</td>
						</tr>
						<tr>
							<th>1</th>
							<td>
								<a href="#">
									table태그를 이용한 테이블
								</a>
							</td>
							<th>글쓴이</th>
							<th>2017-01-01</th>
							<th>5</th>
						</tr>
					</tbody>
				</table>
				<div class="table-comp">
					<!-- 페이징(모바일) -->
					<div class="table-sub visible-xs">
						<ul class="pager">
							<li class="previous disabled">
								<a href="#">
									<i class="fa fa-angle-left"></i>&nbsp;
									이전
								</a>
							</li>
							<li class="current">
								<span>1</span>
							</li>
							<li class="next">
								<a href="#">
									다음&nbsp;
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<div class="table-sub col-xs-12 col-sm-4 col-sm-offset-8 col-md-2 col-md-offset-10">
						<a class="site-btn-submit site-btn-full" href="#" role="button">
							<i class="fa fa-pencil"></i>&nbsp;
							글쓰기
						</a>
					</div>
					
					<!-- 페이징 -->
					<div class="table-sub col-xs-12 hidden-xs">
						<ul class="pagination">
							<li class="disabled">
								<a href="#" aria-label="First">
									<i class="fa fa-angle-double-left"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Previous">
									<i class="fa fa-angle-left"></i>
								</a>
							</li>
							<li>
								<a href="#">
									1
								</a>
							</li>
							<li class="active">
								<a href="#">
									2
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Next">
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
							<li class="disabled">
								<a href="#" aria-label="Last">
									<i class="fa fa-angle-double-right"></i>
								</a>
							</li>
						</ul>
					</div>
					
					<!-- 검색폼 -->
					<div class="form-info form-row">
						<form name="frmBoardSearch" method="get" action="#">
							<div class="col-sm-2 col-sm-offset-2">
								<select class="form-select" name="type">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="name">작성자</option>
								</select>
							</div>
							
							<div class="col-sm-4">
								<input type="text" class="form-text" id="boardSearchKeyword" name="keyword"
									placeholder="Search" value="">
							</div>
							<div class="col-sm-2">
								<input type="submit" class="site-btn-submit site-btn-full" value="검색">
							</div>
						</form>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<!-- form-simple -->
	
	<div class="form-wrap">
		<div class="container">
			<h4>Contact Form</h4>
			<div class="form-simple">
				<form action="#" method="post">
					<input type="text" class="form-text" name="email" placeholder="Name" required="">
					<input type="text" class="form-text" name="email" placeholder="Email" required="">
					<input type="password" name="password" class="form-text" placeholder="Password">
					<input type="password" name="password" class="form-text" placeholder="Confirm Password">
					
					<div class="form-row">
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="Name" required="">
						</div>
						<div class="col-sm-4">
							<input type="email" class="form-text" placeholder="Email" required="">
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-text" placeholder="Telephone" required="">
						</div>
					</div>
					<input type="text" class="form-text" placeholder="Telephone" required="">
					<textarea placeholder="Message" class="form-text" required=""></textarea>
					
					<select class="form-select">
						<option>111</option>
						<option>22222</option>
						<option>3333333</option>
						<option>44444</option>
						<option>555</option>
					</select>

					<div class="form-comp">
						<label class="checkbox-inline">
						  <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
						</label>
						<label class="checkbox-inline">
						  <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
						</label>
						<label class="checkbox-inline">
						  <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
						</label>
					</div>
						
					<div class="form-comp">
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
						</label>
						<label class="radio-inline">
						  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
						</label>
					</div>

					<div class="form-row">
						<div class="col-xs-3">
							<select class="form-select">
								<option>010</option>
								<option>011</option>
								<option>012</option>
								<option>016</option>
								<option>019</option>
							</select>
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
						<span class="form-txt form-static">-</span>
						<div class="col-xs-3">
							<input type="text" class="user form-text">
						</div>
					</div>
					<div class="form-comp-row">
						<div class="col-sm-6">
							<input type="submit" name="Sign In" class="site-btn-submit" value="Sign up">
						</div>
						<div class="col-sm-6">
							<input type="submit" name="cancel" class="site-btn" value="Cancel">
						</div>
					</div>
					
					<div class="form-comp-row">
						<div class="col-sm-6">
							<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="Sign up">
						</div>
						<div class="col-sm-6">
							<input type="submit" name="cancel" class="site-btn site-btn-full" value="Cancel">
						</div>
					</div>

					<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="Sign up">
					
					<div class="signup-text">
						<a href="login.html">Already have an account? Login here.</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- form-info -->
	<div class="form-wrap">
		<div class="container">
			<div class="form-body ">
				<div class="form-heading">
					<h1>Sign up</h1>
				</div>
				<div class="form-info">
					<form action="#" method="post">
						<input type="text" class="form-text" name="email" placeholder="Name" required="">
						<input type="text" class="form-text" name="email" placeholder="Email" required="">
						<input type="password" name="password" class="form-text" placeholder="Password">
						<input type="password" name="password" class="form-text" placeholder="Confirm Password">
						
						<div class="form-row">
							<div class="col-sm-4">
								<input type="text" class="form-text" placeholder="Name" required="">
							</div>
							<div class="col-sm-4">
								<input type="email" class="form-text" placeholder="Email" required="">
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-text" placeholder="Telephone" required="">
							</div>
						</div>
						<input type="text" class="form-text" placeholder="Telephone" required="">
						<textarea placeholder="Message" class="form-text" required=""></textarea>
						
						<select class="form-select">
							<option>111</option>
							<option>22222</option>
							<option>3333333</option>
							<option>44444</option>
							<option>555</option>
						</select>

						<div class="form-comp">
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
							</label>
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
							</label>
							<label class="checkbox-inline">
							  <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
							</label>
						</div>
							
						<div class="form-comp">
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
							</label>
							<label class="radio-inline">
							  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
							</label>
						</div>

						<div class="form-row">
							<div class="col-xs-3">
								<select class="form-select">
									<option>010</option>
									<option>011</option>
									<option>012</option>
									<option>016</option>
									<option>019</option>
								</select>
							</div>
							<span class="form-txt form-static">-</span>
							<div class="col-xs-3">
								<input type="text" class="user form-text">
							</div>
							<span class="form-txt form-static">-</span>
							<div class="col-xs-3">
								<input type="text" class="user form-text">
							</div>
						</div>
						<div class="form-comp-row">
							<div class="col-sm-6">
								<input type="submit" name="Sign In" class="site-btn-submit" value="Sign up">
							</div>
							<div class="col-sm-6">
								<input type="submit" name="cancel" class="site-btn" value="Cancel">
							</div>
						</div>
						
						<div class="form-comp-row">
							<div class="col-sm-6">
								<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="Sign up">
							</div>
							<div class="col-sm-6">
								<input type="submit" name="cancel" class="site-btn site-btn-full" value="Cancel">
							</div>
						</div>

						<input type="submit" name="Sign In" class="site-btn-submit site-btn-full" value="Sign up">
						
						<div class="signup-text">
							<a href="login.html">Already have an account? Login here.</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- //login -->
	<div class="container fadeInUp animated" data-wow-delay=".5s">
		<form>
		<fieldset class='border_fieldset'>
			<legend>자유게시판</legend>
		<table class= 'table tb_hover'>
			<thead class= 'row'>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			<tr>
				<td>5</td>
				<td>여름철 안전하고 ...</td>
				<td>장요한</td>
				<td>2017-12-16</td>
				<td>5</td>
			</tr>
			</tbody>
		</table>
		</fieldset>
		</form>
			<div class='page_div'>
				<ul class= 'pagination'>
					<li><a aria-label='Previous'><i class="fa fa-angle-left"></i></a></li>
					<li><a>1</a></li>
					<li><a>2</a></li>
					<li><a>3</a></li>
					<li><a aria-label='Next'><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
			<div class= 'search_form'>
				<label for='search_condition' class= 'sr-only'>검색</label>
				<select id= 'search_condition' name= 'search_condition'>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
					<option>작성일</option>
				</select>
				<input type='text'><button><span class= 'glyphicon glyphicon-search' /></button>
			</div>
	</div>
	<div class="container fadeInUp animated" data-wow-delay=".5s">
	<div class= 'row col-sm-12'>
		<div class= 'table_div col-sm-12'>
			<div class= 'tr_div row'>
				<div class="th_div col-sm-2 font_size14 text_center border_both">제목</div>
				<div class='td_div col-sm-10 border_right'>아래 40, 41 번 글...</div>
			</div>
			<div class= 'tr_div row'>
				<div class="th_div font_size14 col-sm-2 text_center border_both">작성자</div>
				<div class='td_div col-sm-3'>양**</div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">등록일</div>
				<div class='td_div col-sm-2'>2017-12-16</div>
				<div class="th_div font_size14 col-sm-2 text_center border_both">조회수</div>
				<div class='td_div col-sm-1 border_right'>104</div>
			</div>
			<div class= 'content_detail'>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			아래 40, 41번 글에 대해...<br>
			수개월이 지난...<br>
			<br>
			진행..<br>
			</div>
		</div>
	</div>
	</div>
	<hr>
	<div class="container fadeInUp animated" data-wow-delay=".5s">
		<div class= 'row qna_header'>
		<div class="img_size col-sm-6">
			<h1><a href="index.html" ><img src="images/logo.jpg" alt="" />고객센터</a></h1>
		</div>
		<div class= 'col-sm-1'>&nbsp;</div>
		<div class= 'col-sm-5 search_form'>
			<label for='searchQna'>FAQ 통합검색</label>
			<input type='text'><button><span class= 'glyphicon glyphicon-search' /></button>
		</div>
		</div>
	<div class= 'row col-sm-7'>
		<div class= 'table_div_info col-sm-12'>
			<div class= 'tr_div row'>
				<div class='th_div th_header col-sm-9 font_size14'>자주 찾는 질문 BEST 10</div>
				<div class= 'col-sm-3 pad_t30'><a>더보기</a></div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>1</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>99</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
			<div class= 'tr_div row td_hover'>
				<div class= 'td_div col-sm-3'><span class= 'level'>11</span>오류문의</div>
				<div class= 'td_div col-sm-9'>[알집] 지원하지 않는...</div>
			</div>
		</div>
		<div class= 'help col-sm-7'>
			<img src='images/help.jpg'>
		</div>
		<div class= 'help col-sm-5'>
			<img src='images/help.jpg'>
		</div>
	</div>
	<div class= 'row col-sm-5'>
		<div class= 'info'>
			<div class= 'info_header'>
				<div class= 'th_div col-sm-9 th_header font_size14'>문의안내</div>
				<div class= 'col-sm-3 pad_t30'><a>더보기</a></div>
			</div>
			<div class= 'col-sm-6'>
				<img src='images/question.png'>
				<p>1:1 문의하기</p>
			</div>
			<div class= 'col-sm-6'>
				<img src='images/question2.png'>
				<p>신고하기</p>
			</div>
		</div>		
	</div>
	</div>
	<hr>
	
 <div class="container fadeInUp animated" data-wow-delay=".5s">
  <div class= 'chat_div col-sm-4'>
   <fieldset class='border_fieldset pad_both0'><legend>우리들의 채팅</legend>
    <fieldset class= 'chat_user border_fieldset pad_both0'>
     <legend>유저목록</legend>
     <i class="fa fa-user">난있음</i>
     <i class="fa fa-user user_none">난없음</i>
    </fieldset>
    <fieldset class= 'chat_list border_fieldset pad_both0'>
     <legend>채팅목록</legend>
     <br><input type="hidden" class= 'is_me' value= ''><p class='badge'>장요한曰 : 하이요~</p><span class='chat_time'>11:58</span></p>
     <br><p class= 'badge-you'><p class='badge'>최정규曰 : 안녕안녕!</p><span class='chat_time'>11:59</span></p>
     <br><p class= 'badge-you'><p class='badge'>손성현曰 : 허허허~</p><span class='chat_time'>11:59</span></p>
     <br><p class= 'badge-you'><p class='badge'>김은영曰 : 안녕하세요</p><span class='chat_time'>12:00</span></p>
     <br><p class='badge-me'><p class='badge'>장요한曰 : 잘해봅시다</p><span class='chat_time'>12:01</span></p>
    </fieldset>
   </fieldset>
  </div>
 </div>
<%@ include file="inc/footer.jsp" %>