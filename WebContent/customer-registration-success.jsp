<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	//	HttpSession s1=request.getSession(false);
	//	boolean isLoggedIn=(s1!=null && s1.getAttribute("isLoggedIn")!=null)? (boolean) s1.getAttribute("isLoggedIn"):false;
	//	System.out.println(isLoggedIn);
	//	if(!isLoggedIn)
	//	{
	//		response.sendRedirect("home.jsp");
	//		return;
	//	}
	//	 response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
		// response.setHeader("Pragma", "no-cache");
		// response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Registration Success - Parcel Management System">
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6ffe6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-container {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .success-container h2 {
            color: #00cc00;
        }
        .button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h2>Registration Successful</h2>
        <p>Your account has been created successfully!</p>
        <button class="button" onclick="window.location.href='customer-login.jsp'">Go to Login</button>
    </div>
</body>
</html>