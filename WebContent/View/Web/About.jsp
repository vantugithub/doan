<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
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
	<div id="page" class="policy">
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(Template/shop/images/wallpaper-cart.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>ABOUT</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	 
	
	<!-- <div id="fh5co-product"> -->
<!-- 		<div class="container">
 -->			<nav class="navbar navbar-expand-lg navbar-light bg-light py-3">
 <!--  <div class="container"><a href="#" class="navbar-brand d-flex align-items-center"> <i class="fa fa-snowflake-o fa-lg text-primary mr-2"></i><strong>Snowflake</strong></a>
   
  </div> -->
</nav>

<div class="bg-light">
  <div class="container py-5">
    <div class="row h-100 align-items-center py-5">
      <div class="col-lg-6">
       
      </div>
      <div class="col-lg-6 d-none d-lg-block"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/illus_kftyh4.png" alt="" class="img-fluid"></div>
    </div>
  </div>
</div>

<div class="bg-white py-5">
  <div class="container py-5">
    <div class="row align-items-center mb-5"  style="margin-top: 20px">
      <div class="col-lg-6 order-2 order-lg-1">
        <h2 class="font-weight-light">Our Story</h2>
        <p class="font-italic text-muted mb-4">This is where you tell the story of your brand. Iconic brands such as Disney and Coca-Cola have long realized the power of their brand story to build a connection with their audience. Companies like Apple possess brand stories that are legendary in their status.</p>
        <br>
        <p>
        What’s in a story, though? How does the story develop authenticity? More to the point, how does such a story create that trusting feeling that customers crave?
        </p>
      </div>
       <div class="col-lg-6 order-2 order-lg-1">
       <img src="Template/shop/images/laptop.jpg" style="width: 100%">
      </div>
    </div>
    <!-- <div class="row align-items-center">
      <div class="col-lg-5 px-5 mx-auto"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/img-2_vdgqgn.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
      <div class="col-lg-6">
        <h2 class="font-weight-light">Our Mission</h2>
        <p class="font-italic text-muted mb-4">This is where you tell your story as a founder. It’s the story of you, your mission, and how your brand brings your mission to life. Overlook it and you risk having a forgettable brand in a sea of products. Craft it carefully, and you can create a powerful narrative that touches and inspires people.</p>
      </div>
      <div class="col-lg-6 order-2 order-lg-1">
       <img src="Template/shop/images/laptop2.jpeg" style="width: 100%">
      </div>
    </div> -->
     <div class="row align-items-center mb-5"  style="margin-top: 80px; margin-bottom: 100px">
      <div class="col-lg-6 order-2 order-lg-1">
        <img src="Template/shop/images/laptop2.jpeg" style="width: 100%">
      </div>
       <div class="col-lg-6 order-2 order-lg-1">
               <h2 class="font-weight-light">Our Mission</h2>
        <p class="font-italic text-muted mb-4">This is where you tell your story as a founder. It’s the story of you, your mission, and how your brand brings your mission to life. Overlook it and you risk having a forgettable brand in a sea of products. Craft it carefully, and you can create a powerful narrative that touches and inspires people.</p>
      </div>
    </div>
  </div>
</div>

</div>

          <ul class="social mb-0 list-inline mt-3" style="text-align: center;margin: 50px">
            <li class="list-inline-item li-about"  ><img src="Template/shop/images/asus.png" class="about"></li>
            <li class="list-inline-item li-about" ><img src="Template/shop/images/dell.png" class="about"></li>
            <li class="list-inline-item li-about" ><img src="Template/shop/images/msi.png" class="about"></li>
            <li class="list-inline-item li-about" ><img src="Template/shop/images/apple.png" class="about"></li>
            <li class="list-inline-item li-about" ><img src="Template/shop/images/rog.jpg" class="about"></li>
            <li class="list-inline-item li-about" ><img src="Template/shop/images/thinkpad.jpg" class="about"></li>
            <li class="list-inline-item" ><img src="Template/shop/images/hp.png" class="about"></li>
          </ul>
     
  
<jsp:include page="Footer.jsp"/>
	
	
	<script type="text/javascript">
		
		function updateCart(idProduct) {
			var quantityProduct = document.getElementById('id='+idProduct).value;
				
				var xhttp;
				var url = "/Laptop/updatecart?idProduct="+idProduct+"&quantityProduct="+quantityProduct;
				var quantity = parseInt(document.getElementById("quantity"));
				/* document.getElementById("price").innerHTML = quantity  */
				if (window.XMLHttpRequest) {
					xhttp = new XMLHttpRequest();
				} else {
					xhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}

				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4) {
						var data = xhttp.responseText;
						/* document.getElementById("users").innerHTML = data; */
					}
				}
				xhttp.open("POST", url, true);
				xhttp.send();
		}
		
		function deleteProduct(idProduct) {
				var xhttp;
				var url = "/Laptop/deleteproduct?idProduct="+idProduct;
				
				if (window.XMLHttpRequest) {
					xhttp = new XMLHttpRequest();
				} else {
					xhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}

				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4) {
						var data = xhttp.responseText;
						document.getElementById("listProduct").innerHTML = data; 
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