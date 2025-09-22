<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		HttpSession s1=request.getSession(false);
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
    <title>Pickup Schedule - Officer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
		 .header .home-button {
            background-color: green;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .container {
            width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .input-field {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #218838;
        }
        .error {
            color: red;
            margin-top: 5px;
        }
    .success-message {
        color: green;
        font-weight: bold;
    }
    .error-message {
        color: red;
        font-weight: bold;
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
        <h1>Update Pickup and Drop Time</h1>

        <form action="FetchPickupDetailsServlet" method="post">
            <!-- Input Booking ID -->
            <div class="input-field">
                <label for="bookingID">Booking ID:</label>
                <input type="text" id="bookingID" name="bookingID" required>
            </div>
            
            <!-- Submit Button to fetch details -->
            <div class="input-field">
                <button type="submit" class="button">Fetch Details</button>
            </div>
        </form>

        <!-- Display error message if Booking ID not found -->
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>

        <!-- Display booking details if available -->
        <c:if test="${not empty bookingID}">
            <form action="UpdatePickupServlet" method="post">
                <div class="input-field">
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" value="${fullName}" readonly>
                </div>
                <div class="input-field">
                    <label for="recName">Receiver Name:</label>
                    <input type="text" id="recName" name="recName" value="${recName}" readonly>
                </div>
                <div class="input-field">
                    <label for="recAddress">Receiver Address:</label>
                    <input type="text" id="recAddress" name="recAddress" value="${recAddress}" readonly>
                </div>
                <div class="input-field">
                    <label for="bookingDate">Date of Booking:</label>
                    <input type="text" id="bookingDate" name="bookingDate" value="${bookingDate}" readonly>
                </div>
                <div class="input-field">
                    <label for="parcelStatus">Parcel Status:</label>
                    <input type="text" id="parcelStatus" name="parcelStatus" value="${parcelStatus}" readonly>
                </div>

                <!-- Pickup and Drop Time Update -->
                <div class="input-field">
                    <label for="pickupTime">New Pickup Time:</label>
                    <input type="datetime-local" id="pickupTime" name="pickupTime" required>
                </div>
                <div class="input-field">
                    <label for="dropTime">New Drop Time:</label>
                    <input type="datetime-local" id="dropTime" name="dropTime" required>
                </div>

                <input type="hidden" name="bookingID" value="${bookingID}">
				<%-- Success Message --%>
				<c:if test="${not empty successMessage}">
				    <div class="success-message">${successMessage}</div>
				</c:if>
				
				<%-- Error Message --%>
				<c:if test="${not empty errorMessage}">
				    <div class="error-message">${errorMessage}</div>
				</c:if>

                <!-- Submit Button -->
                <div class="input-field">
                    <button type="submit" class="button">Update Times</button>
                </div>
              
            </form>
        </c:if>
    </div>
</body>
</html>
