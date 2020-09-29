<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Cart Details</title>
</head>
<body>
	<div align="right"><jsp:include page="header.jsp" /></div>
	<h2 align="center">Your Cart!!</h2>
	<br>
	<a href="${pageContext.request.contextPath }/user/show-list">Show Products For Shopping</a>
	<div align="center">
		<hr>
		<core:choose>
			<core:when test="${sessionScope.cartItems!= null}">
				<table border="1">
					<thead>
						<th>Id</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sub Total</th>
						<th>Option</th>
					</thead>
					<core:set var="total" value="0"></core:set>
					<tbody>
						<core:forEach var="item" items="${sessionScope.cartItems }">
							<core:set var="total"
								value="${total + item.amount * item.quantity }"></core:set>
							<tr>
								<td>${item.productId }</td>
								<td>${item.productName }</td>
								<td>${item.amount }</td>
								<td>${item.quantity }</td>
								<td>${item.amount * item.quantity }</td>
								<td align="center"><a
									href="${pageContext.request.contextPath }/user/delete/${item.productId}"
									onclick="return confirm('Are you sure?')">Delete</a></td>
							</tr>
						</core:forEach>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td colspan="3" align="right">Total Order Cost</td>
							<td>${total }</td>
						</tr>
					</tbody>
				</table>
				<br />
				<a href="${pageContext.request.contextPath }/user/checkout"><button>Checkout
						Order</button></a>
			</core:when>
			<core:otherwise>
				<h2>No products in kit</h2>
			</core:otherwise>
		</core:choose>
	</div>
	<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>