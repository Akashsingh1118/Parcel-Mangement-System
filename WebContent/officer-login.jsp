<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Officer Login - Parcel Management System">
    <title>Officer Login</title>
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
        .login-container {
            background-color: #f8f9fa;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 500px;
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
        .redirect-button {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }
        .redirect-button:hover {
            background-color: #0056b3;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Officer Login</h2>
        <form action="OfficerLoginServlet" method="post">
            <div class="input-field">
                <label for="officer-username">User ID:</label>
                <input type="text" id="officer-username" name="username" minlength="5" maxlength="20" required>
            </div>
            <div class="input-field">
                <label for="officer-password">Password:</label>
                <input type="password" id="officer-password" name="password" minlength="8" maxlength="30" required>
            </div>
            <div class="error-message" id="officer-error">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <%= request.getAttribute("errorMessage") %>
                <% } %>
            </div>
            <div class="button-container">
	            <button type="submit" class="button">Login</button>
	            <button class="home-button" onclick="window.location.href='home.jsp'">Home</button>
            </div>
        </form>
    </div>
</body>
</html>