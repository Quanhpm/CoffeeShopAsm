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

    private ProductDAO productDAO = new ProductDAO(); // DAO để lấy dữ liệu sản phẩm

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Lấy tham số sắp xếp
            String sortBy = request.getParameter("sortBy"); // "price"
            String sortOrder = request.getParameter("sortOrder"); // "asc" hoặc "desc"
            boolean ascending = "asc".equalsIgnoreCase(sortOrder);

            // Lấy categoryId từ request
            String categoryIdStr = request.getParameter("categoryId");
            Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : 0;

            // Lấy categoryName từ session nếu không có trong request
            String categoryName = request.getParameter("categoryName");
            if (categoryName == null) {
                categoryName = (String) request.getSession().getAttribute("categoryName");
            }

            // Lấy từ khóa tìm kiếm nếu có
            String searchQuery = request.getParameter("searchQuery");

            // Lấy danh sách sản phẩm dựa trên tìm kiếm hoặc danh mục
            List<ProductDTO> productList;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                productList = productDAO.searchProducts(searchQuery);
            } else {
                productList = productDAO.getProductsByCategoryId(categoryId);
            }

            // Nếu sắp xếp theo giá, chỉ sắp xếp danh sách đã lọc
            if ("price".equalsIgnoreCase(sortBy)) {
                productList = productDAO.sortProductListByPrice(productList, ascending);
            }

            // Lưu dữ liệu vào request
            request.getSession().setAttribute("categoryName", categoryName);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("productList", productList);

            // Chuyển hướng đến menu.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tải danh sách sản phẩm.");
        }
    }
}

