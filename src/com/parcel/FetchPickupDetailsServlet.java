package com.parcel;

import com.dao.ParcelManagementDAO;
import com.entity.Booking;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/FetchPickupDetailsServlet")
public class FetchPickupDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");

        ParcelManagementDAO dao = new ParcelManagementDAO();
        Booking booking = dao.getPickupDetails(bookingID);

        if (booking != null) {
            request.setAttribute("bookingID", booking.getBookingID());
            request.setAttribute("fullName", booking.getSenderName());
            request.setAttribute("recName", booking.getReceiverName());
            request.setAttribute("recAddress", booking.getReceiverAddress());
            request.setAttribute("bookingDate", booking.getDateOfBooking());
            request.setAttribute("parcelStatus", booking.getStatus());
        } else {
            request.setAttribute("errorMessage", "<p class='error-message'>Booking ID not found.</p>");
        }

        request.getRequestDispatcher("pickupSchedule.jsp").forward(request, response);
    }
}
