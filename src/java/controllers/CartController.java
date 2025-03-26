    package controllers;

import dao.ProductDAO;
import dto.Cart;
import dto.Item;
import dto.ProductDTO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CartController.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        String quantityParam = request.getParameter("quantity");
        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = request.getContextPath() + "/home";
        }

        try {
            if ("add".equals(action) && idParam != null) {
                int id = Integer.parseInt(idParam);
                int quantity = 1;
                
                try {
                    if (quantityParam != null && !quantityParam.isEmpty()) {
                        quantity = Integer.parseInt(quantityParam);
                        if (quantity <= 0) {
                            request.setAttribute("error", "Số lượng phải lớn hơn 0");
                            quantity = 1;
                        }
                    }
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.WARNING, "Invalid quantity format: {0}", quantityParam);
                    request.setAttribute("error", "Định dạng số lượng không hợp lệ");
                    quantity = 1;
                }

                try {
                    ProductDAO dao = new ProductDAO();
                    ProductDTO product = dao.getProductById(id);

                    if (product != null) {
                        Item item = new Item(product, quantity);
                        cart.add(item);
                        request.setAttribute("message", "Đã thêm sản phẩm vào giỏ hàng");
                    } else {
                        request.setAttribute("error", "Không tìm thấy sản phẩm với ID: " + id);
                    }
                } catch (ClassNotFoundException ex) {
                    LOGGER.log(Level.SEVERE, "Database error when fetching product", ex);
                    request.setAttribute("error", "Lỗi cơ sở dữ liệu khi tìm sản phẩm");
                }
            } else if ("remove".equals(action) && idParam != null) {
                try {
                    int id = Integer.parseInt(idParam);
                    cart.remove(id);
                    request.setAttribute("message", "Đã xóa sản phẩm khỏi giỏ hàng");
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.WARNING, "Invalid ID format: {0}", idParam);
                    request.setAttribute("error", "ID sản phẩm không hợp lệ");
                }
            } else if ("update".equals(action) && idParam != null && quantityParam != null) {
                try {
                    int id = Integer.parseInt(idParam);
                    int quantity = Integer.parseInt(quantityParam);
                    
                    if (quantity > 0) {
                        cart.update(id, quantity);
                        request.setAttribute("message", "Đã cập nhật số lượng sản phẩm");
                    } else {
                        cart.remove(id);
                        request.setAttribute("message", "Đã xóa sản phẩm khỏi giỏ hàng do số lượng <= 0");
                    }
                } catch (NumberFormatException e) {
                    LOGGER.log(Level.WARNING, "Invalid ID or quantity format: ID={0}, quantity={1}", new Object[]{idParam, quantityParam});
                    request.setAttribute("error", "ID hoặc số lượng không hợp lệ");
                }
            } else if ("empty".equals(action)) {
                cart.empty();
                request.setAttribute("message", "Đã xóa tất cả sản phẩm khỏi giỏ hàng");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in CartController", e);
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(referer);
    }
}