<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

	<!-- login -->
	
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
	
	<!-- login -->
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