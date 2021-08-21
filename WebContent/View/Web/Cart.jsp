<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>
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
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("cart") == null)
		response.sendRedirect("/Laptop/");
	%>
<jsp:include page="Header.jsp"/>
	<div id="page">
	
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(Template/shop/images/wallpaper-cart.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Cart</h1>
						<!-- 	<h2>Free html5 templates by <a href="https://themewagon.com/theme_tag/free/" target="_blank"></a></h2> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	
	<div id="fh5co-product">
		<div class="container">
		    			<c:set var="s" value="0"></c:set>
		
<div class="container mb-4">
    <div id="listProduct" class="row">
    <div id="listProduct">
    
        		<c:if test="${list.size()>0}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Price</th>
                            <th scope="col" id="quantity" class="text-center">Quantity</th>
                            <th scope="col" id="price" class="text-right">Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                          
                    <c:forEach items="${list}" var="lis">
                    <c:set var="s" value="${s + lis.product.price * lis.quantity }"></c:set>
                    
                        <tr>
                            <td><img class="custom-image" src="<%=request.getContextPath()%>/image/${lis.product.image}" /> </td>
                            <td>${lis.product.name}</td>
                            <td id="priceProduct_${lis.product.id}">$${lis.product.price}</td>
                            <td><input onchange="updateCart(${lis.product.id})" id="id=${lis.product.id}" class="number" type="text"pattern="[0-9]*" value="${lis.quantity}" /></td>
                            <td  id="totalPriceProduct_${lis.product.id}" class="text-right">$${lis.product.price*lis.quantity}</td>
                            <td class="text-right"><button class="btn btn-sm btn-danger" onclick="deleteProduct(${lis.product.id})"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                     </c:forEach>
                    </tbody>
                </table>
             </c:if>
             </div>
        <div id="" class=""></div>
		<div class="container">
			<div class="row" style="text-align: center">
			</div>	
				
		</div>
		   
		
				<c:if test="${list.size()>0}">
				
				<div >
				
					<form action="${pageContext.request.contextPath}/checkout?total=${s}"
						method="post" >
						<p style="text-align: center"><input type="submit" class="btn btn-success btn-outline" value="Checkout"
							style="margin: 0 auto"></p>
					</form>
				</div>
					 </div>
				
				</c:if>
				<c:if test="${list.size() <= 0 || list==null}">
				<div class="container">
        				<h1 class="jumbotron-heading">No products</h1>
    			 </div>
				</c:if>				
			
</div>
</div>
</div>
</div>

<jsp:include page="Footer.jsp"/>
	
	
	<script type="text/javascript">
	
		function updatePriceForProduct(idProduct){

			var quantityProduct = document.getElementById('id='+idProduct).value;
			var priceProductText = document.getElementById('priceProduct_'+idProduct).innerHTML.replace('$','');
			var price = Number(priceProductText);
			var total_price = price*quantityProduct;
			 document.getElementById('totalPriceProduct_'+idProduct).innerHTML ="$"+ total_price;
		}
		
		function updateTotalPrice()
		{
						
		}
		
		
		
		function updateCart(idProduct) {
			var quantityProduct = document.getElementById('id='+idProduct).value;
			
				var xhttp;
				var url = "/Laptop/updatecart?idProduct="+idProduct+"&quantityProduct="+quantityProduct;
				var quantity = parseInt(document.getElementById("quantity"));
				updatePriceForProduct(idProduct);
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