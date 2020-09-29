<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="spring-form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>User Home</title>
</head>
<body>
	<spring-form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout">
	</spring-form:form>
	<hr />
	<h1>Welcome To User DashBoard</h1>
	<hr />
	<a href="${pageContext.request.contextPath}/user/show-list">Show All Products</a> |
	<a href="${pageContext.request.contextPath}/user/show-kit">Show My Cart</a>
</body>
</html>