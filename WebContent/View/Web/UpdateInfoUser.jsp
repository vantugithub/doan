<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
					
					<div class="fh5co-contact-info">
						<h3>Your Information</h3>
						<% if(request.getAttribute("message").equals("success")){ %>
					<div class="alert alert-success" role="alert">
							  Update Success
			  			</div>
					<%} else{
					%>
					<%} %>
						<ul>
							<li class="address">${myUser.address}</li>
							<li class="phone"><a href="#">${myUser.phone}</a></li>
							<li class="email"><a href="#">${myUser.username}</a></li>
							<li class="url"><a href="#">${myUser.fullName}</a></li>
						</ul>
						<div class="form-group">
							<input type="submit" value="Change password" class="btn btn-danger">
						</div>
					</div>

					
					<%-- <div class="col-md-6 animate-box">
					
					<% if(request.getAttribute("message").equals("1")==true){ %>
					<div class="alert alert-success" role="alert">
							  Update Success
			  			</div>
					<%} else{
					
					
					%>
					<div class="alert alert-success" role="alert">
							  Update Failed
			  			</div>
					<% } %>
					
<!-- 					<h3>Get In Touch</h3> -->
					<form>
						
						<div class="row form-group">
							<div class="col-md-12">
								 <label for="email">Full name</label> 
								<input type="text" value="${myUser.fullName}" id="fullname" class="form-control" placeholder="Your full name">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								 <label for="address">Address</label> 
								<input type="text" value="${myUser.address}" id="address" class="form-control" placeholder="Your address">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
							 <label for="subject">Phone</label> 
								<input type="text" id="phone" value="${myUser.phone}" name="phone" class="form-control" placeholder="Your phone">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<!-- <label for="message">Message</label> -->
							</div>
						</div>
						<div class="form-group">
							<input type="button" onclick="updateUser()" value="Update information" class="btn btn-primary">
						</div>

					</form>
					
				</div> --%>
</body>
</html>