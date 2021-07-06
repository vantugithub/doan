<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Email</title>
<link rel="stylesheet"
	href="Template/Login/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="Template/Login/css/style.css">
</head>
<body>
<div class="main">
		<div class="container">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title" style="padding-top: 100px;  margin-bottom: 0px">Account is exist</h2>
							<input type="hidden" name="username" value=<%= request.getAttribute("username") %> />
						<div class="form-group form-button" style="text-align: center">
							 
							<a href="/Laptop/Register"  type="submit" class="signup-image-link"><input type="submit" name="signup" id="signup"
								class="form-submit" value="Register" /></a>
								
						</div>
				</div>
				<div class="signup-image">
					<figure>
						<img src="Template/Login/images/signup-image.jpg"
							alt="sing up image">
					</figure>
				</div>
			</div>
		</div>
	</div>
	<!-- JS -->
	<script src="Template/Login/vendor/jquery/jquery.min.js"></script>
	<script src="Template/Login/js/main.js"></script>
</body>
</html>