<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<link rel="stylesheet" href="Template/shop/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="Template/shop/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="Template/shop/css/bootstrap.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="Template/shop/css/flexslider.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="Template/shop/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="Template/shop/css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="Template/shop/css/style.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<!-- Modernizr JS -->
<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
 
	<div id="page">

		<jsp:include page="Header.jsp" />
					<hr>
		
		<div class="jumbotron text-center" style="background: white; color: rgba(0, 0, 0, 0.5)">
			<h1 class="display-3" style="color: black">Thank You!</h1>
			<p class="lead">
				<strong>Thank you for purchasing from us</strong>
			</p>
			<div class="lead" style="color: #33cc00; font-size:50px"><i class="fas fa-check" ></i></div>
			
			<p class="lead">
				<a class="btn btn-primary btn-sm"
					href="/Laptop" role="button">Continue shopping</a>
			</p>
		</div>
		<jsp:include page="Footer.jsp" />
	</div>

</body>
</html>