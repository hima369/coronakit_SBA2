<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Add New Product</title>

</head>
<body>
	<div align="right"><jsp:include page="header.jsp" /></div>
	<h1>New Product</h1>
	<hr />
	
	<h1></h1>
	<a href="${pageContext.request.contextPath}/admin/home">Admin DashBoard</a>
	<h1></h1>
	
		<form:form
			action="${pageContext.request.contextPath}/admin/product-save"
			method="post" modelAttribute="product">
			<div>
				<div>
					<form:label path="productName">Enter Product Name:</form:label>
				</div>
				<div>
					<div>
						<form:input path="productName" />
					</div>
					<div>
						<form:errors path="productName" />
					</div>
				</div>
				<br /> <br />
				<div>
					<form:label path="cost">Enter Cost:</form:label>
				</div>
				<div>
					<form:input path="cost" />
				</div>
				<div>
					<form:errors path="cost" />
				</div>
				<br /> <br />
				<div>
					<form:label path="productDescription">Enter Description:</form:label>
				</div>
				<div>
					<form:input path="productDescription" />
				</div>
				<div>
					<form:errors path="productDescription" />
				</div>
				<br /> <br />
				<div>
					<input type="submit" value="Save">
				</div>
			</div>
		</form:form>
	</div>
	<div align="right"><jsp:include page="footer.jsp" /></div>
</body>
</html>