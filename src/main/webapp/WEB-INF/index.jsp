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
    <h1 class="text-primary mt-4">Save Travels</h1>
    <table class="table table-striped text-center align-middle">
        <tr>
            <th>Expense</th>
            <th>Vendor</th>
            <th>Amount</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="i" begin="0" end="${allExpenses.size() -1}">
            <tr>
                <td><a href="/expenses/<c:out value="${allExpenses[i].id}"/>"><c:out value="${allExpenses[i].name}"/></a></td>
                <td><c:out value="${allExpenses[i].vendor}"/></td>
                <td>$<c:out value="${allExpenses[i].amount}"/></td>
                <td class="d-flex justify-content-evenly">
                    <a href="/expenses/edit/<c:out value="${allExpenses[i].id}"/>" class="mt-2">edit</a>
                    <a href="/expenses/delete/<c:out value="${allExpenses[i].id}"/>" class="btn btn-danger">delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <h3 class="text-primary">Add an expense:</h3>
    <div class="container">
            <form:form action="/expenses/save" method="post" modelAttribute="expense">
                <form:label path="name" cssClass="mt-2">Expense Name:</form:label>
                <form:errors path="name" cssClass="text-danger d-block"/>
                <form:input type="text" path="name" cssClass="form-control"/>
                <form:label path="vendor" cssClass="mt-2">Vendor:</form:label>
                <form:errors path="vendor" cssClass="text-danger d-block"/>
                <form:input type="text" path="vendor" cssClass="form-control"/>
                <form:label path="amount" cssClass="mt-2">Amount:</form:label>
                <form:errors path="amount" cssClass="text-danger d-block"/>
                <form:input type="text" path="amount" cssClass="form-control"/>
                <form:label path="description" cssClass="mt-2">Description:</form:label>
                <form:errors path="description" cssClass="text-danger d-block"/>
                <form:textarea path="description" cssClass="form-control"/>
                <div class="d-flex align-items-end mt-3">
                    <button class="btn btn-primary">Submit</button>
                </div>
            </form:form>
        </div>
</body>
</html>

