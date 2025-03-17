<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng của bạn</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            .quantity-input {
                width: 50px;
                text-align: center;
            }
            .product-image {
                max-width: 100px;
                max-height: 100px;
                object-fit: contain;
            }
            .empty-cart-message {
                padding: 40px 0;
                text-align: center;
            }
            .cart-alert {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h1 class="mb-4">Giỏ hàng của bạn</h1>

            <c:if test="${not empty requestScope.message}">
                <div class="alert alert-success cart-alert" role="alert">
                    ${requestScope.message}
                </div>
            </c:if>

            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-danger cart-alert" role="alert">
                    ${requestScope.error}
                </div>
            </c:if>

            <c:if test="${empty cart.items}">
                <div class="empty-cart-message">
                    <h3>Giỏ hàng của bạn hiện đang trống</h3>
                    <p class="mb-4">Hãy thêm các sản phẩm vào giỏ hàng để tiếp tục mua sắm</p>
                    <a href="${pageContext.request.contextPath}/menu" class="btn btn-primary">
                        <i class="fas fa-shopping-cart"></i> Tiếp tục mua sắm
                    </a>
                </div>
            </c:if>

            <c:if test="${not empty cart.items}">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td>
                                        <img src="<c:url value="/products/${item.product.id}.jpg" />" 
                                             alt="${item.product.name}" class="product-image">
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/product?id=${item.product.id}">
                                            ${item.product.name}
                                        </a>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/cart" method="get" class="d-inline">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="${item.product.id}">
                                            <div class="input-group">
                                                <input type="number" name="quantity" value="${item.quantity}" 
                                                       min="1" class="form-control quantity-input">
                                                <div class="input-group-append">
                                                    <button type="submit" class="btn btn-sm btn-outline-secondary">
                                                        <i class="fas fa-sync-alt"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${item.cost}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/cart?action=remove&id=${item.product.id}" 
                                           class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                                            <i class="fas fa-trash"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" class="text-right"><strong>Tổng cộng:</strong></td>
                                <td>
                                    <strong>
                                        <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </strong>
                                </td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="row mt-4">
                    <div class="col-md-6">
                        <a href="${pageContext.request.contextPath}/menu" class="btn btn-primary">
                            <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                        </a>

                        <a href="${pageContext.request.contextPath}/cart?action=empty" 
                           class="btn btn-outline-danger ml-2" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm trong giỏ hàng?')">
                            <i class="fas fa-trash"></i> Xóa tất cả
                        </a>
                    </div>
                    <div class="col-md-6 text-right">
                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Thanh toán
                        </a>
                    </div>
                </div>
            </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>