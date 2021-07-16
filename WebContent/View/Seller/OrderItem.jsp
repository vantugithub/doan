<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="<%=request.getContextPath()%>/Template/Admin/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Template/Admin/img/favicon.png">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>Product</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link
	href="<%=request.getContextPath()%>/Template/Admin/css/nucleo-icons.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link
	href="<%=request.getContextPath()%>/Template/Admin/css/black-dashboard.css?v=1.0.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="<%=request.getContextPath()%>/Template/Admin/demo/demo.css"
	rel="stylesheet" />
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("USERMODEL") == null)
		response.sendRedirect("/Laptop/Login");
	if (session.getAttribute("USERMODEL") != null) {
		MyUser myUser = (MyUser) session.getAttribute("USERMODEL");
		Role role = myUser.getRole();
		if (role.getRoleName().equals("ROLE_SELLER") == false) {
			response.sendRedirect("/Laptop/Login");
		}
	}
	%>


	<div class="wrapper">

		<!-- Begin menu -->
		<jsp:include page="Menu.jsp" />
		<!-- End menu -->

		<div class="main-panel" data="blue">


			<!-- Begin Header -->
			<jsp:include page="Header.jsp" />
			<!--  End Header -->


			<div class="content">
				<div class="row">
					<div class="col-md-12">

						<div class="card ">
							<div class="card-header">
							</div>
							<c:forEach items="${list2}" var="lis2">
								<div class="card-body">
									<div  style="margin: auto">
									<table style="margin-left:150px; color: rgba(255, 255, 255, 0.7)"  >
										<tr >
											<th style="padding-right: 20px" >Fullname</th>
											<td>${lis2.name}</td>
										</tr>
										<tr>
											<th>Phone </th>
											<td>${lis2.phone}</td>
										</tr>
										<tr>
											<th>Address</th>
											<td>${lis2.address}</td>
										</tr>
									</table>
									</div>
							</c:forEach>
							<div class="card-body">

								<div class="">
									<table class="table tablesorter " id="">

										<thead class=" text-primary">
											<tr>
												<th>Name</th>
												<th>Quantity</th>
												<th>Price</th>

											</tr>
										</thead>

										<tbody>

											<c:forEach items="${list}" var="lis">
												<tr>
													<td>${lis.product.name}</td>
													<td>${lis.quantity}</td>
													<td>${lis.price}</td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
									<div style="text-align: right; padding-right: 140px">
									<c:forEach items="${list2}" var="lis2">
										<h4><b>Total:</b> ${lis2.total}</h4>
									</c:forEach>
								</div>
									<%
									if (request.getParameter("change") != null) {
									%>
									<div style="text-align: center">
										<button class="btn btn-success" data-toggle="modal"
											data-target="#exampleModal">
											<a
												href="/Laptop/seller/acceptOrder?orderId=<%=request.getParameter("id")%>"
												style="color: white">Accept</a>
										</button>
										<button class="btn btn-primary" data-toggle="modal"
											data-target="#exampleModal">
											<a
												href="/Laptop/seller/cancelOrder?orderId=<%=request.getParameter("id")%>"
												style="color: white">Cancel</a>
										</button>
									</div>
									<%
									}
									%>
								</div>
							</div>

							<div></div>
						</div>
					</div>
				</div>
			</div>
			<!--Begin footer -->
			<jsp:include page="Footer.jsp" />
			<!-- End Footer -->
		</div>
	</div>





	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/core/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/core/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/core/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Place this tag in your head or just before your close body tag. -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="<%=request.getContextPath()%>/Template/Admin/js/black-dashboard.min.js?v=1.0.0"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=request.getContextPath()%>/Template/Admin/demo/demo.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$()
									.ready(
											function() {
												$sidebar = $('.sidebar');
												$navbar = $('.navbar');
												$main_panel = $('.main-panel');

												$full_page = $('.full-page');

												$sidebar_responsive = $('body > .navbar-collapse');
												sidebar_mini_active = true;
												white_color = false;

												window_width = $(window)
														.width();

												fixed_plugin_open = $(
														'.sidebar .sidebar-wrapper .nav li.active a p')
														.html();

												$('.fixed-plugin a')
														.click(
																function(event) {
																	if ($(this)
																			.hasClass(
																					'switch-trigger')) {
																		if (event.stopPropagation) {
																			event
																					.stopPropagation();
																		} else if (window.event) {
																			window.event.cancelBubble = true;
																		}
																	}
																});

												$(
														'.fixed-plugin .background-color span')
														.click(
																function() {
																	$(this)
																			.siblings()
																			.removeClass(
																					'active');
																	$(this)
																			.addClass(
																					'active');

																	var new_color = $(
																			this)
																			.data(
																					'color');

																	if ($sidebar.length != 0) {
																		$sidebar
																				.attr(
																						'data',
																						new_color);
																	}

																	if ($main_panel.length != 0) {
																		$main_panel
																				.attr(
																						'data',
																						new_color);
																	}

																	if ($full_page.length != 0) {
																		$full_page
																				.attr(
																						'filter-color',
																						new_color);
																	}

																	if ($sidebar_responsive.length != 0) {
																		$sidebar_responsive
																				.attr(
																						'data',
																						new_color);
																	}
																});

												$('.switch-sidebar-mini input')
														.on(
																"switchChange.bootstrapSwitch",
																function() {
																	var $btn = $(this);

																	if (sidebar_mini_active == true) {
																		$(
																				'body')
																				.removeClass(
																						'sidebar-mini');
																		sidebar_mini_active = false;
																		blackDashboard
																				.showSidebarMessage('Sidebar mini deactivated...');
																	} else {
																		$(
																				'body')
																				.addClass(
																						'sidebar-mini');
																		sidebar_mini_active = true;
																		blackDashboard
																				.showSidebarMessage('Sidebar mini activated...');
																	}

																	// we simulate the window Resize so the charts will get updated in realtime.
																	var simulateWindowResize = setInterval(
																			function() {
																				window
																						.dispatchEvent(new Event(
																								'resize'));
																			},
																			180);

																	// we stop the simulation of Window Resize after the animations are completed
																	setTimeout(
																			function() {
																				clearInterval(simulateWindowResize);
																			},
																			1000);
																});

												$('.switch-change-color input')
														.on(
																"switchChange.bootstrapSwitch",
																function() {
																	var $btn = $(this);

																	if (white_color == true) {

																		$(
																				'body')
																				.addClass(
																						'change-background');
																		setTimeout(
																				function() {
																					$(
																							'body')
																							.removeClass(
																									'change-background');
																					$(
																							'body')
																							.removeClass(
																									'white-content');
																				},
																				900);
																		white_color = false;
																	} else {

																		$(
																				'body')
																				.addClass(
																						'change-background');
																		setTimeout(
																				function() {
																					$(
																							'body')
																							.removeClass(
																									'change-background');
																					$(
																							'body')
																							.addClass(
																									'white-content');
																				},
																				900);

																		white_color = true;
																	}

																});

												$('.light-badge')
														.click(
																function() {
																	$('body')
																			.addClass(
																					'white-content');
																});

												$('.dark-badge')
														.click(
																function() {
																	$('body')
																			.removeClass(
																					'white-content');
																});
											});
						});
	</script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
</body>
</html>