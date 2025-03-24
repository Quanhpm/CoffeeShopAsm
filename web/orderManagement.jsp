<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            background-color: #f5f5f7;
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .page-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #e0e0e0;
        }

        .section-title {
            color: #2c3e50;
            font-weight: 600;
        }

        /* Table Styles */
        .table-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .order-table {
            width: 100%;
            margin-bottom: 0;
        }

        .order-table th {
            background-color: #f8f9fa;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            padding: 15px;
            color: #2c3e50;
            border-bottom: 2px solid #e9ecef;
        }

        .order-table td {
            padding: 15px;
            vertical-align: middle;
            border-top: none;
            border-bottom: 1px solid #e9ecef;
        }

        .order-table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease;
        }

        .order-id {
            font-weight: 600;
            color: #495057;
        }

        .price-column {
            color: #0d6efd;
            font-weight: 500;
        }

        /* Button Styles */
        .btn-update {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .btn-update:hover {
            background-color: #0b5ed7;
            transform: translateY(-1px);
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .btn-delete:hover {
            background-color: #c82333;
            transform: translateY(-1px);
        }

        .action-column {
            width: 220px;
            text-align: center;
        }

        .btn-group form {
            display: inline-block;
            margin-right: 5px;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 15px;
            color: #adb5bd;
        }
    </style>
</head>

<body>
    <div class="page-container">
        <!-- Page Header -->
        <div class="section-header">
            <h1 class="section-title">
                <i class="fas fa-boxes me-2"></i>Quản Lý Đơn Hàng
            </h1>
        </div>

        <!-- Order List Section -->
        <div class="table-container">
            <div class="section-header px-3 pt-3 pb-0 mb-0">
                <h3 class="section-title h5">
                    <i class="fas fa-list me-2"></i>Danh Sách Đơn Hàng
                </h3>
                <div>
                    <span class="badge bg-primary rounded-pill">
                        <c:choose>
                            <c:when test="${not empty orderList}">
                                ${orderList.size()} đơn hàng
                            </c:when>
                            <c:otherwise>
                                0 đơn hàng
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>

            <div class="table-responsive">
                <c:choose>
                    <c:when test="${not empty orderList}">
                        <table class="order-table table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th scope="col"><i class="fas fa-key me-1"></i> ID</th>
                                    <th scope="col"><i class="fas fa-money-bill-wave me-1"></i> Tổng Tiền</th>
                                    <th scope="col"><i class="fas fa-clock me-1"></i> Ngày Tạo</th>
                                    <th scope="col"><i class="fas fa-users me-1"></i> ID Tài Khoản</th>
                                    <th scope="col"><i class="fas fa-cogs me-1"></i> Trạng Thái</th>
                                    <th scope="col" class="text-center"><i class="fas fa-sliders-h me-1"></i> Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orderList}">
                                    <tr>
                                        <td class="order-id">#${order.orderId}</td>
                                        <td class="price-column"><fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ" /></td>
                                        <td><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td>${order.accountId}</td>
                                        <td>${order.status}</td>
                                        <td class="text-center action-column">
                                            <div class="btn-group">
                                                <!-- Update Order Form -->
                                                <form action="OrderController" method="POST">
                                                    <input type="hidden" name="action" value="showUpdateForm"/>
                                                    <input type="hidden" name="orderId" value="${order.orderId}"/>
                                                    <button type="submit" class="btn-update">
                                                        <i class="fas fa-edit me-1"></i> Cập nhật
                                                    </button>
                                                </form>
                                                <!-- Delete Order Form -->
                                       
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-box-open"></i>
                            <h4>Không có đơn hàng nào</h4>
                            <p>Không có đơn hàng nào trong hệ thống hiện tại</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
