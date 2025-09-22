<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
		//HttpSession s1=request.getSession(false);
	//	Boolean isLoggedIn=(s1!=null && s1.getAttribute("isLoggedIn")!=null)? (Boolean) s1.getAttribute("isLoggedIn"):false;
	//	System.out.println(isLoggedIn);
		//if(!isLoggedIn)
	//	{
			//response.sendRedirect("home.jsp");
	//		return;
		//}
	//	 response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
	//	 response.setHeader("Pragma", "no-cache");
		// response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Customer Registration - Parcel Management System">
    <title>Customer Registration</title>
    <style>
        /* Add your CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #020000;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .registration-container {
            width: 50%;
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 8px;
        }
        .input-field, .acknowledgment {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input, select {
            padding: 10px;
            margin-top: 5px;
            width: 100%;
        }
        .button {
            padding: 10px 20px;
            background-color: #002147;
            color: white;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #001534;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>Customer Registration</h2>
        <form method="POST" action="CustomerRegistrationServlet" id="registrationForm">
            <div class="input-field">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" maxlength="50" required>
            </div>
            <div class="input-field">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-field">
                <label for="mobile">Mobile Number:</label>
                <select id="countryCode" name="countryCode">
                    <option value="+91">+91 (India)</option>
                </select>
                <input type="tel" id="mobile" name="mobileNumber" pattern="\d{10}\" required>
            </div>
            <div class="input-field">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="input-field">
                <label for="username">User ID:</label>
                <input type="text" id="username" name="username" minlength="5" maxlength="20" required>
            </div>
            <div class="input-field">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" minlength="8" maxlength="30" required>
            </div>
            <div class="input-field">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div id="error-message" class="error"></div>
            <div class="button-container">
                <button type="submit" class="button">Register</button>
            </div>
        </form>
    </div>

    <script>
        const form = document.getElementById('registrationForm');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        const errorMessage = document.getElementById('error-message');

        form.addEventListener('submit', function(event) {
            if (password.value !== confirmPassword.value) {
                event.preventDefault();
                errorMessage.textContent = 'Passwords do not match.';
            }
        });
    </script>
</body>
</html>