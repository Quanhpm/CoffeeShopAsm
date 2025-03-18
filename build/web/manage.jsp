<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
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
        
        .product-table {
            width: 100%;
            margin-bottom: 0;
        }
        
        .product-table th {
            background-color: #f8f9fa;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            padding: 15px;
            color: #2c3e50;
            border-bottom: 2px solid #e9ecef;
        }
        
        .product-table td {
            padding: 15px;
            vertical-align: middle;
            border-top: none;
            border-bottom: 1px solid #e9ecef;
        }
        
        .product-table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease;
        }
        
        .product-id {
            font-weight: 600;
            color: #495057;
        }
        
        .price-column {
            color: #0d6efd;
            font-weight: 500;
        }
        
        /* Button Styles */
        .btn-create {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .btn-create:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
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
        
        /* Modal Styles */
        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }
        
        .modal-title {
            color: #2c3e50;
            font-weight: 600;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 5px;
        }
        
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
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
                <i class="fas fa-cubes me-2"></i>Quản Lý Sản Phẩm
            </h1>
            <button type="button" class="btn btn-create" data-bs-toggle="modal" data-bs-target="#createProductModal">
                <i class="fas fa-plus-circle me-2"></i>Thêm Sản Phẩm Mới
            </button>
        </div>

        <!-- Product List Section -->
        <div class="table-container">
            <div class="section-header px-3 pt-3 pb-0 mb-0">
                <h3 class="section-title h5">
                    <i class="fas fa-list me-2"></i>Danh Sách Sản Phẩm
                </h3>
                <div>
                    <span class="badge bg-primary rounded-pill">
                        <c:choose>
                            <c:when test="${not empty productList}">
                                ${productList.size()} sản phẩm
                            </c:when>
                            <c:otherwise>
                                0 sản phẩm
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
            
            <div class="table-responsive">
                <c:choose>
                    <c:when test="${not empty productList}">
                        <table class="product-table table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th scope="col"><i class="fas fa-key me-1"></i> ID</th>
                                    <th scope="col"><i class="fas fa-tag me-1"></i> Tên Sản Phẩm</th>
                                    <th scope="col"><i class="fas fa-dollar-sign me-1"></i> Giá</th>
                                    <th scope="col"><i class="fas fa-folder me-1"></i> Danh Mục</th>
                                    <th scope="col"><i class="fas fa-cookie me-1"></i> Topping</th>
                                    <th scope="col" class="text-center"><i class="fas fa-sliders-h me-1"></i> Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${productList}">
                                    <tr>
                                        <td class="product-id">#${product.id}</td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="me-2" style="width: 40px; height: 40px; border-radius: 4px; background-color: #f1f5f9; display: flex; align-items: center; justify-content: center;">
                                                    <i class="fas fa-box text-primary"></i>
                                                </div>
                                                ${product.name}
                                            </div>
                                        </td>
                                        <td class="price-column"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ" /></td>
                                        <td>
                                            <span class="badge bg-light text-dark">
                                                ID: ${product.categoryId}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-light text-dark">
                                                ID: ${product.toppingId}
                                            </span>
                                        </td>
                                        <td class="text-center action-column">
                                            <div class="btn-group">
                                                <!-- Update Product Form -->
                                                <form action="manager" method="POST">
                                                    <input type="hidden" name="action" value="showUpdateForm"/>
                                                    <input type="hidden" name="productId" value="${product.id}"/>
                                                    <button type="submit" class="btn-update">
                                                        <i class="fas fa-edit me-1"></i> Cập nhật
                                                    </button>
                                                </form>
                                                <!-- Delete Product Form -->
                                                <form action="manager" method="POST">
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="productId" value="${product.id}"/>
                                                    <button type="submit" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">
                                                        <i class="fas fa-trash-alt me-1"></i> Xóa
                                                    </button>
                                                </form>
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
                            <h4>Không có sản phẩm nào</h4>
                            <p>Hãy thêm sản phẩm mới bằng cách nhấn nút "Thêm Sản Phẩm Mới"</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Create Product Modal -->
        <div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createProductModalLabel">
                            <i class="fas fa-plus-circle me-2"></i>Thêm Sản Phẩm Mới
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <c:out value="${modalBody}" /> <!-- This is where content will be dynamically rendered -->
                        <div class="form-container">
                            <form action="manager" method="POST">
                                <input type="hidden" name="action" value="create"/>

                                <div class="mb-3">
                                    <label for="productName" class="form-label">
                                        <i class="fas fa-tag me-1"></i>Tên Sản Phẩm:
                                    </label>
                                    <input type="text" class="form-control" id="productName" name="productName" required>
                                </div>

                                <div class="mb-3">
                                    <label for="productPrice" class="form-label">
                                        <i class="fas fa-dollar-sign me-1"></i>Giá:
                                    </label>
                                    <div class="input-group">
                                        <input type="number" step="0.01" class="form-control" id="productPrice" name="productPrice" required>
                                        <span class="input-group-text">đ</span>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="productImage" class="form-label">
                                        <i class="fas fa-image me-1"></i>URL Hình Ảnh:
                                    </label>
                                    <input type="text" class="form-control" id="productImage" name="productImage" required>
                                    <div class="form-text">Vui lòng nhập URL hình ảnh hợp lệ</div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="categoryId" class="form-label">
                                                <i class="fas fa-folder me-1"></i>ID Danh Mục:
                                            </label>
                                            <input type="number" class="form-control" id="categoryId" name="categoryId" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="toppingId" class="form-label">
                                                <i class="fas fa-cookie me-1"></i>ID Topping:
                                            </label>
                                            <input type="number" class="form-control" id="toppingId" name="toppingId" required>
                                        </div>
                                    </div>
                                </div>

                                <hr>
                                <h6 class="mb-3"><i class="fas fa-file-alt me-1"></i>Chi Tiết Mô Tả</h6>

                                <div class="mb-3">
                                    <label for="descriptionTitle" class="form-label">Tiêu Đề Mô Tả:</label>
                                    <input type="text" class="form-control" id="descriptionTitle" name="descriptionTitle">
                                </div>

                                <div class="mb-3">
                                    <label for="descriptionText" class="form-label">Nội Dung Mô Tả:</label>
                                    <textarea class="form-control" id="descriptionText" name="descriptionText" rows="3"></textarea>
                                </div>

                                <div class="d-flex justify-content-end gap-2 mt-4">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        <i class="fas fa-times me-1"></i>Đóng
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-1"></i>Tạo Sản Phẩm
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>