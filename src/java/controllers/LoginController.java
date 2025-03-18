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
import javax.servlet.http.Cookie;
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
        String rememberMe = request.getParameter("rememberMe");

        String url = "error.jsp";  // Default error page

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
                    // Store user info in the session
                    HttpSession session = request.getSession();
                    session.setAttribute("username", foundAccount.getUserName());
                    session.setAttribute("role", foundAccount.getRole());

                    // Xử lý Remember Me
                    if (rememberMe != null) {
                        Cookie usernameCookie = new Cookie("COOKIE_USERNAME", userName);
                        Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", password);
                        Cookie rememberCookie = new Cookie("COOKIE_REMEMBER", "true");

                        usernameCookie.setMaxAge(60 * 60 * 24);
                        passwordCookie.setMaxAge(60 * 60 * 24);
                        rememberCookie.setMaxAge(60 * 60 * 24);

                        usernameCookie.setPath("/");
                        passwordCookie.setPath("/");
                        rememberCookie.setPath("/");

                        response.addCookie(usernameCookie);
                        response.addCookie(passwordCookie);
                        response.addCookie(rememberCookie);
                    } else {
                        Cookie rememberCookie = new Cookie("COOKIE_REMEMBER", "");
                        rememberCookie.setMaxAge(0);
                        rememberCookie.setPath("/");
                        response.addCookie(rememberCookie);
                    }

                    // Chuyển hướng theo vai trò
                    if ("admin".equals(foundAccount.getRole())) {
                        response.sendRedirect("manager");
                    } else {
                        response.sendRedirect("menu");
                    }
                    return;
                } else {
                    request.setAttribute("errorMessage", "Incorrect username or password");
                    url = "login.jsp";
                }
            } else {
                request.setAttribute("errorMessage", "Database error or no accounts found.");
                url = "login.jsp";
            }

            request.getRequestDispatcher(url).forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
        return "LoginController";
    }
}
