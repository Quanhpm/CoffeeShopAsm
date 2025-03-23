<%-- 
    Document   : home
    Created on : Mar 11, 2025, 10:30:06 PM
    Author     : Admin
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Passio Coffee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --passio-green: #1e7145;
                --passio-green-light: #2a8d58;
                --passio-green-dark: #165c36;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                overflow-x: hidden;
                color: #333;
            }
            
            .section-title {
                font-weight: 800;
                margin-bottom: 1.5rem;
                position: relative;
                display: inline-block;
            }
            
            .section-title::after {
                content: '';
                position: absolute;
                width: 50%;
                height: 4px;
                background-color: var(--passio-green);
                bottom: -10px;
                left: 0;
                border-radius: 2px;
            }
            
            .featured-products {
                padding: 80px 0;
                background-color: #f8f9fa;
            }
            
            .product-card {
                background: white;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                transition: all 0.3s ease;
                margin-bottom: 30px;
                border: none;
            }
            
            .product-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            }
            
            .product-img {
                height: 200px;
                object-fit: cover;
            }
            
            .product-price {
                color: var(--passio-green);
                font-weight: 700;
                font-size: 1.2rem;
            }
            
            .btn-order {
                background-color: var(--passio-green);
                color: white;
                border-radius: 30px;
                padding: 8px 20px;
                font-weight: 600;
                border: none;
                transition: all 0.3s ease;
            }
            
            .btn-order:hover {
                background-color: var(--passio-green-dark);
                color: white;
            }
            
            .about-section {
                padding: 80px 0;
                position: relative;
                overflow: hidden;
            }
            
            .about-img {
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            }
            
            .about-text {
                line-height: 1.8;
            }
            
            .testimonials {
                padding: 80px 0;
                background-color: #f8f9fa;
                position: relative;
            }
            
            .testimonial-card {
                background: white;
                border-radius: 15px;
                padding: 30px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                margin: 20px 10px;
                position: relative;
            }
            
            .testimonial-card::before {
                content: '"';
                position: absolute;
                top: 10px;
                left: 20px;
                font-size: 5rem;
                color: rgba(30, 113, 69, 0.1);
                font-family: Georgia, serif;
                line-height: 1;
            }
            
            .customer-img {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 15px;
            }
            
            .customer-info {
                display: flex;
                align-items: center;
                margin-top: 20px;
            }
            
            .customer-name {
                font-weight: 600;
                margin-bottom: 0;
            }
            
            .customer-title {
                color: #777;
                font-size: 0.9rem;
            }
            
            .contact-section {
                padding: 80px 0;
                background-color: white;
            }
            
            .contact-info {
                margin-bottom: 30px;
            }
            
            .contact-icon {
                color: var(--passio-green);
                font-size: 1.5rem;
                margin-right: 15px;
            }
            
            .map-container {
                height: 300px;
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }
            
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
        <%@ include file="header.jsp" %>
        <%@ include file="banner.jsp" %>
        
        <!-- Featured Products Section -->
        <section class="featured-products">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="section-title">Sản Phẩm Nổi Bật</h2>
                    <p class="text-muted">Khám phá những thức uống đặc biệt của chúng tôi</p>
                </div>
                
                <div class="row">
                    <!-- Product 1 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card product-card">
                            <img src="./products/8.jpg" class="card-img-top product-img" alt="Cà Phê Sữa Đá">
                            <div class="card-body">
                                <h5 class="card-title">Cà Phê Sữa Đá</h5>
                                <p class="card-text text-muted">Hương vị đậm đà, thơm béo</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="product-price">45.000đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 2 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card product-card">
                            <img src="./products/9.jpg" class="card-img-top product-img" alt="Matcha Đá Xay">
                            <div class="card-body">
                                <h5 class="card-title">Matcha Đá Xay</h5>
                                <p class="card-text text-muted">Vị ngọt thanh mát, đậm đà</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="product-price">55.000đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 3 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card product-card">
                            <img src="./products/15.jpg" class="card-img-top product-img" alt="Trà Đào Cam Sả">
                            <div class="card-body">
                                <h5 class="card-title">Trà Đào Cam Sả</h5>
                                <p class="card-text text-muted">Vị chua ngọt, thơm mát</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="product-price">49.000đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Product 4 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card product-card">
                            <img src="./products/banhmithinguoi.jpg" class="card-img-top product-img" alt="Bánh Mì Thịt Nguội">
                            <div class="card-body">
                                <h5 class="card-title">Bánh Mì Thịt Nguội</h5>
                                <p class="card-text text-muted">Giòn tan, đầy đặn nhân</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="product-price">35.000đ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- About Section -->
        <section class="about-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 mb-4 mb-lg-0">
                        <img src="./products/hatcaphe.jpg" alt="Về Passio" class="img-fluid about-img">
                    </div>
                    <div class="col-lg-6">
                        <h2 class="section-title">Câu Chuyện Passio</h2>
                        <p class="about-text">Passio ra đời với sứ mệnh mang đến những trải nghiệm cà phê đặc biệt, nơi mỗi tách cà phê không chỉ là thức uống mà còn là câu chuyện về nguồn gốc, về quá trình và về tình yêu.</p>
                        <p class="about-text">Chúng tôi lựa chọn những hạt cà phê tốt nhất từ các vùng nguyên liệu nổi tiếng, kết hợp với công thức pha chế độc đáo và tình yêu với nghề để tạo nên những thức uống hoàn hảo.</p>
                        <p class="about-text">Tại Passio, chúng tôi không chỉ phục vụ cà phê, mà còn mang đến không gian thư giãn, kết nối và truyền cảm hứng.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="section-title">Khách Hàng Nói Gì</h2>
                    <p class="text-muted">Những trải nghiệm thực tế từ khách hàng của chúng tôi</p>
                </div>
                
                <div class="row">
                    <!-- Testimonial 1 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="testimonial-card">
                            <p>"Cà phê ở Passio luôn là lựa chọn hàng đầu của tôi mỗi buổi sáng. Hương vị đậm đà, phục vụ nhanh chóng và không gian thoải mái."</p>
                            <div class="customer-info">
                                <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Customer" class="customer-img">
                                <div>
                                    <p class="customer-name">Nguyễn Thị Hương</p>
                                    <p class="customer-title">Khách hàng thường xuyên</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Testimonial 2 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="testimonial-card">
                            <p>"Trà đào cam sả ở đây thực sự tuyệt vời! Tôi thường ghé qua vào buổi chiều để thưởng thức và làm việc. Không gian yên tĩnh, wifi mạnh."</p>
                            <div class="customer-info">
                                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Customer" class="customer-img">
                                <div>
                                    <p class="customer-name">Trần Văn Minh</p>
                                    <p class="customer-title">Freelancer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Testimonial 3 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="testimonial-card">
                            <p>"Đội ngũ nhân viên thân thiện, món nào cũng ngon. Đặc biệt là bánh mì thịt nguội, kết hợp với cà phê sữa đá là hoàn hảo cho bữa sáng."</p>
                            <div class="customer-info">
                                <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Customer" class="customer-img">
                                <div>
                                    <p class="customer-name">Lê Thị Mai</p>
                                    <p class="customer-title">Giáo viên</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Contact Section -->
        <section class="contact-section">
            <div class="container">
                <div class="text-center mb-5">
                    <h2 class="section-title">Liên Hệ</h2>
                    <p class="text-muted">Ghé thăm hoặc liên hệ với chúng tôi</p>
                </div>
                
                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="contact-info d-flex align-items-start">
                            <i class="fas fa-map-marker-alt contact-icon"></i>
                            <div>
                                <h5>Địa Chỉ</h5>
                                <p>Đại Học FPT Thành Phố Hồ Chí Minh</p>
                            </div>
                        </div>
                        
                        <div class="contact-info d-flex align-items-start">
                            <i class="fas fa-phone-alt contact-icon"></i>
                            <div>
                                <h5>Điện Thoại</h5>
                                <p>0918 430 153</p>
                            </div>
                        </div>
                        
                        <div class="contact-info d-flex align-items-start">
                            <i class="fas fa-envelope contact-icon"></i>
                            <div>
                                <h5>Email</h5>
                                <p>quocanhdang02@gmail.com</p>
                            </div>
                        </div>
                        
                        <div class="contact-info d-flex align-items-start">
                            <i class="fas fa-clock contact-icon"></i>
                            <div>
                                <h5>Giờ Mở Cửa</h5>
                                <p>Thứ 2 - Chủ Nhật: 7:00 - 22:00</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-8">
                        <div class="map-container">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9320.05621438263!2d106.81242462399683!3d10.841820847122925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1742743649592!5m2!1svi!2s" width="900" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Footer -->
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
        </footer>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>