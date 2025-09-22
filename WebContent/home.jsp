<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
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
%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Parcel Management System Home">
    <meta name="author" content="Your Name">
    <title>Parcel Management System - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom right, rgba(0, 0, 50, 0.8), rgba(0, 0, 50, 0.8)), url('background.jpg') no-repeat center center/cover;
            color: white;
        }
        .container {
            text-align: center;
            background-color: rgba(2, 36, 60, 0.7);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
        }
        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #f8f9fa;
        }
        .dashboard-button {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
            text-decoration: none;
        }
        .dashboard-button:hover {
            background-color: #218838;
        }
        .logout-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
        }
        .logout-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Parcel Management</h1>
        <a href="customer-login.jsp" class="dashboard-button">Customer</a>
        <a href="officer-login.jsp" class="dashboard-button">Officer</a>
    </div>
</body>
</html>