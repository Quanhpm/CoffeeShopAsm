<%-- 
    Document   : menu
    Created on : Mar 7, 2025, 11:16:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List Page</title>
    </head>
    <body>
       
        
        <!-- User info and navigation links -->
        <%@ include file="header.jsp" %>

        <!-- Product list table -->
        <table border="1" cellspacing="0" cellpadding="4">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Category</th>
                <th>Topping</th>
            </tr>

            <!-- Loop through the list of products -->
            <c:forEach var="product" items="${listProduct}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>${product.categoryId}</td>
                    <td>${product.toppingId}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

