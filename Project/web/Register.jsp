<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <title>Registration Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url("img/banner/banner.png");
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 380px;
                height: auto;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"],
            input[type="date"],
            input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            button
            {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            button:hover {
                background-color: #0056b3;
            }
          
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Registration Form</h2>
            <form action="Register" method="post">
                <div>
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" required>
                </div>
                <div>
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" required>
                </div>
                <div>
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dob" min = "1945-01-01" max ="2005-01-01"required>
                </div>
                <div>
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div>
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <c:if test="${not empty requestScope.status}">
                    <p style="color: red">${requestScope.status}</p>
                </c:if>
                <button type="submit">Register</button>
                <button class="home-button" onclick="location.href = 'Login'">Login</button>
                <button class="home-button" onclick="location.href = 'home'">Back to home</button>                
            </form>
        </div>

    </body>
</html>
