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
<body class="container justify-content-between">
    <div class="d-flex justify-content-between mt-4 mb-3">
        <h1 class="text-primary">Expense Details</h1>
        <a href="/expenses" class="mt-2">Go back</a>
    </div>
    <div class="d-flex">
        <p class="col-4">Expense Name:</p>
        <p><c:out value="${expense.name}"/></p>
    </div>
    <div class="d-flex">
        <p class="col-4">Expense Description:</p>
        <p><c:out value="${expense.description}"/></p>
    </div>
    <div class="d-flex">
        <p class="col-4">Vendor:</p>
        <p><c:out value="${expense.vendor}"/></p>
    </div>
    <div class="d-flex">
        <p class="col-4">Amount Spent:</p>
        <p>$<c:out value="${expense.amount}"/></p>
    </div>
</body>
</html>

