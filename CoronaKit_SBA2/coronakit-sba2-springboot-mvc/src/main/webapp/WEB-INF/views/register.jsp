<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
	<h2>Registration Page</h2>
	<hr/>
	
	<form:form action="${pageContext.request.contextPath}/register-save" method="POST" modelAttribute="userDetails">
		
		<h1></h1>
		<form:label path="userName">Enter user name</form:label>
		<form:input path="userName"/>
		<h1></h1>
		<form:label path="password">Enter password</form:label>
		<form:password  path="password"/>
		<h1></h1>
		<form:label path="confirmPassword">Confirm Password</form:label>
		<form:password path="confirmPassword"/>
		<h1></h1>
		<form:label path="email">Enter email</form:label>
		<form:input path="email"/>
		<h1></h1>
		<spring:label path="contact">Enter Contact number</spring:label>
		<spring:input path="contact"/>
		<h1></h1>
		<spring:label path="roles">Select Role</spring:label>
		<ul>
			<li> <spring:checkbox path="roles" value="ADMIN" label="ADMIN"/></li>
			<li> <spring:checkbox path="roles" value="USER" label="USER"/></li>
		</ul>
		<h1></h1>
		<input type="submit" value="Register">

	</form:form>
	
</body>
</html>