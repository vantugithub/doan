<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Profile</title>
<!-- Animate.css -->
	<link rel="stylesheet" href="Template/shop/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="Template/shop/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="Template/shop/css/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="Template/shop/css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="Template/shop/css/owl.carousel.min.css">
	<link rel="stylesheet" href="Template/shop/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="Template/shop/css/style.css">

	<!-- Modernizr JS -->
	<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="Template/Cart/css.css">
</head>
<body class="">
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("USERMODEL")==null)
    response.sendRedirect("/Laptop/Login");

if(session.getAttribute("USERMODEL")!=null) {
	MyUser myUser =(MyUser) session.getAttribute("USERMODEL");
	Role role = myUser.getRole();
	if(role.getRoleName().equals("ROLE_USER")==false){
		response.sendRedirect("/Laptop/Login");
	}
}
%>
<jsp:include page="Header.jsp"/>
	
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(Template/shop/images/profile.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Your Profile</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	
	<div id="">
	<div id="fh5co-product">
		<div class="container">
			
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box">
						<ul class="fh5co-tab-nav">
							<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">Your Profile</span></a></li>
							<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-bar-graph"></i></span><span class="hidden-xs">Order History</span></a></li>
						</ul>

						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">

							<div  class="fh5co-tab-content tab-content active" data-tab-content="1">
									
									
					<div id="information" class="col-md-5 col-md-push-1 animate-box">
					
					<div class="fh5co-contact-info">
					
						<h3>Your Information</h3>
						<ul>
							<li class="address">${myUser.address}</li>
							<li class="phone"><a href="#">${myUser.phone}</a></li>
							<li class="email"><a href="#">${myUser.username}</a></li>
							<li class="url"><a href="#">${myUser.fullName}</a></li>
						</ul>
						<div class="form-group">
						
							<input type="submit" value="Change password" class="btn btn-danger">
						</div>
						
					</div>

				</div>
					
					<div class="col-md-6 animate-box">
					
<!-- 					<h3>Get In Touch</h3> -->
					<form>
						
						<div class="row form-group">
							<div class="col-md-12">
								 <label for="email">Full name</label> 
								<input type="text" value="${myUser.fullName}" id="fullname" class="form-control" placeholder="Your full name">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								 <label for="address">Address</label> 
								<input type="text" value="${myUser.address}" id="address" class="form-control" placeholder="Your address">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
							 <label for="subject">Phone</label> 
								<input type="text" id="phone" value="${myUser.phone}" name="phone" class="form-control" placeholder="Your phone">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<!-- <label for="message">Message</label> -->
							</div>
						</div>
						<div class="form-group">
							<input type="button" onclick="updateUser()" value="Update information" class="btn btn-primary">
						</div>

					</form>
					
				</div>
					
									

							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="2">
									
									
									<h3>Your Order History</h3>
									<ul>
										<li>Paragraph placeat quis fugiat provident veritatis quia iure a debitis adipisci dignissimos consectetur magni quas eius</li>
										<li>adipisci dignissimos consectetur magni quas eius nobis reprehenderit soluta eligendi</li>
										<li>Veritatis tenetur odio delectus quibusdam officiis est.</li>
										<li>Magni quas eius nobis reprehenderit soluta eligendi quo reiciendis fugit? Veritatis tenetur odio delectus quibusdam officiis est.</li>
									</ul>
									
							</div>
							
							
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<div id="page">
<jsp:include page="Footer.jsp"/>
	</div>
	
	<script type="text/javascript">
		function updateUser() {
				var xhttp;
				var fullname = document.getElementById("fullname").value;
				var address = document.getElementById("address").value;
				var phone = document.getElementById("phone").value;
				var url = "/Laptop/profile/update?fullname="+fullname+"&address="+address+"&phone="+phone;
				
				if (window.XMLHttpRequest) {
					xhttp = new XMLHttpRequest();
				} else {
					xhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}

				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4) {
						var data = xhttp.responseText;
						document.getElementById("information").innerHTML = data; 
					}
				}
				xhttp.open("POST", url, true);
				xhttp.send();
		}
		</script>
	
	
<!-- jQuery -->
	<script src="Template/shop/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="Template/shop/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="Template/shop/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="Template/shop/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="Template/shop/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="Template/shop/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="Template/shop/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="Template/shop/js/main.js"></script>	
</body>
</html>