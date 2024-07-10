<%-- 
    Document   : EditInfoGuest
    Created on : Mar 13, 2024, 3:37:09 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8 language="java">
        <title>JSP Page</title>
        <style>
            /* Style the form container */
            .form-container {
                width: 400px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            /* Style form labels */
            .form-container label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            /* Style form inputs */
            .form-container input {
                width: calc(100% - 12px);
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            /* Style the submit button */
            .form-container button {
                padding: 10px 20px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            /* Change button color on hover */
            .form-container button:hover {
                background-color: #45a049;
            }

            /* Style the back to main button */
            .back-button {
                margin-top: 20px;
            }

            .back-button button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            /* Change back to main button color on hover */
            .back-button button:hover {
                background-color: #0056b3;
            }


        </style>
    </head>
    <body>
        <div class="form-container">
        <form method="post">
            <c:set var="l" value="${info}" />
            <div>
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" value="${l.fname}" required>
            </div>
            <div>
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" value="${l.lname}" required>
            </div>
            <div>
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="${l.dob}" required>
            </div>
            <div>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${l.address}" required>
            </div>
            <div>
                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" value="${l.phone}" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${l.email}" required>
            </div>
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${l.username}" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${l.password}" required>
            </div>
            <button type="submit">Submit</button>
            <br>
            ${requestScope.status}
        </form>
        <div class="back-button">
            <button onclick="location.href = 'InfoGuest'">Back to main</button>
        </div>
        </div>
    </body>
</html>
