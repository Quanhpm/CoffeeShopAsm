
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>Coffee Shop Banner</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .banner-section {
            background-color: white;
            position: relative;
            overflow: hidden;
            min-height: 500px;
        }
        
        .green-bg {
            position: absolute;
            background-color: #1e7145;
            width: 60%;
            height: 150%;
            right: -10%;
            top: -20%;
            border-radius: 50% 0 0 50%;
            z-index: 0;
        }
        
        .logo img {
            width: 60px;
            height: auto;
        }
        
        .nav-link {
            color: #333;
            font-weight: 500;
            margin: 0 15px;
        }
        
        .nav-link:hover {
            color: #1e7145;
        }
        
        .banner-content {
            position: relative;
            z-index: 1;
            padding-top: 80px;
        }
        
        .banner-title {
            font-size: 2.5rem;
            font-weight: 700;
            line-height: 1.2;
        }
        
        .brand-name {
            color: #1e7145;
            font-weight: 800;
        }
        
        .banner-text {
            color: #666;
            margin: 20px 0;
            max-width: 450px;
        }
        
        .btn-learn-more {
            background-color: #1e7145;
            color: white;
            border-radius: 25px;
            padding: 10px 30px;
            font-weight: 500;
            border: none;
        }
        
        .btn-learn-more:hover {
            background-color: #165c36;
            color: white;
        }
        
        .coffee-cup {
            position: relative;
            z-index: 1;
            max-width: 100%;
            transform: rotate(15deg);
        }
        
        .social-icons {
            position: fixed;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 100;
        }
        
        .social-icons a {
            display: block;
            color: white;
            margin: 15px 0;
        }
        
        .pagination-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
        }
        
        .dot {
            height: 10px;
            width: 10px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            margin: 0 5px;
        }
        
        .dot.active {
            background-color: white;
        }
        
        @media (max-width: 992px) {
            .coffee-cup {
                margin-top: 40px;
                transform: rotate(0);
            }
            
            .green-bg {
                width: 100%;
                height: 50%;
                right: 0;
                top: 50%;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>
    <div class="banner-section">
        <div class="green-bg"></div>
        
        <!-- Navigation -->
        
        <!-- Banner Content -->
        <div class="container">
            <div class="row banner-content">
                <div class="col-lg-6">
                    <h1 class="banner-title">IT'S NOT JUST COFFEE,<br>IT'S <span class="brand-name">PASSIO</span></h1>
                    <p class="banner-text">Khám phá hương vị đặc trưng từ những hạt cà phê tuyển chọn, được pha chế với tình yêu và sự tận tâm để mang đến trải nghiệm cà phê hoàn hảo cho bạn mỗi ngày.</p>
                    <a href="menu">
    <button class="btn btn-learn-more">LEARN MORE</button>
</a>

                </div>
                <div class="col-lg-6 text-center">
                    <img src="./products/matcha.png" alt="Coffee Cup" class="coffee-cup img-fluid">
                </div>
            </div>
        </div>
        
        <!-- Social Icons -->
        <div class="social-icons">
            <a href="https://www.facebook.com/giahao.luong.370"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.instagram.com/_winson04_/"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
        
        <!-- Pagination Dots -->
        <div class="pagination-dots">
            <span class="dot active"></span>
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>