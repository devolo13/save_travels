<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <title>Save Travels</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body class="container">
    <div class="d-flex justify-content-between mt-4">
        <h1 class="text-success">Edit Expense</h1>
        <a href="/expenses" class="mt-2">Go back</a>
    </div>
    <form:form action="/expenses/update/${expense.id}" method="post" modelAttribute="expense">
        <form:errors path="name" cssClass="text-danger d-block"/>
        <form:label path="name">Expense Name:</form:label>
        <form:input type="text" path="name" cssClass="form-control"/>

        <form:errors path="vendor" cssClass="text-danger d-block"/>
        <form:label path="vendor">Vendor:</form:label>
        <form:input type="text" path="vendor" cssClass="form-control"/>

        <form:errors path="amount" cssClass="text-danger d-block"/>
        <form:label path="amount">Amount:</form:label>
        <form:input type="text" path="amount" cssClass="form-control"/>

        <form:errors path="description" cssClass="text-danger d-block"/>
        <form:label path="description">Description:</form:label>
        <form:textarea path="description" cssClass="form-control"/>

        <div class="d-flex align-items-end">
            <button class="btn btn-primary mt-2">Submit</button>
        </div>
    </form:form>
</body>
</html>

