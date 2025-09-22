package com.parcel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.entity.Booking;
import com.dao.*;
import java.util.*;

@WebServlet("/BookingHistoryOfficerServlet")
public class BookingHistoryOfficerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("officerUsername") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("officer-login.jsp");
        } else {
            // Retrieve booking history using DAO
            ParcelManagementDAO dao = new ParcelManagementDAO();
            List<Booking> bookings = dao.getAllBookings(); // New method to get all bookings
            request.setAttribute("bookings", bookings);
            
            // Forward to booking history Officer JSP
            request.getRequestDispatcher("bookingHistoryOfficer.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}