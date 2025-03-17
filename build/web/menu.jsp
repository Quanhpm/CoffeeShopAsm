<%-- Document : menu Created on : Mar 7, 2025, 11:16:08 PM Author : Admin --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product List Page</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .banner { background-color: #1e3932; color: white; padding: 2rem; border-radius: 10px; margin-bottom: 2rem; margin-top: 5%; }
        .banner-title { font-size: 1.5rem; font-weight: 600; }
        .banner-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(60px, 1fr)); gap: 1rem; margin-top: 1rem; }
        .category-nav { overflow-x: auto; white-space: nowrap; padding: 1rem 0; margin-bottom: 2rem; }
        .category-btn { border: none; background: none; padding: 0.5rem 1rem; margin-right: 1rem; color: #666; font-weight: 500; }
        .category-btn.active { color: #1e3932; font-weight: 600; border-bottom: 2px solid #1e3932; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1rem; }
        .product-card { border: 1px solid #eee; border-radius: 10px; padding: 1rem; position: relative; }
        .favorite-btn { position: absolute; top: 1rem; right: 1rem; background: white; border: none; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .product-name { font-weight: 500; margin-bottom: 0.5rem; }
        .product-price { color: #1e3932; font-weight: 600; }
        .add-to-cart { width: 30px; height: 30px; border: 1px solid #1e3932; color: #1e3932; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; float: right; }
    </style>
</head>
<body>
    <!-- User info and navigation links -->
    <%@ include file="header.jsp" %>
    <div class="container py-4">
        <!-- Banner Section -->
        <div class="banner">
            <div class="banner-title">Summer's brightest new drinks</div>
            <p>Introducing the Pineapple Passionfruit Starbucks Refreshers® Beverage and the Starbucks® Paradise Drink with creamy coconutmilk</p>
            <button class="btn btn-outline-light btn-sm mt-2">Order Now</button>
        </div>

        <!-- Category Navigation -->
        <div class="category-nav">
                        <form action="category" method="GET" style="display: inline;">
                <button type="submit" name="categoryId" value="0" class="category-btn ${categoryId == 0 ? 'active' : ''}">All Products</button>
            </form>
            <form action="category" method="GET" style="display: inline;">
                <button type="submit" name="categoryId" value="1" class="category-btn ${categoryId == 1 ? 'active' : ''}">Trà</button>
            </form>
            <form action="category" method="GET" style="display: inline;">
                <button type="submit" name="categoryId" value="2" class="category-btn ${categoryId == 2 ? 'active' : ''}">Cà Phê</button>
            </form>
            <form action="category" method="GET" style="display: inline;">
                <button type="submit" name="categoryId" value="3" class="category-btn ${categoryId == 3 ? 'active' : ''}">Đá Xay & Sinh Tố</button>
            </form>
            <form action="category" method="GET" style="display: inline;">
                <button type="submit" name="categoryId" value="4" class="category-btn ${categoryId == 4 ? 'active' : ''}">Nước Ép</button>
            </form>

        </div>

        <!-- Product Grid -->
        <h2>${categoryName}</h2>
        <div class="product-grid">
            <c:forEach var="product" items="${productList}">
                <div class="product-card">
                    <button class="favorite-btn">
                        <i class="far fa-heart"></i>
                    </button>
                    <div class="product-name">${product.name}</div>
                    <div class="product-price">
                        $<fmt:formatNumber value="${product.price}" pattern="#,##0"/>
                        <a href="<c:url value="/cart?action=add&id=${product.id}&quantity=1" />">
                            <button class="add-to-cart">
                                <i class="fas fa-plus"></i>
                            </button>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
