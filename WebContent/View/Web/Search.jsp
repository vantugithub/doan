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
	<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<div class="fh5co-loader"></div>
	<div id="page">
	
	<jsp:include page="Header.jsp"/>
 	<div id="fh5co-product" style="padding: 0">
<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(Template/shop/images/wallpaper-cart.jpg); height: 80px">
		<div class="container">
			<div class="">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1 style="font-size: 40px">Search results</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
		<div style="height: 120px">
		
				</div>
						<div class="container">
						<select id="sorting" class="btn" onchange="selectionChange()">
						<option value="Sort By">Sort by price</option>
					      <option value="Sort By Price low to high" id="price">Low to high</option>
					      <option value="Sort By Price high to low" id="az">High to low</option>
						</select>
				</div>
		
 		<div class="container">
 		
 						
						
			<div class="row sort_price">
							
				<c:forEach var="lis" items="${list}">
			
				<div class="col-md-4 text-center animate-box temp_price">
					<div class="product">
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
				
				</c:forEach>
			</div>
			
			
		</div>
	</div>


	<jsp:include page="Footer.jsp"/>
	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<script>
	
	sortHelper = function(searchh, comparator) {
	    $('.temp_price').each(function() {
	        var data = $(this).find(searchh).text();
	        $(this).attr('data-name', data);
	    });

	    var $products = $('.sort_price'),
	        $singleProduct = $('.temp_price');

	    $singleProduct.sort(comparator);
	    

	    $singleProduct.detach().appendTo($products);
	};
	
	var cmpPriceToHigh = function(a, b) {
	    var an = a.getAttribute('data-name');
	    var bn = b.getAttribute('data-name');
	    var numberA = Number(an.replace(/[^0-9\.]+/g, ""));
	    var numberB = Number(bn.replace(/[^0-9\.]+/g, ""));
	    return numberA - numberB;
	};
	
	var cmpPriceToLow = function(a, b) {
	    var an = a.getAttribute('data-name');
	    var bn = b.getAttribute('data-name');
	    var numberA = Number(an.replace(/[^0-9\.]+/g, ""));
	    var numberB = Number(bn.replace(/[^0-9\.]+/g, ""));
	    return numberB - numberA;
	};
	
	var cmpName = function(a, b) {
	    var an = a.getAttribute('data-name');
	    var bn = b.getAttribute('data-name');
	    if (an > bn) {
	        return 1;
	    }
	    if (an < bn) {
	        return -1;
	    }
	    return 0;
	};
	
	var cmpNameDesc = function(a, b) {
	    return cmpName(b, a);
	};
	
	
	selectionChange = function() {
	    var selectResult = $("#sorting").val();

	    if (selectResult == "Sort By Price low to high") {
	        sortHelper('.price', cmpPriceToHigh);
	    } else if (selectResult == "Sort By Price high to low") {
	    	 sortHelper('.price', cmpPriceToLow);
	    } else if (selectResult == "Sort By Z-A") {
	        sortHelper('.sort1', cmpNameDesc);
	    }
	};
	
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