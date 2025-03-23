/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.OrderDAO;
import dto.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private OrderDAO orderDAO;

    public OrderController() {
        this.orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role");

        if (userRole == null || !userRole.equals("admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            List<OrderDTO> orderList = orderDAO.select();
            request.setAttribute("orderList", orderList);
            request.setAttribute("page", "orderManagement.jsp");
            request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role");

        if (userRole == null || !userRole.equals("admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("update".equals(action)) {
                updateOrder(request);
                String page = "order";
                request.setAttribute("action", page);
                RequestDispatcher dispatcher = request.getRequestDispatcher("manager?action=order");
                dispatcher.forward(request, response);
            } else if ("delete".equals(action)) {
                deleteOrder(request);
            } else if ("showUpdateForm".equals(action)) {
                showUpdateForm(request, response);
                return;
            }
            response.sendRedirect("OrderController");//fix here
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            OrderDTO order = orderDAO.read(orderId + "");
            request.setAttribute("order", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateOrder.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateOrder(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        String orderID = request.getParameter("orderId");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));
        String status = request.getParameter("status");
        String createdAt = request.getParameter("createdAt");

        OrderDTO order = orderDAO.read(orderId + "");
        if (order != null) {
            order.setTotalPrice(totalPrice);
            order.setStatus(status);
            order.setCreatedAt(java.sql.Date.valueOf(createdAt));
            orderDAO.update(order);

        }
    }

    private void deleteOrder(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderDAO.delete(orderId);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
