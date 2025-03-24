<%-- 
    Document   : checkout
    Created on : Mar 23, 2025, 11:56:20 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .success-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 90%;
            animation: fadeIn 0.8s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .success-icon {
            width: 80px;
            height: 80px;
            background-color: #4CAF50;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px;
            position: relative;
            animation: scaleIn 0.5s ease-in-out 0.3s both;
        }
        
        @keyframes scaleIn {
            from { transform: scale(0); }
            to { transform: scale(1); }
        }
        
        .success-icon::before, .success-icon::after {
            content: '';
            background-color: white;
            position: absolute;
        }
        
        .success-icon::before {
            width: 5px;
            height: 15px;
            transform: translate(-10px, 8px) rotate(45deg);
        }
        
        .success-icon::after {
            width: 25px;
            height: 5px;
            transform: translate(2px, 8px) rotate(135deg);
        }
        
        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border: 2px solid #4CAF50;
        }
        
        .btn:hover {
            background-color: white;
            color: #4CAF50;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }
        
        .order-details {
            background-color: #f1f9f1;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: left;
        }
        
        .order-details h3 {
            color: #4CAF50;
            margin-bottom: 10px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon"></div>
        <h1>Thanh toán thành công!</h1>
        <p>Cảm ơn bạn đã mua sắm. Đơn hàng của bạn đã được xác nhận và đang được xử lý.</p>
        
        <div class="order-details">
            <h3>Thông tin đơn hàng</h3>
            <p>Đơn hàng của bạn sẽ được giao trong thời gian sớm nhất. Bạn có thể kiểm tra trạng thái đơn hàng trong tài khoản của mình.</p>
        </div>
        
        <a href="menu" class="btn">Tiếp tục mua sắm</a>
    </div>
</body>
</html>