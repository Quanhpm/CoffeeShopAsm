<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật sản phẩm</title>
</head>
<body>
    <h1>Cập nhật sản phẩm</h1>
    <form action="manager" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="productId" value="${product.id}">

        <label for="productName">Tên sản phẩm:</label>
        <input type="text" id="productName" name="productName" value="${product.name}" required>
        <br>

        <label for="productPrice">Giá sản phẩm:</label>
        <input type="number" id="productPrice" name="productPrice" value="${product.price}" required>
        <br>

        <label for="productImage">Ảnh sản phẩm:</label>
        <input type="text" id="productImage" name="productImage" value="${product.image}" required>
        <br>

        <label for="categoryId">Danh mục:</label>
        <input type="number" id="categoryId" name="categoryId" value="${product.categoryId}" required>
        <br>

        <label for="toppingId">Topping:</label>
        <input type="number" id="toppingId" name="toppingId" value="${product.toppingId}" required>
        <br>

        <h3>Mô tả sản phẩm</h3>
        <label for="descriptionTitle">Tiêu đề mô tả:</label>
        <input type="text" id="descriptionTitle" name="descriptionTitle" value="${product.description != null ? product.description.title : ''}">
        <br>

        <label for="descriptionText">Nội dung mô tả:</label>
        <textarea id="descriptionText" name="descriptionText">${product.description != null ? product.description.text : ''}</textarea>
        <br>

        <button type="submit">Cập nhật sản phẩm</button>
    </form>

    <br>
    <a href="manager">Quay lại quản lý sản phẩm</a>
</body>
</html>
