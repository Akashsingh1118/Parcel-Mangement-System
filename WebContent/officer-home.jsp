<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
    HttpSession s2 = request.getSession();
	String userName = null;	
	if(s2 != null) {
		userName = (String) session.getAttribute("username");
	}
    
    %>
    <%
		HttpSession s1=request.getSession(false);
    	System.out.println(s1.getAttribute("isLoggedIn"));
		Boolean isLoggedIn=(s1!=null && s1.getAttribute("isLoggedIn")!=null)? (Boolean) s1.getAttribute("isLoggedIn"):false;
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
    <meta name="description" content="Officer Home - Parcel Management System">
    <meta name="author" content="Your Name">
    <title>Officer Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #CADCFC;
        }
        .header {
            background-color: #002147;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h1 {
            margin: 0;
        }
        .menu {
            display: flex;
            gap: 15px;
        }
        .menu a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        #logout {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
            background-color: red;
            cursor: pointer;
        }
        .menu a:hover {
            background-color: #001534;
        }
        .welcome {
            margin: 20px;
            font-size: 20px;
        }
        .content {
            padding: 20px;
        }
        .button {
            background-color: #002147; 
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #001534; 
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Parcel Management System</h1>
        <div class="menu">
            <a href="officer-home.jsp">Home</a>
            <a href="tracking-status-officer.jsp">Tracking</a>
            <a href="pickupSchedule.jsp">Pickup and Drop </a>
            <a href="booking-officer.jsp">Booking</a>
            <a href="bookingHistoryOfficer.jsp">Previous Booking</a>
            <a href="deliveryStatus.jsp">Delivery Update</a>
            <form action="${pageContext.request.contextPath }/Logout" method="post"><input type="submit"  id="logout" value="Logout"></form></div>
        </div>
    </div>
    <div class="content">
        <div class="welcome" id="welcome-message"></div>
        <h2>Welcome to Your Home Page officer</h2>
        <p>Select an option from the menu above to proceed.</p>
    </div>

    
</body>
</html>
