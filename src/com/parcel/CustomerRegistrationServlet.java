package com.parcel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ParcelManagementDAO;

@WebServlet("/CustomerRegistrationServlet")
public class CustomerRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobileNumber");
        String address = request.getParameter("address");
        String customerUsername = request.getParameter("username");
        String password = request.getParameter("password");

        ParcelManagementDAO parcelDAO = new ParcelManagementDAO();

        boolean isRegistered = parcelDAO.registerCustomer(customerName, customerUsername, password, email, mobile, address);
        if (isRegistered) {
            response.sendRedirect("customer-registration-success.jsp");
        } else {
            response.getWriter().println("Error: Registration failed."); // You might want to redirect to an error page instead
        }
    }
}