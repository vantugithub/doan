<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
			
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="/Laptop">Shop.</a></div>
				</div>
				
				
				<div class="col-md-4 col-xs-4 text-center menu-1">
					<ul>
						<li><a href="about.html">About</a></li>
						<li class="has-dropdown">
							<a href="services.html">Services</a>
							<ul class="dropdown">
								<li><a href="#">Web Design</a></li>
								<li><a href="#">eCommerce</a></li>
								<li><a href="#">Branding</a></li>
								<li><a href="#">API</a></li>
							</ul>
						</li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<li class="search">
							<div class="input-group">
						      <input type="text" placeholder="Search..">
						      <span class="input-group-btn">
						        <button class="btn btn-primary" type="button"><i class="icon-search"></i></button>
						      </span>
						    </div>
						</li>
						<li class="shopping-cart"><a href="#" class="cart"><span><small>0</small><i class="icon-shopping-cart"></i></span></a></li>
					</ul>
				</div>
				
				<c:if test="${not empty USERMODEL }">
				<div class="text-right hidden-xs menu-2">
					<div><a  href="index.html">${USERMODEL.fullName}</a></div>
				</div>
				<div class="text-right hidden-xs menu-2">
					<div><a  href="/Laptop/Logout">Logout</a></div>
				</div>
				</c:if>
				<c:if test="${empty USERMODEL }">
				<div class="text-right hidden-xs menu-2">
					<div><a  href="/Laptop/Login">Login</a></div>
				</div>
				</c:if>
				
			</div>
			
		</div>
	</nav>
</body>
</html>