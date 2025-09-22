package com.parcel;

import com.dao.ParcelManagementDAO;
import com.entity.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FetchDeliveryStatusServlet")
public class FetchDeliveryStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParcelManagementDAO dao;

    public void init() {
        dao = new ParcelManagementDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");

        try {
            Booking booking = dao.fetchBookingDetails(bookingID);
            if (booking != null) {
                request.setAttribute("bookingID", booking.getBookingID());
                request.setAttribute("fullName", booking.getSenderName());
                request.setAttribute("recName", booking.getReceiverName());
                request.setAttribute("recAddress", booking.getReceiverAddress());
                request.setAttribute("dateOfBooking", booking.getDateOfBooking());
                request.setAttribute("parStatus", booking.getStatus());
            } else {
                request.setAttribute("errorMessage", "Invalid Booking ID. Please enter a correct ID.");
            }

            request.getRequestDispatcher("deliveryStatus.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("deliveryStatus.jsp").forward(request, response);
        }
    }
}
