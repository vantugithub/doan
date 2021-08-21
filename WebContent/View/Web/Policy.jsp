<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Policy</title>
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
<body>

<jsp:include page="Header.jsp"/>
	<div id="page">
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(Template/shop/images/wallpaper-cart.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>POLICY</h1>
						<!-- 	<h2>Free html5 templates by <a href="https://themewagon.com/theme_tag/free/" target="_blank"></a></h2> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	
	<div id="fh5co-product">
		<div class="container policy">
			<p>All orders and purchases made through this website are subject
				to the Online Shopping Terms and Conditions outlined below. These
				Online Shopping Terms and Conditions may change from time to time
				without prior notice, at our discretion.
			</p>
				<p>
				 Please make sure you have
				read our Website Privacy Policy and Terms and Conditions related to
				the use of this Website.
				</p>
				<p>
				 This website is owned and operated by
				Online Therapy Institute in conjunction with its subsidiaries and
				their affiliates. All
				orders and purchases made through the facilities of this website
				shall be subject to these Online Shopping Terms and Conditions.
				</p>
				<p>
				These Online Shopping Terms and Conditions, the use of this website
				and any order or purchase made through the facilities of this
				website shall be governed by the laws of the province of the United
				Kingdom and the laws of the United Kingdom applicable therein.
				</p>
				<p>
				 You
				may only purchase or order items for non-commercial and lawful
				purposes and any other use is not permitted. You agree to pay for
				all charges noted herein as payable by you. You have to be 18 or
				older to purchase from the website.
				</p>
				<div id="dots">...</div>
					<div id="moree">
					<p>
				 All prices listed on
				this website are subject to confirmation. OTI will notify you by
				e-mail within hours of making a purchase if the confirmed price of
				an item you have selected differs from the price listed on the
				website or on your purchase order. If you do not receive an e-mail
				within 24 hours of completing a purchase order, OTI is deemed to
				have confirmed the purchase at the price listed. If you receive such
				notification, the sale will be automatically terminated unless you
				reply by e-mail with confirmation of your intention to purchase the
				item at the confirmed price.
				</p>
				<p>
				 OTI reserves the right to limit the
				quantities of certain items which an individual or any group can
				purchase. OTI will use commercially reasonable efforts to deliver
				items as quickly as possible and within any time periods indicated;
				however, OTI will not be responsible for any delays in delivery
				which are beyond its control. Where delivery is delayed, OTI will
				notify you as soon as possible.</p>
			<h3>Refunds and Cancellations</h3>
			<p>Generally, orders for services may be cancelled for a full
				refund within 24 hours provided the online training course has not
				been accessed or the application for a particular service is not
				already in review.</p>
			<p>Once you purchase a course you are given complete access to
				all the course lessons. Our system tracks logins and access to each
				lesson. Unfortunately we have had to make a firm rule about refunds
				as people have purchased a course, accessed every lesson within a
				matter of minutes or days and then asked for a refund for the
				course. If you find that your experience in the first lesson is not
				what you had anticipated and this is within the first 30 days of
				purchase, a refund will be considered provided no other content has
				been accessed.</p>
			<p>If a course requires an application to be enrolled in the
				course, the application must be received within 30 days. If the
				application is not received within 30 days, a refund will be given
				minus a 10% of total price administration fee.</p>
			<p>Once the application is received and a student is enrolled in
				the course, no refunds will be given.,</p>
				
				
					</div>
				<button onclick="myFunction()" id="myBtn" class="btn">Read more</button>
		</div>
	</div>

<jsp:include page="Footer.jsp"/>
	
	
	<script type="text/javascript">
		
	function myFunction() {
		  var dots = document.getElementById("dots");
		  var moreText = document.getElementById("moree");
		  var btnText = document.getElementById("myBtn");

		  if (dots.style.display === "none") {
		    dots.style.display = "inline";
		    btnText.innerHTML = "Read more";
		    moreText.style.display = "none";
		  } else {
		    dots.style.display = "none";
		    btnText.innerHTML = "Read less";
		    moreText.style.display = "inline";
		  }
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