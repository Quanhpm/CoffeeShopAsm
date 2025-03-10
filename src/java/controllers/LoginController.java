/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AccountDAO;
import dto.AccountDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;     
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userName = request.getParameter("userName");
        String password = request.getParameter("Password");

        String url = "error.jsp"; // Default to error page

        try {
            AccountDAO accountDAO = new AccountDAO();
            List<AccountDTO> accountList = accountDAO.select();

            if (accountList != null && !accountList.isEmpty()) {
                AccountDTO foundAccount = null;
                for (AccountDTO accountDTO : accountList) {
                    if (accountDTO.getUserName().equals(userName) && accountDTO.getPassword().equals(password)) {
                        foundAccount = accountDTO;
                    }
                }

                if (foundAccount != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", foundAccount.getUserName()); // **Lưu tên người dùng vào session**
                    response.sendRedirect("menu");
                    return;
                } else {
                    url = "login.jsp";
                    request.setAttribute("errorMessage", "Incorrect username or password");
                }
            } else {
                request.setAttribute("errorMessage", "Database error or no accounts found.");
                url = "login.jsp";
            }

            request.getRequestDispatcher(url).forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
        return "Short description";
    }
}
