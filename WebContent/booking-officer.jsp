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
    <meta name="description" content="Parcel Management System - Booking Service">
    <title>Booking Service - Customer</title>
    <style>
    /* Your existing styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #CADCFC;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
        .success-message {
            color: green;
            font-weight: bold;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        .input-field {
            margin-bottom: 15px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .header .home-button {
            background-color: green;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .header {
            background-color: #001f3f;
            color: white;
            padding: 10px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .button:hover {
            background-color: #001a35;
        }
        .success-message {
            color: green;
            font-weight: bold;
        }
    </style>
    <script>
    function calculateCost() {
        let weight = document.querySelector('input[name="parcelWeight"]').value;
        let deliverySpeed = document.querySelector('select[name="deliverySpeed"]').value;
        let cost;

        // Aligning with server-side calculation
        let baseRate = 5.0; // Base cost per kg
        let speedMultiplier = (deliverySpeed === "express") ? 2.0 : 1.0; // Lowercase for comparison

        cost = weight * baseRate * speedMultiplier;

        document.getElementById("costDisplay").innerText = "Estimated Service Cost: $" + cost.toFixed(2);
    }
      
        
        function confirmBookingOnSubmit() {
            // This will prevent form submission until booking ID is confirmed
            return confirm('Do you want to confirm the booking?');
        }

        function confirmBooking(bookingID) {
            alert('Booking successful! Your Booking ID is: ' + bookingID);
            window.location.href = 'officer-home.jsp?bookingID=' + bookingID;
        }
    </script>
</head>
<body>
    <div class="header">
        <span class="welcome">Welcome  <span id="username">Officer</span></span>
        <button class="home-button" onclick="window.location.href='officer-home.jsp'">Home</button>
    </div>
    <h1>Booking Service - Officer</h1>
    <div class="container">
        <form action="BookingOfficerServlet" method="post">
        <!-- Success message display -->
            <%
                Integer bookingID = (Integer) request.getAttribute("bookingID");
                if (bookingID != null) {
                    out.println("<p class='success-message'>Booking successful! Your Booking ID is: " + bookingID + "</p>");
                }
            %>
            
            <h2>Sender Information</h2>
            <div class="input-field">
            	<label for="sender-name">Sender Name</label>
            	<input type="text" id="sender-name" name="senderName" placeholder="Sender Name" required>
            </div>
            <div class="input-field">
	            <label for="sender-address">Sender Address</label>
	            <input type="text" id="sender-address" name="senderAddress" placeholder="Sender Address" required>
            </div>
            <div class="input-field">
	            <label for="sender-contact">Sender Contact</label>
	            <input type="text" id="sender-contact" name="senderContact" placeholder="Sender Contact" required>
            </div>
            <h2>Receiver Information</h2>
            <div class="input-field">
	            <label for="receiver-name">Receiver Name</label>
	            <input type="text" id="receiver-name" name="receiverName" placeholder="Receiver Name" required>
            </div>
            <div class="input-field">
            <label for="receiver-address">Receiver Address</label>
            <input type="text" id="receiver-address" name="receiverAddress" placeholder="Receiver Address" required>
            </div>
            <div class="input-field">
	            <label for="receiver-pin">Receiver Pin</label>
	            <input type="text" name="receiverPin" placeholder="Pin Code" required>
            </div>
            <div class="input-field">
	            <label for="receiver-contact">Receiver Contact</label>
	            <input type="text" name="receiverContact" placeholder="Receiver Contact" required>
            </div>
            <h2>Parcel Details</h2>
            <div class="input-field">
	            <label for="parcel-size">Parcel Size</label>
	            <input type="number" id="parcel-size" name="parcelSize" placeholder="Size (cm)" required>
            </div>
            <div class="input-field">
	            <label for="parcel-weight">Parcel Weight</label>
	            <input type="number" id="parcel-weight" name="parcelWeight" placeholder="Weight (kg)" required>
            </div>
            <div class="input-field">
	            <label for="contents-description">Contents Description</label>
	            <input type="text" id="contents-description" name="contentsDescription" placeholder="Contents Description" required>
            </div>

            <h2>Shipping Options</h2>
            <div class="input-field">
            <label for="delivery-speed">Choose Delivery Speed</label>
            <select name="deliverySpeed" id="delivery-speed">
                <option value="standard">Standard</option>
                <option value="express">Express</option>
            </select>
            </div>
            <div class="input-field">
            <label for="pacakging-preference">Choose Packaging Preference</label>
            <select name="packagingPreference" id="pacakging-preference">
                <option value="standard">Standard Packaging</option>
                <option value="custom">Custom Packaging</option>
                <option value="eco">Eco-friendly Packaging</option>
                <option value="fragile">Fragile Item Handling</option>
            </select>
            </div>

            <h2>Date and Time Selection</h2>
            <div class="input-field">
            <label for="pickup-date">Preferred Pickup Time</label>
            <input id="pickup-date" type="datetime-local" name="pickupTime" required>
            </div>
            <div class="input-field">
            <label for="dropoff-time">Preferred Drop-off Time</label>
            <input type="datetime-local" id="dropoff-time" name="dropoffTime" required>
            </div>

            <div class="input-field">
                <button type="button" class="button" onclick="calculateCost()">Calculate Cost</button>
                <p id="costDisplay" class="error"></p>
            </div>
            <button type="submit" class="button">Submit Booking</button>
        </form>
    </div>
</body>
</html>
