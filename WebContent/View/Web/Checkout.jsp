<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Out</title>
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

<!-- Modernizr JS -->
<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="Template/Cart/css.css">
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

<!-- Modernizr JS -->
<script src="Template/shop/js/modernizr-2.6.2.min.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("cart") == null)
		response.sendRedirect("/Laptop/");
	if (session.getAttribute("USERMODEL") == null)
		response.sendRedirect("/Laptop/Login");
	%>
	<jsp:include page="Header.jsp" />

	<div class="col-md-4 animate-box" style="margin-left: 20px">
		<%-- <%if(session.getAttribute("successToken") != null)
		%>
 		<div>TOKEN LÀ: <input type="text" value="<%=session.getAttribute("successToken") %>" /> --%>


		<form action="${pageContext.request.contextPath}/success?total=${s}"
			 method="post">
			<div class="row form-group">
				<div class="col-md-12">
					<label for="email">Full name</label> <input type="text"
						value="${myUser.fullName}" name="fullname" class="form-control"
						placeholder="Your full name">
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-12">
					<label for="address">Address</label> <input type="text"
						value="${myUser.address}" name="address" class="form-control"
						placeholder="Your address">
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-12">
					<label for="subject">Phone</label> <input type="text" id="phone"
						value="${myUser.phone}" name="phone" class="form-control"
						placeholder="Your phone">
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-12"></div>
			</div>

			<div>

				<p style="text-align: center;">
					<input type="submit" class="btn btn-success btn-outline"
						value="Place Order" style="margin: 0 auto">
				</p>
		</form>
	</div>
	</div>

	<c:set var="s" value="0"></c:set>

	<div style="width: 60%; float: left; margin-left: 30px">
		<div id="listProduct;" class="row">
			<div id="listProduct">

				<c:if test="${list.size()>0}">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Product</th>
								<th scope="col" id="quantity" class="text-center">Quantity</th>
								<th scope="col" id="price" class="text-right">Price</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="lis">
								<c:set var="s" value="${s + lis.product.price * lis.quantity }"></c:set>

								<tr>
									<td><img class="custom-image"
										src="<%=request.getContextPath()%>/image/${lis.product.image}" />
									</td>
									<td>${lis.product.name}</td>

									<td><input onchange="updateCart(${lis.product.id})"
										id="id=${lis.product.id}" class="number" type="text"
										pattern="[0-9]*" value="${lis.quantity}" /></td>
									<td class="text-right">${lis.product.price}$</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			<div style="text-align: right">
				<c:if test="${list.size()>0}">
					<th colspan="5">Total</th>
					<th><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${s}" /></th>
					<%-- <div>
					<form
						action="${pageContext.request.contextPath}/success?total=${s}"
						method="post">
						<p style="text-align: center;">
							<input type="submit" class="btn btn-success btn-outline"
								value="Checkout" style="margin: 0 auto">
						</p>
					</form>
				</div> --%>
			</div>

			</c:if>
		</div>
		<c:if test="${list.size() <= 0 || list==null}">
			<div class="container">
				<h1 class="jumbotron-heading">No products</h1>
			</div>
		</c:if>

	</div>
	<script>
if ( window.history.replaceState ) {
  window.history.replaceState( null, null, window.location.href );
}
</script>
	<!-- <script>
    (function($){
        $("body").on("submit", ".my-form", function(e){
            e.preventDefault();
            var form = $(e.target);
            $.post( form.attr("action"), form.serialize(), function(res){
                console.log(res);
            });
        });
    )(jQuery);
</script> -->


	<jsp:include page="Footer.jsp" />
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