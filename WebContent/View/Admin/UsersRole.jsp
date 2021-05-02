<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	if(role.getRoleName().equals("ROLE_ADMIN")==false){
		response.sendRedirect("/Laptop/Login");
	}
}
%>
								<div class="">
									<table class="table tablesorter ">
									<thead class=" text-primary">
											<tr>
												<th>Id</th>
												<th>User Name</th>
												<th>Full Name</th>
												<th>Status</th>
												<th>Edit </th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${list}" var="lis">
											<tr>
												<td>${lis.id}</td>
												<td>${lis.username}</td>
												<td>${lis.fullName}</td>
												<td>${lis.active}</td>
												<td><a href="<%=request.getContextPath()%>/admin/user?id=${lis.id}"><i class="tim-icons icon-gift-2" ></i></a></td>
											</tr>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								
								<ul class="pagination">
					<c:if test="${numberPage == 1}">

						<li class="page-item"><a class="page-link" onclick="changeList('${role}','1')">1</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','2')">2</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','${numberPage+1}')">Next</a></li>
					</c:if>

					<c:if test="${numberPage == maxPageId}">
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','${numberPage-1}')">Prev</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','1')">1</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','2')">2</a></li>
					</c:if>

					<c:if test="${numberPage > 1 && numberPage < maxPageId}">
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','${numberPage-1}')">Prev</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','1')">1</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','2')">2</a></li>
						<li class="page-item"><a class="page-link" onclick="changeList('${role}','${numberPage+1}')">Next</a></li>
					</c:if>
								</ul>
				
</body>
</html>