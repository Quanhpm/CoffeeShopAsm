<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fc;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 750px;
        }

        .form-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 360px;
            margin-top: 80px;
        }

.btn-register {
    background-color: #1d5c3d !important;  
    color: white !important;  
    width: 100%;
    border-radius: 8px;
    padding: 10px 15px;  
    font-weight: bold;
}

.btn-register:hover {
    background-color: #15492e !important;  
}


        .forgot-password, .register {
            text-decoration: none;
            color: #1d5c3d;
            display: block;
            margin-top: 10px;
        }

        .forgot-password:hover, .register:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="form-container">
        <h3>Create an Account</h3>
        <p class="text-muted">* indicates required field</p>
        <form action="register" method="POST">
            <div class="mb-3 text-start">
                <label class="form-label">* Username </label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
            </div>
            <div class="mb-3 text-start">
                <label class="form-label">* Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3 text-start">
                <label class="form-label">* Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <button type="submit" class="btn btn-register mt-3">Register</button>
        </form>
        <div class="mt-3">
            <p class="register">Already have an account? <a href="login.jsp">Login</a></p>
            <a href="#" class="forgot-password">Forgot your password?</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
