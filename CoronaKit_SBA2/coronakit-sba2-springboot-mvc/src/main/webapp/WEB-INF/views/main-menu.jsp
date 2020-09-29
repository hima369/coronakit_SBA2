<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"
	prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>

<title>Main Menu</title>
</head>
<body>

	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout">
	</form:form>
	<hr />
	<h1>Welcome to Corona Kit Dashboard!!!</h1>

	<security:authorize access="hasRole('ADMIN')">
		<hr />
		<a href="${pageContext.request.contextPath}/admin/home">ADMIN
			DASHBOARD</a>
	</security:authorize>

	<security:authorize access="hasRole('USER')">
		<hr />
		<a href="${pageContext.request.contextPath}/user/home">USER
			DASHBOARD</a>
	</security:authorize>

<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>