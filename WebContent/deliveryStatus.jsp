<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta name="description" content="Parcel Management System - Update Delivery Status">
    <title>Update Delivery Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #CADCFC;
        }
        .header {
		            background-color: #001f3f;
		            color: white;
		            padding: 10px;
		            text-align: right;
		            display: flex;
		            justify-content: space-between;
		            align-items: center;
		        }
		 .header .home-button {
            background-color: green;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 30%;
        }
        h2 {
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select {
            width: fit-content;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .button {
            background-color: #001f3f;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #001a35;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .error {
            color: red;
            font-weight: bold;
            text-align: center;
        }
        .success {
            color: green;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <span class="welcome">Welcome <span id="username">Officer</span></span>
        <button class="home-button" onclick="window.location.href='officer-home.jsp'">Home</button>
    </div>

    <div class="container">
        <h2>Update Delivery Status</h2>
        <form action="FetchDeliveryStatusServlet" method="POST">
            <label for="bookingID">Enter Booking ID:</label>
            <input type="text" id="bookingID" name="bookingID" placeholder="Booking ID" required>
            <input type="submit" value="Fetch Details" class="button">
        </form>

        <!-- Display fetched details if available -->
        <%
            Integer bookingID = (Integer) request.getAttribute("bookingID");
            String fullName = (String) request.getAttribute("fullName");
            String address = (String) request.getAttribute("address");
            String recName = (String) request.getAttribute("recName");
            String recAddress = (String) request.getAttribute("recAddress");
            String dateOfBooking = (String) request.getAttribute("dateOfBooking");
            String parStatus = (String) request.getAttribute("parStatus");
            
            if (bookingID != null) {
        %>
        <h3>Booking Details</h3>
        <table>
            <tr>
                <th>Booking ID</th>
                <td><%= bookingID %></td>
            </tr>
            <tr>
                <th>Sender Name</th>
                <td><%= fullName %></td>
            </tr>
            <tr>
                <th>Receiver Name</th>
                <td><%= recName %></td>
            </tr>
            <tr>
                <th>Receiver Address</th>
                <td><%= recAddress %></td>
            </tr>
            <tr>
                <th>Date of Booking</th>
                <td><%= dateOfBooking %></td>
            </tr>
            <tr>
                <th>Parcel Status</th>
                <td><%= parStatus %></td>
            </tr>
        </table>

        <form action="UpdateDeliveryStatusServlet" method="POST">
            <input type="hidden" name="bookingID" value="<%= bookingID %>">
            <p></p>
            <label for="status">Update Delivery Status:</label>
            <select id="status" name="status" required>
                <option value="Booked">Booked</option>
                <option value="In Transit">In Transit</option>
                <option value="Delivered">Delivered</option>
                <option value="Returned">Returned</option>
            </select>
            <input type="submit" value="Update Status" class="button">
        </form>
        <% 
            } else if (request.getAttribute("errorMessage") != null) {
                out.println("<p class='error'>" + request.getAttribute("errorMessage") + "</p>");
            }
            if (request.getAttribute("successMessage") != null) {
                out.println("<p class='success'>" + request.getAttribute("successMessage") + "</p>");
            }
        %>
    </div>
</body>
</html>
