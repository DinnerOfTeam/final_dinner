<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>    
    
<!-- login -->
	<div class="login">
		<div class="container">
			<div class="login-body">
				<div class="login-heading2 w3layouts">
					<h1>회원가입</h1>
				</div>
				<div class="login-info">
					<form action="#" method="post">
						<input type="text" class="user" name="email" placeholder="Name" required="">
						<input type="text" class="user" name="email" placeholder="Email" required="">
						<input type="password" name="password" class="lock" placeholder="Password">
						<input type="password" name="password" class="lock" placeholder="Confirm Password">
						<input type="submit" name="Sign In" value="회원가입">
						<div class="signup-text">
							<a href="login.jsp">로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	
<%@include file="inc/footer.jsp"  %>