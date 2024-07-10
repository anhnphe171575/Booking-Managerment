<%-- 
    Document   : InfoInGuest
    Created on : Mar 13, 2024, 2:21:54 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            li {
                float: left;
                border-right:1px solid #bbb;
            }

            li:last-child {
                border-right: none;
            }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover:not(.active) {
                background-color: #111;
            }

            .active {
                background-color: #04AA6D;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a class="active" href="home">Home</a></li>
            <li><a href="InfoGuest">Your Info</a></li>
            <li><a href="BookingInfo">Your Booking</a></li>
        </ul>
        <div class="container">
            <h2>Your information</h2>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set value="${requestScope.info}" var="l"></c:set>
                        <tr>
                            <td>${l.fname} ${l.lname}</td>
                        <td>${l.dob}</td>
                        <td>${l.address}</td>
                        <td>${l.phone}</td> 
                        <td>${l.email}</td>
                        <td>${l.username}</td>
                        <td>${l.password}</td>
                        <td>  
                            <button onclick="location.href = 'EditInfoGuest?id=${l.userid}'">Edit</button>  
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
