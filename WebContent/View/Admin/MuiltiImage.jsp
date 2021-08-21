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


<title>Pending</title>
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
		if (role.getRoleName().equals("ROLE_ADMIN") == false) {
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
							
							<div align="center">
				    
				    <h1> ${product.name} </h1>
				    		<br>
				    		<br>
				    		<br>
				    		<br>
				        <h1> Upload Multiple Files </h1>
				        
				        <form method="post" action="<%=request.getContextPath()%>/admin/addimages" enctype="multipart/form-data">
				        	<input type="text" value="${product.id}" name="id">
				            <p>Select files to upload. Press Add button to add more file
				                inputs.</p>
				            <table id="fileTable">
				                <tr>
				                    <td><input name="files" type="file" /></td>
				                </tr>
				            </table>
				            <br />
				            <input type="submit" value="Upload" />
				            <input id="addFile" type="button" value="Add File" />
				        </form>
				        
				        <br />
				    </div>
						</div>
					</div>
				</div>
			</div>
			<!--Begin footer -->
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
	
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "black-dashboard-free"
		});
	</script>
	
		<script>
	$(document).ready(
            function() {
                $('#addFile')
                        .click(
                                function() {
                                    var fileIndex = $('#fileTable tr')
                                            .children().length - 1;
                                    $('#fileTable')
                                            .append(
                                                    '<tr><td>'
                                                            + '   <input type="file" name="files" />'
                                                            + '</td></tr>');
                                });

            });
	</script>
</body>
</html>