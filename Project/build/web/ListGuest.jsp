<%-- 
    Document   : newjsp
    Created on : Mar 12, 2024, 12:30:54 AM
    Author     : msi
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Guest</title>
        <!-- Include necessary CSS files for styling -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure you want to delete this record?")) {
                    window.location.href = "DeleteUser?pid=" + id;
                }
            }
            function SetRole(id, role) {
                if (confirm("Are you sure you want to delete this record?")) {
                    window.location.href = "SetRole?id=" + id + "&role=" + role;
                }
            }
        </script>
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
            button {
                padding: 8px 16px;
                font-size: 14px;
                cursor: pointer;
                border: none;
                border-radius: 4px;
                background-color: #007bff; /* Blue color */
                color: #fff; /* White text */
            }

            button:hover {
                background-color: #0056b3; /* Darker blue on hover */
            }

            /* Optional: Add margin between buttons */
            td button {
                margin-right: 8px;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a class="active" href="home">Home</a></li>
            <li><a href="Room">Room List</a></li>
            <li><a href="Booking">List Booking</a></li>
            <li><a href="RoomType">Room Type</a></li>
            <li><a href="UserAd">List User</a></li>
        </ul>
        <div class="container">
            <h2>Guest List</h2>
            <form action="SearchUser" method="post">
                <input type="text" name="key" placeholder="Search name guest">
                <button type="submit">Search</button>
            </form>
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
                        <th>Permission</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.list}" var="l">
                        <tr>
                            <td>${l.fname} ${l.lname}</td>
                            <td>${l.dob}</td>
                            <td>${l.address}</td>
                            <td>${l.phone}</td> 
                            <td>${l.email}</td>
                            <td>${l.username}</td>
                            <td>${l.password}</td>
                            <c:if test="${!l.permission}" >
                                <td>Guest</td>
                            </c:if>
                             <c:if test="${l.permission}" >
                                <td>Admin</td>
                            </c:if>
                            <td>  
                                <button onclick="doDelete('${l.getUserid()}')">Delete</button>  
                            </td>
                            <c:if test="${!l.permission}" >
                                <td>  
                                   <button onclick="SetRole('${l.getUserid()}', true)">Set Admin</button>
                                </td>
                            </c:if>
                            <c:if test="${l.permission}" >
                                <td>  
                                    <button onclick="SetRole('${l.getUserid()}', false)">Set Guest</button>  
                                </td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
            <c:if test="${empty requestScope.list}">
                <p style="font-size: 45px">No information!<p>
                </c:if>
        </div>




        <!-- Include necessary JavaScript files for Bootstrap and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
