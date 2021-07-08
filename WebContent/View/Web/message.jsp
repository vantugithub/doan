<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tle here</title>
</head>
<body>
<% if(request.getAttribute("message").equals("success")){ %>
					<div class="alert alert-success" role="alert">
							  Update Success
			  			</div>
					<%
					} else
						
					{
						
						
					%>
					<div class="alert alert-danger" role="alert">
							  Update Failed
			  			</div>
					<%
					
					} 
					
					%>
</body>
</html>