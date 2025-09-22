package com.parcel;

import com.dao.ParcelManagementDAO;
import com.entity.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/TrackingStatusServlet")
public class TrackingStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("username").toString();
        String bookingID = request.getParameter("bookingID");

        ParcelManagementDAO dao = new ParcelManagementDAO();
        try {
            Booking booking = dao.getTrackingDetails(bookingID, userId);

            if (booking != null) {
                // Set booking attributes to pass to the JSP
                request.setAttribute("bookingID", bookingID);
                request.setAttribute("fullName", booking.getSenderName());
                request.setAttribute("receiverName", booking.getReceiverName());
                request.setAttribute("receiverAddress", booking.getReceiverAddress());
                request.setAttribute("dateOfBooking", booking.getDateOfBooking());
                request.setAttribute("parcelStatus", booking.getStatus());
                request.setAttribute("parcelPrice", booking.getServiceCost());

                request.getRequestDispatcher("tracking-status.jsp").forward(request, response);
            } else {
                // Display error if Booking ID not found
                request.setAttribute("errorMessage", "Booking ID not found or unauthorized access.");
                request.getRequestDispatcher("tracking-status.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}