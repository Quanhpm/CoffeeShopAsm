<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật đơn hàng</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --bs-primary: #198754;
            --bs-primary-rgb: 25, 135, 84;
        }
        
        body {
            background-color: #f8f9fa;
        }
        
        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(var(--bs-primary-rgb), 0.15);
        }
        
        .btn-primary {
            background-color: var(--bs-primary);
            border-color: var(--bs-primary);
        }
        
        .btn-primary:hover {
            background-color: #146c43;
            border-color: #146c43;
        }
        
        .form-label {
            font-weight: 500;
        }
        
        .page-header {
            background-color: var(--bs-primary);
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 10px 10px;
        }
        
        .back-link {
            color: var(--bs-primary);
            text-decoration: none;
        }
        
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <h1 class="text-center">Cập nhật đơn hàng</h1>
        </div>
    </div>
    
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-container p-4 p-md-5">
                    <form action="OrderController" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        
                        <div class="mb-3">
                            <label for="totalPrice" class="form-label">Tổng giá:</label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="totalPrice" name="totalPrice" value="${order.totalPrice}" required>
                                <span class="input-group-text">VNĐ</span>
                                <div class="invalid-feedback">Vui lòng nhập tổng giá</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="status" class="form-label">Trạng thái:</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="" disabled>Chọn trạng thái</option>
                                <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Đang xử lý</option>
                                <option value="Processing" ${order.status == 'Processing' ? 'selected' : ''}>Đang chuẩn bị</option>
                                <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Đang giao hàng</option>
                                <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Đã giao hàng</option>
                                <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Đã hủy</option>
                            </select>
                            <div class="invalid-feedback">Vui lòng chọn trạng thái</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="createdAt" class="form-label">Ngày tạo:</label>
                            <input type="date" class="form-control" id="createdAt" name="createdAt" value="${order.createdAt}" required>
                            <div class="invalid-feedback">Vui lòng chọn ngày tạo</div>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="manager?page=order" class="btn btn-outline-secondary me-md-2">Hủy</a>
                            <button type="submit" class="btn btn-primary">Cập nhật đơn hàng</button>
                        </div>
                    </form>
                </div>
                
                <div class="text-center mt-4">
                    <a href="manager?page=order" class="back-link d-inline-flex align-items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left me-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                        </svg>
                        Quay lại quản lý đơn hàng
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap 5.3 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation script
        (function () {
            'use strict'
            
            // Fetch all forms that need validation
            var forms = document.querySelectorAll('.needs-validation')
            
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>