<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Dojo</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<a href="/ninjas/new">Register a New Ninja</a>
		<h1>New Dojo</h1>
		
		<form:form class="form" action="/dojos/new" method="POST" modelAttribute="dojo">
			<div class="form-group row">
				<form:label path="location">Location:</form:label>
				<form:input type="text" path="location"></form:input>
				<form:errors path="location" class="errors"></form:errors>
			</div>
			<input type="submit" class="btn btn-primary m-2" value="Submit" />
		</form:form>
		
		<table class="table">
			<tr class="table-info">
				<th>Location</th>
				<th>Actions</th>
			</tr>
		<c:forEach var="dojo" items="${dojos}">
			<tr>
				<td><c:out value="${dojo.location}" /></td>
				<td><a href="/dojos/<c:out value="${dojo.id}" />">DOJO DETAILS</a> || <a href="/dojo/<c:out value="${dojo.id}" />">DELETE</a></td>
			</tr>
		</c:forEach>
		</table>
	</div>
   
</body>
</html>
