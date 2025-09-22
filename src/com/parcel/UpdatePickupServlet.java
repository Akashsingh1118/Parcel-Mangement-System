package com.parcel;

import com.dao.ParcelManagementDAO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdatePickupServlet")
public class UpdatePickupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");
        String pickupTime = request.getParameter("pickupTime");
        String dropTime = request.getParameter("dropTime");

        ParcelManagementDAO dao = new ParcelManagementDAO();
        boolean updateSuccessful = dao.updatePickupAndDropTime(bookingID, pickupTime, dropTime);

        if (updateSuccessful) {
            request.setAttribute("successMessage", "<p class='success-message'>Pickup and Drop times updated successfully.</p>");
        } else {
            request.setAttribute("errorMessage", "<p class='error-message'>Failed to update times. Please check the Booking ID.</p>");
        }

        request.getRequestDispatcher("pickupSchedule.jsp").forward(request, response);
    }
}
