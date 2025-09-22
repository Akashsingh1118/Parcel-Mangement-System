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
    <meta name="description" content="Parcel Management System - Tracking Status">
    <title>Tracking Status - Customer</title>
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
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 30%;
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
        #print-button {
       		margin-top: 10px;
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
    </style>
</head>
<body>
    <div class="header">
        <span class="welcome">Welcome <span id="username">Officer</span></span>
        <button class="home-button" onclick="window.location.href='officer-home.jsp'">Home</button>
    </div>
    <p></p>
    <div class="container">
        <form action="TrackingOfficerServlet" method="post">
            <h4>Enter Your Booking ID</h4>
            <input type="text" name="bookingID" placeholder="Booking ID" required>
            <button type="submit" class="button">Track</button>
        </form>
        
        <div id="trackingInfo">
            <%-- Display the tracking info if available --%>
            <%
                Integer bookingID = (Integer) request.getAttribute("bookingID");
                if (bookingID != null) {
                    String fullName = (String) request.getAttribute("fullName");
                  //  String senderAddress = (String) request.getAttribute("senderAddress");
                    String receiverName = (String) request.getAttribute("receiverName");
                    String receiverAddress = (String) request.getAttribute("receiverAddress");
                    String dateOfBooking = (String) request.getAttribute("dateOfBooking");
                    String parcelStatus = (String) request.getAttribute("parcelStatus");
                    double parcelPrice=(double) request.getAttribute("parcelPrice");
            %>
                <h2>Tracking Details</h2>
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
                        <td><%= receiverName %></td>
                    </tr>
                    <tr>
                        <th>Receiver Address</th>
                        <td><%= receiverAddress %></td>
                    </tr>
                    <tr>
                        <th>Date of Booking</th>
                        <td><%= dateOfBooking %></td>
                    </tr>
                    <tr>
                        <th>Parcel Status</th>
                        <td><%= parcelStatus %></td>
                    </tr>
                    <tr>
                        <th>Parcel Service Cost</th>
                        <td><%= parcelPrice %></td>
                    </tr>
                </table>
            <% } %>
        </div>
        <button type="submit" id="print-button" onclick="window.print()">Generate invoice</button>
    </div>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% if (errorMessage != null) { %>
    <p style="color: red; text-align:center; font-weight: bold"><%= errorMessage %></p>
<% } %>
</body>
</html>
