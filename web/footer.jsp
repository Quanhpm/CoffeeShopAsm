<%-- 
    Document   : footer
    Created on : Mar 23, 2025, 11:09:13 PM
    Author     : Admin
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>


            .footer {
                background-color: var(--passio-green-dark);
                color: white;
                padding: 40px 0 20px;
            }

            .footer-logo {
                font-size: 1.8rem;
                font-weight: 800;
                margin-bottom: 20px;
            }

            .footer-links {
                list-style: none;
                padding-left: 0;
            }

            .footer-links li {
                margin-bottom: 10px;
            }

            .footer-links a {
                color: rgba(255,255,255,0.8);
                text-decoration: none;
                transition: all 0.3s ease;
            }

            .footer-links a:hover {
                color: white;
                padding-left: 5px;
            }

            .social-links a {
                color: white;
                background: rgba(255,255,255,0.1);
                width: 36px;
                height: 36px;
                border-radius: 50%;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                margin-right: 10px;
                transition: all 0.3s ease;
            }

            .social-links a:hover {
                background: rgba(255,255,255,0.2);
                transform: translateY(-3px);
            }

            .copyright {
                border-top: 1px solid rgba(255,255,255,0.1);
                padding-top: 20px;
                margin-top: 40px;
                font-size: 0.9rem;
                color: rgba(255,255,255,0.7);
            }
        </style>
    </head>




    <body>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <h3 class="footer-logo">PASSIO</h3>
                        <p>Không chỉ là cà phê, đó là trải nghiệm.</p>
                        <div class="social-links mt-4">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>

                    <div class="col-6 col-lg-2 mb-4 mb-lg-0">
                        <h5>Thông Tin</h5>
                        <ul class="footer-links">
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Sản phẩm</a></li>
                            <li><a href="#">Khuyến mãi</a></li>
                            <li><a href="#">Cửa hàng</a></li>
                        </ul>
                    </div>

                    <div class="col-6 col-lg-2 mb-4 mb-lg-0">
                        <h5>Hỗ Trợ</h5>
                        <ul class="footer-links">
                            <li><a href="#">Liên hệ</a></li>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Đặt hàng</a></li>
                            <li><a href="#">Giao hàng</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4">
                        <h5>Đăng Ký Nhận Tin</h5>
                        <p>Nhận thông tin khuyến mãi và cập nhật mới nhất</p>
                        <div class="input-group mb-3">
                            <input type="email" class="form-control" placeholder="Email của bạn" aria-label="Email của bạn">
                            <button class="btn btn-outline-light" type="button">Đăng Ký</button>
                        </div>
                    </div>
                </div>

                <div class="text-center copyright">
                    <p>&copy; 2025 Passio Coffee. Tất cả quyền được bảo lưu.</p>
                </div>
            </div>
        </footer>    </body>
</html>
