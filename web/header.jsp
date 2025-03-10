<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .navbar-custom {
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }
        .navbar-brand img {
            height: 40px;
        }
        .nav-link {
            font-weight: bold;
            color: black !important;
            text-transform: uppercase;
        }
        .nav-item {
            margin-right: 20px;
        }
        .btn-sign-in {
            border: 1px solid black;
            background-color: white;
            color: black;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .btn-join-now {
            background-color: black;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .btn-sign-in:hover {
            background-color: #f1f1f1;
        }
        .btn-join-now:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="https://i.ibb.co/3YYvhqZr/image.png" alt="Logo"> 
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="#">Menu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Rewards</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Gift Cards</a></li>
            </ul>
        </div>

        <div class="d-flex align-items-center">
            <span class="me-3">
                <i class="bi bi-geo-alt-fill"></i> <a href="#" class="text-dark text-decoration-none">Find a store</a>
            </span>
            <p>Welcome, <%= session.getAttribute("username") %></p>
            
            <div>
            <a href="login.jsp" class="btn btn-sign-in me-2">Sign in</a>
            <a href="register.jsp" class="btn btn-join-now">Sign up</a>
            </div>
                        <a href="logout" class="btn btn-join-now" >Logout</a>

        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
