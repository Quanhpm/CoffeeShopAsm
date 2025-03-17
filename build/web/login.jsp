<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fc;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 800px;


        
        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 360px;
        }
        .btn-signin {
            background-color: #1d5c3d;
            color: white;
            width: 100%;
            border-radius: 8px;
        }
        .btn-signin:hover {
            background-color: #15492e;
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
                         

<div class="login-container">
    <h3>Sign in</h3>
    <p class="text-muted">* indicates required field</p>
    <form action="MainController" method="post">
        <div class="mb-3 text-start">
            <label class="form-label">* Username or email address</label>
            <input class="form-control" placeholder="Enter your username or email" name="userName" type="text" required>
        </div>
        <div class="mb-3 text-start">
            <label class="form-label">* Password</label>
            <input name="Password" type="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <div class="form-check text-start">
            <input class="form-check-input" type="checkbox" id="keep-signed-in" checked>
            <label class="form-check-label" for="keep-signed-in">Keep me signed in. <a href="#" class="text-success">Details</a></label>
        </div>
        <button class="btn btn-signin mt-3" type="submit" value="login_submit" name="action">Sign In</button>
    </form>
    <div class="mt-3">
        <p class="register">Don't have an account ? <a href="register.jsp">Register</a></p>
        <a href="#" class="forgot-password">Forgot your password?</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
