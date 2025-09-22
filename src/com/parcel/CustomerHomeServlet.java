package com.parcel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerHomeServlet")
public class CustomerHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userID") != null) {
            String userRole = (String) session.getAttribute("userRole");
            request.getRequestDispatcher("customerHome.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
        }
    }
}
