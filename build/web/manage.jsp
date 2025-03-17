<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    
<head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Product Management</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .form-container {
            margin: 20px 0;
        }
        .button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>

<h2>Product Management</h2>

<!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Create Product
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <c:out value="${modalBody}" /> <!-- This is where the content will be dynamically rendered -->
        <div class="form-container">
    <h3>Create New Product</h3>
    <form action="manager" method="POST">
        <input type="hidden" name="action" value="create"/>
        Product Name: <input type="text" name="productName" required/><br/>
        Price: <input type="number" step="0.01" name="productPrice" required/><br/>
        Image URL: <input type="text" name="productImage" required/><br/>
        Category ID: <input type="number" name="categoryId" required/><br/>
        Topping ID: <input type="number" name="toppingId" required/><br/>
        Description Title: <input type="text" name="descriptionTitle"/><br/>
        Description Text: <input type="text" name="descriptionText"/><br/>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Create Product </button>
      </div>
    </form>
</div>
      </div>
      
    </div>
  </div>
</div>



<!-- Display All Products -->
<h3>Existing Products</h3>
<table>
    <thead>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Category ID</th>
            <th>Topping ID</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <!-- Loop through the product list and display each product -->
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.categoryId}</td>
                <td>${product.toppingId}</td>
                <td>
                    <!-- Update Product Form -->
                    


<form action="manager" method="POST" style="display:inline;">
    <input type="hidden" name="action" value="showUpdateForm"/>
    <input type="hidden" name="productId" value="${product.id}"/>
    <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
</form>


                    
                    
                  
                    <!-- Delete Product Form -->
                    <form action="manager" method="POST" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <button type="submit" class="button" style="background-color: red;">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
