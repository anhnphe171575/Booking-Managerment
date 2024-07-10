<%-- 
    Document   : YourBooking
    Created on : Mar 13, 2024, 10:53:30 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Booking</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .container {
                margin-top: 20px;
            }

            /* Styles for the table */
            .table {
                width: 100%;
                border-collapse: collapse;
            }

            /* Styles for table headers */
            .table th {
                background-color: #f2f2f2;
                padding: 8px;
                text-align: left;
            }

            /* Styles for table data */
            .table td {
                padding: 8px;
            }

            /* Styles for action buttons */
            .button {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                cursor: pointer;
            }

            .button:hover {
                background-color: #0056b3;
            }

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
        <script type="text/javascript">
            function doCancer(id) {
                if (confirm("Are you sure you want to cancel the room?")) {
                    window.location.href = "CancelRoom?id=" + id;
                }
            }
        </script>
            
    </head>
    <body>
        <ul>
            <li><a class="active" href="home">Home</a></li>
            <li><a href="InfoGuest">Your Info</a></li>
            <li><a href="BookingInfo">Your Booking</a></li>
        </ul>
        <div class="container">
             <h2>Booking List</h2>  
            <form action="SearchBookingGuest" method="post" class="search-form">
                <input type="text" name="key" placeholder="Search by roomnumber">
                <button type="submit">Search</button>
            </form>                  
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Room Number</th>
                        <th>Type Name</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    
                </thead>
                  
                <tbody>
                    
                    <c:forEach items="${listb}" var ="l">
                        <tr>
                            <td>${l.room.roomnumber}</td> 
                              <c:forEach items="${listrt}" var ="rt">
                                <c:if test="${rt.typeid == l.room.type.typeid}">
                            <td>${rt.typename}</td> 
                            </c:if>
                            </c:forEach> 
                            <td>${l.checkin}</td>
                            <td>${l.checkout}</td>
                            <td>${l.amount}</td>
                            <th>${l.status}</th>
                            <c:if test="${l.status == 'pending'}">
                            <th> <button onclick="doCancer('${l.bookingid}')">Cancel</button>  </th>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
             <c:if test="${empty requestScope.listb}">
                      <p style="font-size: 45px">No information!<p>
             </c:if>
        </div>


    </body>
</html>
