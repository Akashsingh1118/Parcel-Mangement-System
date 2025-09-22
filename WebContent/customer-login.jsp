<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Customer Login - Parcel Management System">
    <meta name="author" content="Your Name">
    <title>Customer Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #CADCFC;
        }
        .login-container {
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 40%;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .input-field {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        .button {
            padding: 15px 30px;
            font-size: 16px;
            background-color: #002147;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #001534; 
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .new-registration {
            margin-top: 20px;
            text-align: center;
        }
        .new-registration a {
            color: #002147;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            transition: color 0.3s;
        }
        .new-registration a:hover {
            color: #001534;
        }
        .home-button {
            margin-left: 10px;
            padding: 15px 30px;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .home-button:hover {
            background-color: #218838;
        }
    </style>
    
</head>
<body>
    <div class="login-container">
        <h2>Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <div class="input-field">
                <label for="customer-username">User ID:</label>
                <input type="text" id="customer-username" name="username" minlength="5" maxlength="20" required>
            </div>
            <div class="input-field">
                <label for="customer-password">Password:</label>
                <input type="password" id="customer-password" name="password" minlength="8" maxlength="30" required>
            </div>
            <div class="error-message" id="customer-error">
                <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
            </div>
            <div class="button-container">
                <button type="submit" class="button">Login</button>
                <button class="home-button" onclick="window.location.href='home.jsp'">Home</button>
            </div>
        </form>
        <div class="new-registration">
            <p>New User? <a href="customer-registration.jsp">Register Here</a></p>
        </div>
    </div>
</body>
</html>