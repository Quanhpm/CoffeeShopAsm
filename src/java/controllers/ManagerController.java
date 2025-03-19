package controllers;

import dao.OrderDAO;
import dao.ProductDAO;
import dto.ProductDTO;
import dto.DescriptionDTO;
import dto.OrderDTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "ManagerController", urlPatterns = {"/manager"})
public class ManagerController extends HttpServlet {

    private ProductDAO productDAO;
    private OrderDAO orderDAO;

    public ManagerController() {
        this.productDAO = new ProductDAO();
        this.orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role");

        // Check if the user is an admin
        if (userRole == null || !userRole.equals("admin")) {
            response.sendRedirect("login.jsp");  // Redirect to login if not admin
            return;
        }

        try {
            
            // Fetch all products and display them
            String page=request.getParameter("page");
            if(page == null){
                       List<ProductDTO> productList = productDAO.select();
            request.setAttribute("productList", productList);
            request.setAttribute("page", "manage.jsp");
            request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);
            }
           else if("product".equals(page)){
                       List<ProductDTO> productList = productDAO.select();
            request.setAttribute("productList", productList);
            request.setAttribute("page", "manage.jsp");
            request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);
            }else if("order".equals(page)){
                List<OrderDTO> orderList = orderDAO.select();
            request.setAttribute("orderList", orderList);
            request.setAttribute("page", "orderManagement.jsp");
            request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);
            }
     
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role");

        // Check if the user is an admin
        if (userRole == null || !userRole.equals("admin")) {
            response.sendRedirect("login.jsp");  // Redirect to login if not admin
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                createProduct(request);
            } else if ("update".equals(action)) {
                updateProduct(request);
            } else if ("delete".equals(action)) {
                deleteProduct(request);
            } else if ("showUpdateForm".equals(action)){
                showUpdateForm(request,response);
            }

            // Redirect back to the manager page after action
            response.sendRedirect("manager");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void createProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        // Retrieve product details from the request
        String name = request.getParameter("productName");
        float price = Float.parseFloat(request.getParameter("productPrice"));
        String image = request.getParameter("productImage");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int toppingId = Integer.parseInt(request.getParameter("toppingId"));
        String title = request.getParameter("descriptionTitle");
        String text = request.getParameter("descriptionText");

        // Create a new product
        ProductDTO product = new ProductDTO();
        product.setName(name);
        product.setPrice(price);
        product.setImage(image);
        product.setCategoryId(categoryId);
        product.setToppingId(toppingId);

        // If description exists, add it to the product
        if (title != null && !title.isEmpty() && text != null && !text.isEmpty()) {
            DescriptionDTO description = new DescriptionDTO(title, text);
            product.setDescription(description);
        }

        // Save the product
        productDAO.create(product);
    }
    
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        // Lấy ID sản phẩm từ request
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        // Truy vấn thông tin sản phẩm từ cơ sở dữ liệu
        ProductDAO productDAO = new ProductDAO();
        ProductDTO product = productDAO.getProductById(productId);
        
        // Đặt thông tin sản phẩm vào request
        request.setAttribute("product", product);
        
        // Chuyển tiếp đến trang cập nhật
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateProduct.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        // Xử lý ngoại lệ
        e.printStackTrace();
    }
}

    private void updateProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        // Retrieve product details from the request
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        float price = Float.parseFloat(request.getParameter("productPrice"));
        String image = request.getParameter("productImage");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int toppingId = Integer.parseInt(request.getParameter("toppingId"));
        String title = request.getParameter("descriptionTitle");
        String text = request.getParameter("descriptionText");

        // Fetch the product to update
        ProductDTO product = productDAO.read(productId);

        if (product != null) {
            if (name != null && !name.isEmpty()) {
                product.setName(name);
            }
            if (price > 0) {
                product.setPrice(price);
            }
            if (image != null && !image.isEmpty()) {
                product.setImage(image);
            }
            if (categoryId > 0) {
                product.setCategoryId(categoryId);
            }
            if (toppingId > 0) {
                product.setToppingId(toppingId);
            }

            // Update description if exists
            if (title != null && !title.isEmpty() && text != null && !text.isEmpty()) {
                if (product.getDescription() == null) {
                    product.setDescription(new DescriptionDTO(title, text));
                } else {
                    product.getDescription().setTitle(title);
                    product.getDescription().setText(text);
                }
            }

            // Save the updated product
            productDAO.update(product);
        }
    }

    private void deleteProduct(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        // Get the product ID from the request
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Delete the product
        productDAO.delete(productId);
    }
}
