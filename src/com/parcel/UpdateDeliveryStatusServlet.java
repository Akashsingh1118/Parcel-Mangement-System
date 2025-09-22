package com.parcel;

import com.dao.ParcelManagementDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateDeliveryStatusServlet")
public class UpdateDeliveryStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParcelManagementDAO dao;

    public void init() {
        dao = new ParcelManagementDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingID = request.getParameter("bookingID");
        String newStatus = request.getParameter("status");

        try {
            boolean isUpdated = dao.updateDeliveryStatus(bookingID, newStatus);
            if (isUpdated) {
                request.setAttribute("successMessage", "Delivery status updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update delivery status. Please check the Booking ID.");
            }

            request.getRequestDispatcher("deliveryStatus.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("deliveryStatus.jsp").forward(request, response);
        }
    }
}
