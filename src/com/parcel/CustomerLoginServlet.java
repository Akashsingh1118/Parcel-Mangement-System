package com.parcel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ParcelManagementDAO;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ParcelManagementDAO parcelDAO = new ParcelManagementDAO();

        if (parcelDAO.validateCustomer(username, password)) {
        	HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("isLoggedIn", true);
            response.sendRedirect("customer-home.jsp");
        } else {
//        	request.setAttribute("isLoggedIn", false);
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
}