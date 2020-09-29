<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Admin DashBoard</title>
</head>
<body>
	<div align="right"><jsp:include page="header.jsp" /></div>
	<hr />
	<h1>Welcome to Admin DashBoard!!</h1>
	<hr />
	<a href="${pageContext.request.contextPath}/admin/product-list">Display	All Products</a> |
	<a href="${pageContext.request.contextPath}/admin/product-entry">Add New Product</a>
<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>