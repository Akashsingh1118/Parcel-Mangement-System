package com.parcel;

import com.dao.ParcelManagementDAO;

import com.entity.Booking;
import com.entity.*;
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
import java.time.LocalDateTime;

@WebServlet("/BookingCustomerServlet")
public class BookingCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userId = (String) session.getAttribute("username");
        if (userId == null) {
            response.sendRedirect("customer-login.jsp"); // Redirect to login if session is invalid
            return;
        }

        // Create Booking object from request parameters
        Booking booking = new Booking();
        booking.setUserID(userId);
        booking.setSenderName(request.getParameter("senderName"));
        booking.setSenderMobileNumber(request.getParameter("senderContact"));
        booking.setReceiverName(request.getParameter("receiverName"));
        booking.setReceiverAddress(request.getParameter("receiverAddress"));
        booking.setReceiverPin(request.getParameter("receiverPin"));
        booking.setReceiverMobileNumber(request.getParameter("receiverContact"));
        booking.setParcelWeight(Double.parseDouble(request.getParameter("parcelWeight")));
        booking.setContentsDescription(request.getParameter("contentsDescription"));
        booking.setDeliverySpeed(request.getParameter("deliverySpeed"));
        booking.setPackagingPreference(request.getParameter("packagingPreference"));
        booking.setPickupTime(request.getParameter("pickupTime").replace('T', ' ') + ":00");
        booking.setDropoffTime(request.getParameter("dropoffTime").replace('T', ' ') + ":00");
        // Calculate service cost
        booking.setServiceCost(calculateServiceCost(booking.getParcelWeight(), booking.getDeliverySpeed()));
        int bookingID = generateRandomBookingID();
        booking.setBookingID(bookingID);

        ParcelManagementDAO parcelDao = new ParcelManagementDAO();
        try {
            parcelDao.insertBooking(booking);
            request.setAttribute("bookingID", bookingID);
            request.getRequestDispatcher("booking-customer.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error occurred while booking.");
            request.getRequestDispatcher("booking-customer.jsp").forward(request, response);
        }
    }
    private double calculateServiceCost(double weight, String deliverySpeed) {
        double baseRate = 5.0; // Base cost per kg
        double speedMultiplier = deliverySpeed.equalsIgnoreCase("Express") ? 2.0 : 1.0;
        return weight * baseRate * speedMultiplier;
    }

    // Method to generate a random 6-digit booking ID
    private int generateRandomBookingID() {
        return (int)(Math.random() * 900000) + 100000; // Generates a number between 100000 and 999999
    }
}


