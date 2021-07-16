<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		    			<c:set var="s" value="0"></c:set>

<c:if test="${list.size()>0}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-right">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                   
                    <c:forEach items="${list}" var="lis">
                    <c:set var="s" value="${s + lis.product.price * lis.quantity }"></c:set>
                    
                        <tr>
                            <td><img class="custom-image" src="<%=request.getContextPath()%>/image/${lis.product.image}" /> </td>
                            <td>${lis.product.name}</td>
                            
                            <td><input onchange="updateCart(${lis.product.id})" id="id=${lis.product.id}" class="number" type="text"pattern="[0-9]*" value="${lis.quantity}" /></td>
                            <td class="text-right">${lis.product.price}$</td>
                            <td class="text-right"><button class="btn btn-sm btn-danger" onclick="deleteProduct(${lis.product.id})"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                     </c:forEach>
                    </tbody>
                </table>
             </c:if>
             
             <div id="" class="">
		<div class="container">
			<div class="row">
				
				<!-- <div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 text-center">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<p><a href="#" class="btn btn-success btn-outline">Update Cart</a></p>
					</div>	
				</div> -->
				<c:if test="${list.size()>0}">
				<th colspan="5">Total</th>
			<th><fmt:formatNumber type="number" maxFractionDigits="3"
					value="${s}" /></th>	
				<div >
				
					<form action="${pageContext.request.contextPath}/success?total=${s}"
						method="post" >
						<p style="text-align: center;"><input type="submit" class="btn btn-success btn-outline" value="Checkout"
							style="margin: 0 auto"></p>
					</form>
				</div>
					 </div>
				
				</c:if>
				<c:if test="${list.size() <= 0 || list==null}">
				<div class="container">
        				<h1 class="jumbotron-heading">No products</h1>
    			 </div>
				</c:if>				
				
			</div>
			
			
		</div>
	</div>
             
</body>
</html>