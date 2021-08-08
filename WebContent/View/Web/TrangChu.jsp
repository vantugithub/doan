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
	<link rel="stylesheet" href="Template/shop/css/vuong.css">

	<!-- Modernizr JS -->
<!-- 	<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>
 -->	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css">

</head>
<body>

<div class="fh5co-loader"></div>
	<div id="page">
	
	<jsp:include page="Header.jsp"/>
	
	<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides ">
		   	<li style="background-image: url(Template/shop/images/banner.jpg);">
		   		<!-- <div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<span class="price">$800</span>
		   						<h2>Alato Cabinet</h2>
		   						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
			   					<p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div> -->
		   	</li>
		   	 <li style="background-image: url(Template/shop/images/banner1.jpg);">
		   		<!-- <div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<span class="price">$530</span>
		   						<h2>The Haluz Rocking Chair</h2>
		   						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
			   					<p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div> -->
		   	</li>
		   	<li style="background-image: url(Template/shop/images/Banner-LG.jpg);">
		   		<!-- <div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<span class="price">$750</span>
		   						<h2>Alato Cabinet</h2>
		   						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
			   					<p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div> -->
		   	</li>
		   	<li style="background-image: url(Template/shop/images/Banner-MacBookPro-M1.jpg);">
		   		<!-- <div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<span class="price">$540</span>
		   						<h2>The WW Chair</h2>
		   						<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
			   					<p><a href="single.html" class="btn btn-primary btn-outline btn-lg">Purchase Now</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div> -->
		   	</li>
		  	</ul>
	  	</div>
	</aside>

	
	
	<div id="fh5co-product" style="padding: 3em">
		<div class="container" style="width: 1200px">
			
			<h3 style="float: left; margin-right: 900px;">MACBOOK</h3>
			<a href="<%=request.getContextPath()%>/Brands?brand=Macbook" style="font-size:17px">Xem chi tiết</a>
			<hr>
			<div class="row">
				<ul class="autoplay">
				<c:forEach var="lis" items="${list}">
			<li>
				<div class="col-md-12 text-center animate-box" >
					<div class="product"  >
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
					<div class="product-grid khoi3" style="background-image:url(<%=request.getContextPath()%>/image/${lis.image});">	
						</div>
					</a>
						<div class="desc">
							<h3><a href="<%=request.getContextPath()%>/lap?name=${lis.name}">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				</li>
				</c:forEach>
				
			</ul>
			</div>
			
			<h3 style="float: left; margin-right: 950px;">ASUS</h3>
			<a href="<%=request.getContextPath()%>/Brands?brand=Asus" style="font-size:17px">Xem chi tiết</a>
			<hr>
			<div class="row">
				<ul class="autoplay">
				<c:forEach var="lis" items="${listAsus}">
			<li>
				<div class="col-md-12 text-center animate-box" >
					<div class="product"  >
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
					<div class="product-grid khoi3" style="background-image:url(<%=request.getContextPath()%>/image/${lis.image});">	
						</div>
					</a>
						<div class="desc">
							<h3><a href="<%=request.getContextPath()%>/lap?name=${lis.name}">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				</li>
				</c:forEach>
				
			</ul>
			</div>
			
			<h3 style="float: left; margin-right: 950px;">DELL</h3>
			<a href="<%=request.getContextPath()%>/Brands?brand=Dell" style="font-size:17px">Xem chi tiết</a>
			<hr>
			<div class="row">
				<ul class="autoplay">
				<c:forEach var="lis" items="${listDell}">
			<li>
				<div class="col-md-12 text-center animate-box" >
					<div class="product"  >
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
					<div class="product-grid khoi3" style="background-image:url(<%=request.getContextPath()%>/image/${lis.image});">	
						</div>
					</a>
						<div class="desc">
							<h3><a href="<%=request.getContextPath()%>/lap?name=${lis.name}">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				</li>
				</c:forEach>
				
			</ul>
			</div>
			
			
			
			<h3 style="float: left; margin-right: 920px;">LENOVO</h3>
			<a href="<%=request.getContextPath()%>/Brands?brand=Lenovo" style="font-size:17px">Xem chi tiết</a>
			<hr>
			<div class="row">
				<ul class="autoplay">
				<c:forEach var="lis" items="${listLenovo}">
			<li>
				<div class="col-md-12 text-center animate-box" >
					<div class="product"  >
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
					<div class="product-grid khoi3" style="background-image:url(<%=request.getContextPath()%>/image/${lis.image});">	
						</div>
					</a>
						<div class="desc">
							<h3><a href="<%=request.getContextPath()%>/lap?name=${lis.name}">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				</li>
				</c:forEach>
				
			</ul>
			</div>
			
			<h3 style="float: left; margin-right: 990px;">HP</h3>
			<a href="<%=request.getContextPath()%>/Brands?brand=Hp" style="font-size:17px">Xem chi tiết</a>
			<hr>
			<div class="row">
				<ul class="autoplay">
				<c:forEach var="lis" items="${listHp}">
			<li>
				<div class="col-md-12 text-center animate-box" >
					<div class="product"  >
					<a href="<%=request.getContextPath()%>/lap?name=${lis.name}">
					<div class="product-grid khoi3" style="background-image:url(<%=request.getContextPath()%>/image/${lis.image});">	
						</div>
					</a>
						<div class="desc">
							<h3><a href="<%=request.getContextPath()%>/lap?name=${lis.name}">${lis.name}</a></h3>
							<span class="price">$${lis.price}</span>
						</div>
					</div>
				</div>
				</li>
				</c:forEach>
				
			</ul>
			</div>
		</div>
	</div>
	
	<div id="fh5co-services" class="fh5co-bg-section" style="padding: 0em">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn" style="margin-top: 40px">
						<span class="icon">
							<i class="icon-credit-card"></i>
						</span>
						<h3>Credit Card</h3>
 						<p> We allow you to make credit card bill payment for the Visa, Master and another.</p>
 						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn" style="margin-top: 40px">
						<span class="icon">
							<i class="icon-wallet"></i>
						</span>
						<h3>Save Money</h3>
 						<p>They enjoy perks like 5% off almost any item, exclusive sales, and free returns on all orders. </p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn" style="margin-top: 40px">
						<span class="icon">
							<i class="icon-paper-plane"></i>
						</span>
						<h3>Free Delivery</h3>
 						<p> To an address of your choice when you spend $1000 or more in a single transaction.</p>
 						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <!-- <div id="fh5co-testimonial" class="fh5co-bg-section">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<span>Testimony</span>
					<h2>Happy Clients</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-md-offset-1">
					<div class="row animate-box">
						<div class="owl-carousel owl-carousel-fullwidth">
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="Template/shop/images/person1.jpg" alt="user">
									</figure>
									<span>Jean Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="Template/shop/images/person2.jpg" alt="user">
									</figure>
									<span>John Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="Template/shop/images/person3.jpg" alt="user">
									</figure>
									<span>John Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>  -->
	

	<!-- <div id="fh5co-counter" class="fh5co-bg fh5co-counter" style="background-image:url(images/img_bg_5.jpg);">
		<div class="container">
			<div class="row">
				<div class="display-t">
					<div class="display-tc">
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-eye"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="22070" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">Creativity Fuel</span>

							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-shopping-cart"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="450" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">Happy Clients</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-shop"></i>
								</span>
								<span class="counter js-counter" data-from="0" data-to="700" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">All Products</span>
							</div>
						</div>
						<div class="col-md-3 col-sm-6 animate-box">
							<div class="feature-center">
								<span class="icon">
									<i class="icon-clock"></i>
								</span>

								<span class="counter js-counter" data-from="0" data-to="5605" data-speed="5000" data-refresh-interval="50">1</span>
								<span class="counter-label">Hours Spent</span>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	

	<jsp:include page="Footer.jsp"/>
	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<script>
	$('.autoplay').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
 		  variableWidth: true,
 		  autoplay: true,
		  autoplaySpeed: 1800,
		  prevArrow: false,
		  nextArrow: false,
		});
	</script>
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