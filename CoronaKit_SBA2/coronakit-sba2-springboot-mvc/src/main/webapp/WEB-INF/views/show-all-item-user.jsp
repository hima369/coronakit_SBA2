<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>

</head>
<body>
	<div align="right"><jsp:include page="header.jsp" /></div>
	<h1 align="center">Product List</h1>
	<hr />
	<a href="${pageContext.request.contextPath}/user/show-kit">My Cart</a>
	<div align="center">
		<core:choose>
			<core:when test="${productlist.size() <= 0}">
				<div>
					<h1>No products available</h1>
				</div>
			</core:when>
			<core:otherwise>
				<table border="1">
					<thead>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Product Description</th>
						<th>Product Cost</th>
					</thead>
					<tbody>
						<core:forEach var="product" items="${productlist}">
							<tr>
								<td>${product.id}</td>
								<td>${product.productName}</td>
								<td>${product.productDescription}</td>
								<td>${product.cost}</td>
								<td><a
									href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}"><button>Add To Cart</button></a></td>
							</tr>
						</core:forEach>
					</tbody>
				</table>
			</core:otherwise>
		</core:choose>
	</div>
	<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>