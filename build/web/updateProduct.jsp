<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật sản phẩm</title>
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
            <h1 class="text-center">Cập nhật sản phẩm</h1>
        </div>
    </div>
    
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-container p-4 p-md-5">
                    <form action="manager" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="productId" value="${product.id}">
                        
                        <div class="mb-3">
                            <label for="productName" class="form-label">Tên sản phẩm:</label>
                            <input type="text" class="form-control" id="productName" name="productName" value="${product.name}" required>
                            <div class="invalid-feedback">Vui lòng nhập tên sản phẩm</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="productPrice" class="form-label">Giá sản phẩm:</label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="productPrice" name="productPrice" value="${product.price}" required>
                                <span class="input-group-text">VNĐ</span>
                                <div class="invalid-feedback">Vui lòng nhập giá sản phẩm</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="productImage" class="form-label">Ảnh sản phẩm:</label>
                            <input type="text" class="form-control" id="productImage" name="productImage" value="${product.image}" required>
                            <div class="invalid-feedback">Vui lòng nhập URL ảnh sản phẩm</div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="categoryId" class="form-label">Danh mục:</label>
                                <input type="number" class="form-control" id="categoryId" name="categoryId" value="${product.categoryId}" required>
                                <div class="invalid-feedback">Vui lòng nhập ID danh mục</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="toppingId" class="form-label">Topping:</label>
                                <input type="number" class="form-control" id="toppingId" name="toppingId" value="${product.toppingId}" required>
                                <div class="invalid-feedback">Vui lòng nhập ID topping</div>
                            </div>
                        </div>
                        
                        <div class="mb-3 mt-4">
                            <h3 class="border-bottom pb-2 text-primary">Mô tả sản phẩm</h3>
                            
                            <div class="mb-3">
                                <label for="descriptionTitle" class="form-label">Tiêu đề mô tả:</label>
                                <input type="text" class="form-control" id="descriptionTitle" name="descriptionTitle" value="${product.description != null ? product.description.title : ''}">
                            </div>
                            
                            <div class="mb-3">
                                <label for="descriptionText" class="form-label">Nội dung mô tả:</label>
                                <textarea class="form-control" id="descriptionText" name="descriptionText" rows="4">${product.description != null ? product.description.text : ''}</textarea>
                            </div>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="manager" class="btn btn-outline-secondary me-md-2">Hủy</a>
                            <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
                        </div>
                    </form>
                </div>
                
                <div class="text-center mt-4">
                    <a href="manager" class="back-link d-inline-flex align-items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left me-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                        </svg>
                        Quay lại quản lý sản phẩm
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