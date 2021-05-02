<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="BEAN.Role"%>
<%@page import="BEAN.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</body>
</html>