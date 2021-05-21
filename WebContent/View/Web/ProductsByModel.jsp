<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
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

</head>
<body>

<div class="fh5co-loader"></div>
	<div id="page">
	
	<jsp:include page="Header.jsp"/>
	<div id="fh5co-product">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Products</h2>
				</div>
			</div>
			<div class="row">
				
				<c:forEach var="lis" items="${list}">
			
				<div class="col-md-4 text-center animate-box">
					<div class="product">
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
						<img class="product-grid" src="<%=request.getContextPath()%>/image/${lis.image}">
							<!-- <div class="inner">
								<p>
									<a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
									<a href="single.html" class="icon"><i class="icon-eye"></i></a>
								</p>
							</div> -->
						</img>
					</a>
						<div class="desc">
							<h3><a href="single.html">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				
				</c:forEach>
				<!-- <div class="col-md-4 text-center animate-box">
					<div class="product">
						<div class="product-grid" style="background-image:url(Template/shop/images/product-2.jpg);">
							<span class="sale">Sale</span>
							<div class="inner">
								<p>
									<a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
									<a href="single.html" class="icon"><i class="icon-eye"></i></a>
								</p>
							</div>
						</div>
						<div class="desc">
							<h3><a href="single.html">Pavilion Speaker</a></h3>
							<span class="price">$600</span>
						</div>
					</div>
				</div>
			
				 -->
			</div>
		</div>
	</div>

	<div id="fh5co-services" class="fh5co-bg-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-credit-card"></i>
						</span>
						<h3>Credit Card</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-wallet"></i>
						</span>
						<h3>Save Money</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-paper-plane"></i>
						</span>
						<h3>Free Delivery</h3>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	


	<jsp:include page="Footer.jsp"/>
	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
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