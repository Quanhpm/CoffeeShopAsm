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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
@WebServlet(name = "SortController", urlPatterns = {"/sort"})
public class SortController extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO(); // Giả sử có DAO để lấy dữ liệu

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy tham số sortOrder từ URL (asc hoặc desc)
            String sortOrder = request.getParameter("sortOrder");
            boolean ascending = "asc".equalsIgnoreCase(sortOrder);

            // Lấy danh sách sản phẩm đã sắp xếp
            List<ProductDTO> sortedProducts = productDAO.getProductsSortedByPrice(ascending);

            // Lấy categoryId từ request (nếu có)
            String categoryIdStr = request.getParameter("categoryId");
            Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : 0;

// Lấy categoryName từ session nếu không có trong request
            String categoryName = request.getParameter("categoryName");
            if (categoryName == null) {
                categoryName = (String) request.getSession().getAttribute("categoryName");
            }

// Lưu categoryName vào session và request để không bị mất
            request.getSession().setAttribute("categoryName", categoryName);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("categoryId", categoryId);

            // Lưu danh sách vào request và chuyển hướng đến trang JSP
            request.setAttribute("productList", sortedProducts);
            RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải danh sách sản phẩm.");
        }
    }

}
