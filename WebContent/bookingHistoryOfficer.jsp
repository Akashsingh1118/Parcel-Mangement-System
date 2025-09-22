<%@page import="java.util.List"%>
<%@page import="com.dao.ParcelManagementDAO"%>
<%@page import="com.entity.Booking"%>
<%@page import="javax.servlet.http.*"%>
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
    <title>Booking History - Customer</title>
    <style>
    	body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
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
        .header .welcome {
            
            font-size: 18px;
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
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #001f3f;
            color: white;
        }
        h1 {
            color: #333;
            text-align: center;
        }
    </style>
</head>
<body>
	<div class="header">
        <span class="welcome">Welcome  <span id="username">Officer</span></span>
        <button class="home-button" onclick="window.location.href='officer-home.jsp'">Home</button>
    </div>
    <div class="container">
    <h1>Booking History</h1>

    <table>
        <thead>
            <tr>
               
                <th>Booking ID</th>
                <th>Sender Name</th>
                <th>Booking Date</th>
                <th>Receiver Name</th>
                <th>Delivered Address</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                HttpSession s2 = request.getSession(false);
                if (session != null) {
                    String customerID = (String) session.getAttribute("officerUsername");
                    if (customerID != null) {
                        ParcelManagementDAO dao = new ParcelManagementDAO();
                        List<Booking> bookings = dao.getAllBookings();

                        if (!bookings.isEmpty()) {
                            for (Booking booking : bookings) {
            %>
                                <tr>
                                    
                                    <td><%= booking.getBookingID() %></td>
                                    <td><%= booking.getSenderName() %></td> 
                                    <td><%= booking.getDateOfBooking() %></td>
                                    <td><%= booking.getReceiverName() %></td>
                                    <td><%= booking.getReceiverAddress() %></td>
                                    <td><%= booking.getServiceCost() %></td>
                                    <td><%= booking.getStatus() %></td>
                                </tr>
            <%
                            }
                        } else {
            %>
                            <tr>
                                <td colspan="7">No booking history found.</td>
                            </tr>
            <%
                        }
                    } else {
            %>
                        <tr>
                            <td colspan="7">No customer ID found in session.</td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="7">No active session found. Please log in.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
    </div>
</body>
</html>