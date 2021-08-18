<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Font Icon -->
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
					<h2 class="form-title">Sign up</h2>
					<h4 style="color: RED"><%=request.getAttribute("mess") != null ? request.getAttribute("mess") : ""%></h4>
					<form method="POST" name="myForm" class="register-form" id="register-form" action="Register" onsubmit="return validate()">
					
					
						<label class="form-group" id="errorName" style="color:red;"></label>
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="fullname" id="name" placeholder="Your Full Name" required />
						</div>
						
						<label class="form-group" id="errorEmail" style="color:red;"></label>
						<div class="form-group">
							<label for="email"><i class="zmdi zmdi-email"></i></label> <input
								type="email" name="email" id="email" placeholder="Your Email" required/>
								<p id="Inv_email" class="invalid" style="color: red;"></p>
						</div>
						
						<label class="form-group" id="errorPass1" style="color:red;"></label>
						<div class="form-group">
							<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
								type="password" name="password" id="password1" placeholder="Password" required/>
						</div>
						
						<label class="form-group" id="errorPass2" style="color:red;"></label>
						<div class="form-group">
							<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
								type="password" name="password" id="password2" placeholder="Password" required/>
						</div>
						
						<label class="form-group" id="errorAddress" style="color:red;"></label>
						<div class="form-group">
							<label for="add"><i class="zmdi zmdi-lock"></i></label> <input
								type="text" name="address" id="address" placeholder="Address" required/>
						</div>
						
						<label class="form-group" id="errorPhone" style="color:red;"></label>
						<div class="form-group">
							<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
								type="text" name="phone" id="phone" placeholder="Phone" required/>
						</div>
						
						<div class="form-group form-button">
							<input type="submit" name="signup" id="signup"
								class="form-submit" value="Register" />
						</div>
					</form>
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
	<script type="text/javascript">
	
	function validate() {
		var password1 = document.getElementById("password1").value;
		var password2 = document.getElementById("password2").value;
		
			if(password1.length < 6) {
			document.getElementById("errorPass1").innerHTML="Must be at least 6 characters";
			return false;
			}
			if(password1.length >= 6){
				document.getElementById("errorPass1").innerHTML="";
			}
			if(password1 != password2) {
				document.getElementById("errorPass2").innerHTML="Password must be same!";
				return false;
			}
	}
	
	</script>
	<script src="Template/Login/vendor/jquery/jquery.min.js"></script>
	<script src="Template/Login/js/main.js"></script>
</body>
</html>