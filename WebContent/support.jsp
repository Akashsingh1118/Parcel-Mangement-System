<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
		HttpSession s1=request.getSession(false);
		boolean isLoggedIn=(s1!=null && s1.getAttribute("isLoggedIn")!=null)? (boolean) s1.getAttribute("isLoggedIn"):false;
		System.out.println(isLoggedIn);
		if(!isLoggedIn)
		{
			response.sendRedirect("customer-login.jsp");
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
    <title>Customer Support</title>
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
            max-width: 700px;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
        }
        h2 {
            color: #001f3f;
        }
        .contact-info {
            margin-top: 20px;
        }
        .contact-info p {
            font-size: 18px;
            line-height: 1.6;
        }
        .contact-info p span {
            font-weight: bold;
            color: #001f3f;
        }
        .contact-info .logout-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <span class="welcome">Welcome <span id="username">Customer</span></span>
        <button class="home-button" onclick="window.location.href = 'customer-home.jsp'">Home</button>
    </div>

    <!-- Customer Support Contact Information -->
    <div class="container" style="text-align:center">
        <h2>Customer Support</h2>

        <!-- Contact Details -->
        <div class="contact-info" >
            <p><span>Contact Number:</span> +91 7800706641</p>
            <p><span>Email:</span> support@ParcelWallah.com</p>
            <p><span>Address:</span>Sector 135, Noida</p>
        </div>
    </div>

</body>
</html>