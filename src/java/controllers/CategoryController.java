/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */

//quanhpam
//quanh
@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        // Khởi tạo ProductDAO
        productDAO = new ProductDAO();
    }
    // abc

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy category từ tham số URL
        String category = request.getParameter("category");

        if (category == null || category.isEmpty()) {
            response.sendRedirect("index.jsp"); // Nếu không có category, chuyển hướng về trang chủ
            return;
        }

        try {
            // Lấy danh sách sản phẩm theo category
            List<ProductDTO> products = productDAO.getProductsByCategory(category);

            // Gửi danh sách sản phẩm vào request
            request.setAttribute("category", category);
            request.setAttribute("products", products);

            // Chuyển hướng tới JSP để hiển thị sản phẩm
            RequestDispatcher dispatcher = request.getRequestDispatcher("categoryPage.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while fetching products");
        }
    }

    @Override
    public void destroy() {
        // Hủy tài nguyên nếu cần thiết
        productDAO = null;
    }
}
