<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <title>Login Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url("img/banner/banner2.png");
                background-size: cover;
                /* Center the background image vertically and horizontally */
                background-position: center;
                /* Ensure that the background image remains fixed in place */
                background-attachment: fixed;
            }

            h2 {
                text-align: center;
                color: black;
            }

            form {
                width: 300px;
                margin: 15% auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            input[type="text"],
            input[type="password"] {
                width: calc(100% - 10px);
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            button[type="submit"] {
                width: 100%;
                padding: 9px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            button[type="submit"]:hover {
                background-color: #0056b3;
            }
            input[type="checkbox"]:checked {
                background-color: #007bff; /* Change background color when checked */
            }

            /* Custom checkbox tick mark */
            input[type="checkbox"]::after {
                content: '\2713'; /* Unicode checkmark symbol */
                font-size: 14px;
                color: #fff;
                display: block;
                text-align: center;
                line-height: 20px;
            }

            a {
                color: #007bff; /* Link color */
                text-decoration: none; /* Remove default underline */
                transition: color 0.3s; /* Smooth transition on color change */

            }

            a:hover {
                color: #0056b3; /* Change color on hover */
            }
        </style>
    </head>
    <body>



        <form method="post">
            <h2>Login</h2>
            <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                Username:
                <input type="text"  name="username" value="${cookie.user.value}" required>
            Password:
            <input type="password" name="password" value="${cookie.pass.value}" required>
            <input type="checkbox" ${cookie.rem != null?'checked':''} name="rem" value="ON">Remember Me
            <c:if test="${ not empty requestScope.Error}">
                <p style="color: red">${requestScope.Error}</p>
            </c:if>
            <button type="submit">Login</button>
            <a href="Register"> Create Account ?</a> 
        </form>

    </body>
</html>
