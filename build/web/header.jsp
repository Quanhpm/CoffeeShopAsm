<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <style>
            .navbar-custom {
                background-color: #ffffff;
                height: 70px;
                width: 100%;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                padding: 10px 0;
                display: flex;
                justify-content: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  
            }
            .navbar-brand img {
                width: 100px;
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
                margin-right: 0;
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
            .search-form {
                position: relative;
                width: 250px;
            }
            .search-form .form-control {
                border-radius: 20px;
                padding-right: 40px;
                border: 1px solid #ddd;
            }
            .search-form .search-button {
                position: absolute;
                right: 10px;
                top: 5px;
                border: none;
                background: none;
                color: #555;
            }
            .search-form .form-control:focus {
                box-shadow: 0 0 0 0.25rem rgba(0, 0, 0, 0.1);
                border-color: #999;
            }
            body {
                padding-top: 70px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">
                    <img src="https://i.ibb.co/CKTQy3JZ/image.png" alt="Logo"> 
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Gift Cards</a></li>
                    </ul>
                    
                    <!-- Search Form -->
                    <form action="MainController" method="get" class="search-form me-3">
                        <input type="text" class="form-control" name="txtSearchValue" placeholder="Search..." value="${param.txtSearchValue}">
                        <button type="submit" class="search-button" name="btAction" value="Search">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                </div>
                
                <div class="d-flex align-items-center">
                    <span class="me-3">
                        <i class="bi bi-cart"></i> <a href="cart.jsp" class="text-dark text-decoration-none">Cart</a>
                    </span>
                    <c:if test="${not empty sessionScope.username}">               
                        <button class="btn btn-outline-dark rounded-pill px-3 py-2 me-2">
                            ${sessionScope.username}
                        </button>            
                        <a href="logout" class="btn btn-join-now">Logout</a>
                    </c:if>
                    <c:if test="${empty sessionScope.username}">
                        <div>
                            <a href="login.jsp" class="btn btn-sign-in me-2">Sign in</a>
                            <a href="register.jsp" class="btn btn-join-now">Sign up</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>