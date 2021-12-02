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
    <title>Dojo Page</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container pt-2">
	<a href="/dojos/new">Register Dojo</a> || 
	<a href="/ninjas/new">Register a New Ninja</a>
	
	<table class="table table-sm table-striped table-bordered table-hover">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">First Name</th>
	      <th scope="col">Last Name</th>
	      <th scope="col">Age</th>
	      <th scope="col">Actions</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="ninja" items="${ninjas}">
	  		<tr>
	      <td>${ninja.firstName}</td>
	      <td>${ninja.lastName}</td>
	      <td>${ninja.age}</td>	
	      <td><a href="/ninja/<c:out value="${ninja.id}" />">Delete</a></td>	
	  	</c:forEach>
	  </tbody>
	</table>
</div>

</body>
</html>
