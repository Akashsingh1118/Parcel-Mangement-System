package com.parcel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookingHistoryServlet")
public class BookingHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ensure that the user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerID") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("customer-login.jsp");
        } else {
            // Forward to booking history JSP
            request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}