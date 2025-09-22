package com.parcel;
import com.dao.*;
import com.entity.Booking;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/TrackingOfficerServlet")
public class TrackingOfficerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParcelManagementDAO parcelDAO;

    @Override
    public void init() throws ServletException {
        parcelDAO = new ParcelManagementDAO(); // Initialize DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");

        try {
            Booking booking = parcelDAO.getTrackingDetailsForOfficer(bookingID);

            // Set attributes to pass to the JSP if booking is found
            request.setAttribute("bookingID", booking.getBookingID());
            request.setAttribute("fullName", booking.getSenderName());
            request.setAttribute("receiverName", booking.getReceiverName());
            request.setAttribute("receiverAddress", booking.getReceiverAddress());
            request.setAttribute("dateOfBooking", booking.getDateOfBooking());
            request.setAttribute("parcelStatus", booking.getStatus());
            request.setAttribute("parcelPrice", booking.getServiceCost());

            // Forward to JSP
            request.getRequestDispatcher("tracking-status-officer.jsp").forward(request, response);
        } catch (SQLException e) {
            // Set error message if booking ID is incorrect or not found
            request.setAttribute("errorMessage", "Booking ID not found or unauthorized.");
            request.getRequestDispatcher("tracking-status-officer.jsp").forward(request, response);
        }
    }
}
