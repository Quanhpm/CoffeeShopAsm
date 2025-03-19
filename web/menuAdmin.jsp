<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: row;
        }

        .menu {
            width: 200px;
            background-color: #333;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
        }

        .menu a {
            display: block;
            color: #fff;
            padding: 14px;
            text-align: left;
            text-decoration: none;
            margin-bottom: 10px;
        }

        .menu a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            margin-left: 220px;
            padding: 20px;
            flex: 1;
        }
    </style>
</head>
<body>
    <!-- Menu for switching between Product Management and Order Management -->
    <div class="menu">
        <a href="manager?page=product">Product Management</a>
        <a href="manager?page=order">Order Management</a>
    </div>

    <div class="container">
        <h1>Welcome to Admin Dashboard</h1>

        <!-- Use JSTL to forward the page based on 'page' parameter -->
        <c:choose>
            <c:when test="${not empty page}">
                <!-- If 'page' is provided, include that page -->
                <jsp:include page="${page}" />
            </c:when>
            <c:otherwise>
                <!-- If 'page' is not provided, default to 'manage.jsp' -->
                <jsp:include page="manage.jsp" />
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
