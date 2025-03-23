package controllers;

import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Comparator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {
    //ok
    // Map để lưu trữ tên category theo ID
    private static final Map<Integer, String> CATEGORY_NAMES = new HashMap<>();

    static {
        CATEGORY_NAMES.put(1, "Trà");
        CATEGORY_NAMES.put(2, "Cà Phê");
        CATEGORY_NAMES.put(3, "Đá Xay & Sinh Tố");
        CATEGORY_NAMES.put(4, "Nước Ép");
        CATEGORY_NAMES.put(0, "All Products");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            // Lấy categoryId từ request
            String categoryIdStr = request.getParameter("categoryId");
            int categoryId = 0; // Mặc định là 0 (All Products)

            // Nếu có categoryId được gửi lên, chuyển đổi thành số nguyên
            if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
                try {
                    categoryId = Integer.parseInt(categoryIdStr);
                } catch (NumberFormatException e) {
                    // Nếu không phải số, sử dụng giá trị mặc định (0 - All Products)
                    System.out.println("Invalid categoryId format: " + categoryIdStr);
                }
            }
            
            // Lấy tham số sắp xếp từ request
            String sortBy = request.getParameter("sortBy");
            String sortOrder = request.getParameter("sortOrder");
            
            // Mặc định sắp xếp theo ID nếu không có tham số sortBy
            if (sortBy == null || sortBy.isEmpty()) {
                sortBy = "id";
            }
            
            // Mặc định sắp xếp tăng dần nếu không có tham số sortOrder
            if (sortOrder == null || sortOrder.isEmpty()) {
                sortOrder = "asc";
            }

            // Tạo đối tượng ProductDAO
            ProductDAO productDAO = new ProductDAO();
            List<ProductDTO> productList;

            // Lấy danh sách sản phẩm dựa vào categoryId
            if (categoryId == 0) {
                // Nếu categoryId = 0 (All Products), lấy tất cả sản phẩm
                productList = productDAO.select();
            } else {
                // Ngược lại, lấy sản phẩm theo categoryId
                productList = productDAO.getProductsByCategoryId(categoryId);
            }
            
            // Sắp xếp danh sách sản phẩm theo tham số sortBy và sortOrder
            sortProductList(productList, sortBy, sortOrder);

            // Debug: In ra số lượng sản phẩm tìm thấy
            System.out.println("Found " + productList.size() + " products for category ID: " + categoryId);
            System.out.println("Sorting by: " + sortBy + ", Order: " + sortOrder);

            // Lấy tên category từ ID
            String categoryName = CATEGORY_NAMES.getOrDefault(categoryId, "Unknown");

            // Lưu thông tin vào request attributes để JSP có thể sử dụng
            request.setAttribute("productList", productList);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("allCategories", CATEGORY_NAMES);
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("sortOrder", sortOrder);

            // Forward request đến trang menu.jsp
            request.getRequestDispatcher("/menu.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi truy xuất dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
    
    // Phương thức sắp xếp danh sách sản phẩm
    private void sortProductList(List<ProductDTO> productList, String sortBy, String sortOrder) {
        Comparator<ProductDTO> comparator = null;
        
        // Xác định comparator dựa trên trường cần sắp xếp
        switch (sortBy.toLowerCase()) {
            case "name":
                comparator = Comparator.comparing(ProductDTO::getName);
                break;
            case "price":
                comparator = Comparator.comparing(ProductDTO::getPrice);
                break;
            case "category":
                comparator = Comparator.comparing(ProductDTO::getCategoryId);
                break;
            case "id":
            default:
                comparator = Comparator.comparing(ProductDTO::getId);
                break;
        }
        
        // Nếu sắp xếp giảm dần, đảo ngược comparator
        if ("desc".equalsIgnoreCase(sortOrder)) {
            comparator = comparator.reversed();
        }
        
        // Thực hiện sắp xếp danh sách
        productList.sort(comparator);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CategoryController Servlet handles displaying products by category with sorting functionality";
    }
}