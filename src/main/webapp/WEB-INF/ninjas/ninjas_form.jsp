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
    <title>New Ninja</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
    	<a href="/dojos/new">Register a Dojo</a>
    	<h1>Add a New Ninja</h1>
    	
    	<form:form class="form" action="/ninjas/new" method="POST" modelAttribute="ninja">
    		<div class="form-group row">
    			<form:label path="firstName">First Name:</form:label>
    			<form:input type="text" path="firstName" />
   				<form:errors path="firstName" class="errors"></form:errors> 			
    		</div>
    		
    		<div class="form-group row">
    			<form:label path="lastName">Last Name:</form:label>
    			<form:input type="text" path="lastName" />
				<form:errors path="lastName" class="errors"></form:errors>
    		</div>

    		<div class="form-group row">
    			<form:label path="age">Age</form:label>
    			<form:input type="number" min="1" path="age" />
				<form:errors path="age" class="errors"></form:errors>
    		</div>
    		
    		<div class="form-group row">
    			<form:label path="dojo">Select Dojo:</form:label>
    			<form:select path="dojo">
					<c:forEach var="dojo" items="${dojos}">
						<form:option value="${dojo.id}">
							<c:out value="${dojo.location}" />
						</form:option>
					</c:forEach>   				
    			</form:select>
   				<form:errors path="dojo" class="errors"></form:errors> 			
    		</div>
    		<input type="submit" class="btn btn-primary m-2" value="Create" />
    	</form:form>
	</div>
</body>
</html>
