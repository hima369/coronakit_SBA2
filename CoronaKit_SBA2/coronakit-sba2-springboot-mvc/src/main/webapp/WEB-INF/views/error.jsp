<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	<c:if test="${empty exception}">
		<h1>Exceptions exists, please check</h1>
	</c:if>

	<c:if test="${not empty exception}">
		<h2>${exception.getMessage()}</h2>
		<h2>${url}</h2>
	</c:if>

</body>
</html>