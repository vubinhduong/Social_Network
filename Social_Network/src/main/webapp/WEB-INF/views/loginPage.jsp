<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>" />
<title>Đăng nhập</title>
</head>

<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<form action="/School_Social_Network/homepage" class="sign-in-form">
					<h2 class="title">Đăng nhập</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text"
							placeholder="Username" name="username" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password"
							placeholder="Password" name="password" />
					</div>
					<input class="btn solid" type="submit" value="Login" />
					<p class="social-text">Hoặc đăng nhập với</p>
					<div class="social-media">
						<a href="#" class="social-icon"> <i class="fab fa-google"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-facebook-f"></i>
						</a>
					</div>
				</form>
				<form action="#" class="sign-up-form">
					<h2 class="title">Đăng ký</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text"
							placeholder="Username" />
					</div>
					<div class="input-field">
						<i class="fas fa-envelope"></i> <input type="email"
							placeholder="Email" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password"
							placeholder="Password" />
					</div>
					<div class="input-field">
						<i class="fas fa-lock"></i> <input type="password"
							placeholder="Confirm Password" />
					</div>
					<input type="submit" class="btn" value="Sign up" />
					<p class="social-text">Hoặc đăng ký với</p>
					<div class="social-media">
						<a href="#" class="social-icon"> <i class="fab fa-google"></i>
						</a> <a href="#" class="social-icon"> <i class="fab fa-facebook-f"></i>
						</a>
					</div>
				</form>
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>Chưa có tài khoản ?</h3>
					<p>Đăng ký nhanh chóng, thuận tiện chỉ với 1 phút</p>
					<button class="btn transparent" id="sign-up-btn">Sign up</button>
				</div>
				<img src="<c:url value="/resources/images/login.svg"/>"
					class="image" alt="" />
			</div>
			<div class="panel right-panel">
				<div class="content">
					<h3>Đã có tài khoản ?</h3>
					<p></p>
					<button class="btn transparent" id="sign-in-btn">Sign in</button>
				</div>
				<img src="<c:url value="/resources/images/register.svg"/>"
					class="image" alt="" />
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/login.js"/>" src="app.js"></script>
</body>
</html>
