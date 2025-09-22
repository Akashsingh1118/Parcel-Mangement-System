<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
		HttpSession s1=request.getSession(false);
		boolean isLoggedIn=(s1!=null && s1.getAttribute("isLoggedIn")!=null)? (boolean) s1.getAttribute("isLoggedIn"):false;
		System.out.println(isLoggedIn);
		if(!isLoggedIn)
		{
			response.sendRedirect("home.jsp");
			return;
		}
		 response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Booking Successful - Parcel Management System">
    <title>Booking Successful</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="header">
        <h1>Booking Successful</h1>
        <button onclick="window.location.href='index.html'">Logout</button>
    </div>
    <div class="container">
        <h2>Thank you for your booking!</h2>
        <p>Your booking has been successfully processed.</p>
        
        <h3>Booking Details:</h3>
        <table>
            <tr>
                <th>Booking ID:</th>
                <td><%= request.getParameter("bookingID") %></td>
            </tr>
            <tr>
                <th>Sender Name:</th>
                <td><%= request.getParameter("senderName") %></td>
            </tr>
            <tr>
                <th>Receiver Name:</th>
                <td><%= request.getParameter("receiverName") %></td>
            </tr>
            <tr>
                <th>Parcel Weight:</th>
                <td><%= request.getParameter("parcelWeight") %> kg</td>
            </tr>
            <tr>
                <th>Service Cost:</th>
                <td>$<%= request.getParameter("serviceCost") %></td>
            </tr>
            <tr>
                <th>Pickup Time:</th>
                <td><%= request.getParameter("pickupTime") %></td>
            </tr>
            <tr>
                <th>Dropoff Time:</th>
                <td><%= request.getParameter("dropoffTime") %></td>
            </tr>
        </table>

        <h3>Next Steps:</h3>
        <p>You will receive a confirmation email shortly with all the booking details.</p>
        <p>If you have any questions, please contact our support team.</p>
        
        <button onclick="window.location.href='booking-customer.jsp'">Book Another Parcel</button>
    </div>
</body>
</html>