<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Summary Page</title>

</head>
<body>
	<div align="right"><jsp:include page="header.jsp" /></div>
	<a href="${pageContext.request.contextPath }/user/show-list">List Of Products</a>
	<hr />
	<div align="center">
		
		<h1>Your order Details</h1>
		<table>
			<tbody>
				<tr>
					<td>Order Id</td>
					<td>:</td>
					<td>${CoronaKit.id}</td>
				</tr>
				<tr>
					<td>Order Amount</td>
					<td>:</td>
					<td>${CoronaKit.totalAmount}</td>
				</tr>
				<tr>
					<td>Order Details</td>
					<td></td>
					<td>
						<table border="1">
							<thead >
								<th>Kit ID</th>
								<th>Product Name</th>
								<th>Product Quantity</th>
								<th>Sub Total Cost</th>
							</thead>
							<tbody>
								<core:forEach var="item" items="${KitDetails}">
									<tr >
										<td>${item.id }</td>
										<td>${item.productName }</td>
										<td>${item.quantity }</td>
										<td>${item.amount}</td>
									</tr>
								</core:forEach>
							</tbody>
						</table>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<core:remove var="cartItems" scope="session" />
</body>
</html>