<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
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
					<div id="fh5co-logo"><a href="/Laptop">HOME</a></div>
				</div>
				
				
				<div class="col-md-4 col-xs-4 text-center menu-1">
					<ul>
						<li><a href="#">About</a></li>
						<li class="has-dropdown">
							<a href="#">Laptop</a>
							<ul class="dropdown">
							<c:forEach var="list" items="${listCategory}">
							<li><a href="<%=request.getContextPath()%>/Brands?brand=${list.name}">${list.name}</a></li>
							</c:forEach>
							
							</ul>
						</li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<li class="search">
							<div class="input-group">
							<form action="/Laptop/search" method="GET" onsubmit="return checkForTheCondition();" >
							
							 <input type="text" id="textSearch" name="textSearch" placeholder="Search..">
							 
						      <span class="input-group-btn">
						        <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
						      </span>
							</form>
						     
						    </div>
						</li>
						<li class="shopping-cart" ><a href="/Laptop/Cart" class="cart" style="font-size: 23px"><span id="quantity">
						<c:if test="${quantity != null}"><small>${quantity}</small></c:if>
						
						<i class="icon-shopping-cart"></i></span></a></li>
					</ul>
				</div>
				
				<c:if test="${not empty USERMODEL }">
				<div class="text-right hidden-xs menu-2">
					<div><a  href="/Laptop/profile" style="font-size: 17px;">${USERMODEL.fullName}</a></div>
				</div>
				<div class="text-right hidden-xs menu-2">
					<div><a  href="/Laptop/Logout" class="btn btn-primary btn-outline">Logout</a></div>
				</div>
				</c:if>
				<c:if test="${empty USERMODEL }">
				<div class="text-right hidden-xs menu-2">
					<div><a  href="/Laptop/Login" class="btn btn-primary btn-outline">Login</a></div>
				</div>
				</c:if>
				
			</div>
			
		</div>
	</nav>
	<script type="text/javascript">
		
		function checkForTheCondition() 
		{
			element_1 = document.getElementsByName('textSearch')[1].value;
			element_0 = document.getElementsByName('textSearch')[0].value;
			if(element_1.length <= 2 && element_0.length <= 2 ) return false;
			return true;
		}
	
		</script>
	
</body>
</html>