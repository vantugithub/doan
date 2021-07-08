<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>Profile Seller</title>
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
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("USERMODEL")==null)
    response.sendRedirect("/Laptop/Login");
if(session.getAttribute("USERMODEL")!=null) {
	MyUser myUser =(MyUser) session.getAttribute("USERMODEL");
	Role role = myUser.getRole();
	if(role.getRoleName().equals("ROLE_SELLER")==false){
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
          <div class="col-md-8">
            <div class="card">
              <div class="card-header">
                <h5 class="title">Edit Profile</h5>
              </div>
              
              <c:if test="${mess == 'Success'}">
              <div class="alert alert-success" role="alert">
							  Update Success
			  </div>
			  </c:if>
			   <c:if test="${mess == 'Failed'}">
			  <div class="alert alert-danger" role="alert">
							  Update Failed
			  </div>
			  </c:if>
			  
			  
              <div class="card-body">
                <form action="<%=request.getContextPath()%>/seller/editprofile" method = "POST">
                  <div class="row">
                    <div class="col-md-1 pr-md-1">
                      <div class="form-group">
                        <label>Id</label>
                        <input type="text" class="form-control" disabled="" placeholder="Id" value="${myUser.id}">
                      </div>
                    </div>
                    <div class="col-md-5 px-md-1">
                      <div class="form-group">
                        <label>Full name</label>
                        <input type="text" class="form-control" name="fullName" placeholder="Full name" value="${myUser.fullName}">
                      </div>
                    </div>
                    <div class="col-md-5 pl-md-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" placeholder="${myUser.username}">
                      </div>
                    </div>
                    
                  </div>
                  
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Address</label>
                        <input type="text" class="form-control" name="address" placeholder="Home Address" value="${myUser.address}">
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" name="phone" placeholder="Home Address" value="${myUser.phone}">
                      </div>
                    </div>
                  </div>
                  
                  <div class="card-footer">
                <button type="submit" class="btn btn-fill btn-primary">Save</button>
                <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-fill btn-success">Change password</button>
              </div>
              
              
                </form>
              </div>
              
              
              
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-user">
              <div class="card-body">
                <p class="card-text">
                  <div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                      <img class="avatar" src="<%=request.getContextPath()%>/Template/Admin/img/emilyz.jpg" alt="...">
                      <h5 class="title">Mike Andrew</h5>
                    </a>
                    <p class="description">
                      Ceo/Co-Founder
                    </p>
                  </div>
                </p>
                <div class="card-description">
                  Do not be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...
                </div>
              </div>
              <div class="card-footer">
                <div class="button-container">
                  <button href="javascript:void(0)" class="btn btn-icon btn-round btn-facebook">
                    <i class="fab fa-facebook"></i>
                  </button>
                  <button href="javascript:void(0)" class="btn btn-icon btn-round btn-twitter">
                    <i class="fab fa-twitter"></i>
                  </button>
                  <button href="javascript:void(0)" class="btn btn-icon btn-round btn-google">
                    <i class="fab fa-google-plus"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          
          
        </div>
      </div>
			<!--Begin footer -->
			<jsp:include page="Footer.jsp" />
			<!-- End Footer -->
			
			
			
			<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
      </div>
      <div class="modal-body">
        <form name="myForm" >
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Old Password: </label>
            <input type="password" class="btn btn-success" name="password" />
          </div>
          
           <label class="form-group" id="errorPass3" style="color:red;"></label>
           
	          <div class="form-group">
			        <label for="recipient-name" class="col-form-label">New Password:</label>
            <input type="password" name="newPassword1" id="newPassword1" class="btn btn-success" />
			  </div>
			  
			   <label class="form-group" id="errorPass1" style="color:red;"></label>
			   
			  <div class="form-group">
			        <label for="recipient-name" class="col-form-label">New Password:</label>
            <input type="password" name="newPassword2" id="newPassword2" class="btn btn-success" />
			  </div>
			  
			  <label class="form-group" id="errorPass2" style="color:red;"></label>
			  <div class="form-group">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
        <button type="button" onclick="changePass()" class="btn btn-primary">Save</button>
        </div>
        </form> 
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
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
	
	<script  type="text/javascript">

	function validate() {
		var newPassword1 = document.myForm.newPassword1.value;
		var newPassword2 = document.myForm.newPassword2.value;
		
			if(newPassword1.length < 6) {
			document.getElementById("errorPass1").innerHTML="Must be at least 6 characters";
			return false;
			}
			if(newPassword1.length >= 6){
				document.getElementById("errorPass1").innerHTML="";
			}
			if(newPassword1 != newPassword2) {
				document.getElementById("errorPass2").innerHTML="Password must be same!";
				return false;
			}
	}
	
	function changePass() {
		if(validate()==false)
			{
			return;
			}
		else{
			var xhttp;
			var newPassword1 = document.myForm.newPassword1.value;
			var currentPassword = document.myForm.password.value;
			var url = "http://localhost:8080/spring-mvc/orthers/changePass/" + newPassword1
			+"/" + currentPassword;

			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("notice").innerHTML = data;
				}
			}
			xhttp.open("POST", url, true);
			xhttp.send();
		}
	}
	
	$(document).on("click", ".browse", function() {
		  var file = $(this).parents().find(".file");
		  file.trigger("click");
		});
		$('input[type="file"]').change(function(e) {
		  var fileName = e.target.files[0].name;
		  $("#file").val(fileName);

		  var reader = new FileReader();
		  reader.onload = function(e) {
		    // get loaded data and render thumbnail.
		    document.getElementById("preview").src = e.target.result;
		  };
		  // read the image file as a data URL.
		  reader.readAsDataURL(this.files[0]);
		});
	
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data', new_color);
          }

          if ($main_panel.length != 0) {
            $main_panel.attr('data', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data', new_color);
          }
        });

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });

        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (white_color == true) {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').removeClass('white-content');
            }, 900);
            white_color = false;
          } else {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').addClass('white-content');
            }, 900);

            white_color = true;
          }

        });

        $('.light-badge').click(function() {
          $('body').addClass('white-content');
        });

        $('.dark-badge').click(function() {
          $('body').removeClass('white-content');
        });
      });
    });
  </script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "black-dashboard-free"
      });
  </script>
</body>
</html>