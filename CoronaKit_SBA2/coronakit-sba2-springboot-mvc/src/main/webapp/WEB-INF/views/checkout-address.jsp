<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>CheckOut Page</title>
</head>
<body>
	<div><jsp:include page="header.jsp" /></div>

	<h3>Cart Items</h3>
	<hr>
	<core:choose>
		<core:when test="${sessionScope.cartItems!= null}">
			<a href="${pageContext.request.contextPath }/user/show-list">Continue Shopping</a>
			<br />
			<div>
				<table border="1">
					<thead>
						<th>Id</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sub Total</th>
					</thead>
					<core:set var="total" value="0" scope="request"></core:set>
					<tbody>
						<core:forEach var="item" items="${sessionScope.cartItems }">
							<core:set var="total"
								value="${total + item.amount * item.quantity }"></core:set>
							<tr >
								<td>${item.productId }</td>
								<td>${item.productName }</td>
								<td>${item.amount }</td>
								<td>${item.quantity }</td>
								<td>${item.amount * item.quantity }</td>
							</tr>
						</core:forEach>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td colspan="2" align="right">Total Order Cost</td>
							<td>${total }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr />
			<div>
				<spring:form
					action="${pageContext.request.contextPath}/user/finalize"
					method="post" modelAttribute="coronaKit">
					<div>
						<div>
							<spring:label path="deliveryAddress">Enter Delivery Address Detials:</spring:label>
						</div>
						<div>
							<div>
								<spring:textarea path="deliveryAddress" cols="20" rows="5" />
							</div>
							<div>
								<spring:errors path="deliveryAddress" cssClass="error" />
							</div>
						</div>
						<br /> <br />
						<div>
							<input type="submit" value="Confirm Order">
						</div>
					</div>
				</spring:form>
			</div>
		</core:when>
		<core:otherwise>
			<div>
				<h2>No products present. Please add</h2>
				<a href="${pageContext.request.contextPath }/user/show-list">Show Products</a>
			</div>
		</core:otherwise>
	</core:choose>
	<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>