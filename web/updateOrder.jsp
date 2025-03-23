<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật đơn hàng</title>
</head>
<body>
    <h1>Cập nhật đơn hàng</h1>
    <form action="OrderController" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="orderId" value="${order.orderId}">

        <label for="totalPrice">Tổng giá:</label>
        <input type="number" id="totalPrice" name="totalPrice" value="${order.totalPrice}" required>
        <br>

        <label for="status">Trạng thái:</label>
        <input type="text" id="status" name="status" value="${order.status}" required>
        <br>

        <label for="createdAt">Ngày tạo:</label>
        <input type="date" id="createdAt" name="createdAt" value="${order.createdAt}" required>
        <br>

        <button type="submit">Cập nhật đơn hàng</button>
    </form>

    <br>
    <a href="manager?page=order">Quay lại quản lý đơn hàng</a>
</body>
</html>
