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
        <title>JSP Page</title>
        <!-- Include necessary CSS files for styling -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script type="text/javascript">
            function doAccept(id) {
                if (confirm("Are you sure you want to accept this record?")) {
                    window.location.href = "AcceptBooking?pid=" + id;
                }
            }
            function doUnaccept(id) {
                if (confirm("Are you sure you want to unaccept this record?")) {
                    window.location.href = "UnacceptBooking?pid=" + id;
                }
            }
               function doDelete(id) {
                if (confirm("Are you sure you want to delete this record?")) {
                    window.location.href = "DeleteBooking?id=" + id;
                }
            }
        </script>
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
            <h2>Booking List</h2>  
            <form action="SearchListBooking" method="post">
                <input type="text" name="key" placeholder="Search name guest">
                <button type="submit">Search</button>
            </form>
    
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Room Number</th>
                        <th>Type Name</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Amount</th>
                        <th>Status</th>
<!--                        <th>Action</th>-->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listb}" var ="l">
                        <tr>
                            <td>${l.bookingid}</td>
                            <td>${l.user.userid}</td>
                            <td>${l.user.fname} ${l.user.lname}</td>  
                            <td>${l.room.roomnumber}</td> 
                            <c:forEach items="${listrt}" var ="rt">
                                <c:if test="${rt.typeid == l.room.type.typeid}">
                            <td>${rt.typename}</td> 
                            </c:if>
                            </c:forEach> 
                            <td>${l.checkin}</td>
                            <td>${l.checkout}</td>
                            <td>${l.amount}</td>
                           
                            <c:choose>
                                <c:when test="${l.status == 'pending'}">
                                    <td>  
                                        <button onclick="doAccept('${l.bookingid}')">Accept</button>                               
                                    </td>
                                  
                                </c:when>
                                <c:when test="${l.status == 'accept'}">
                                    <td>  
                                        <button onclick="doUnaccept('${l.bookingid}')">Unaccept</button>     
                                        <button onclick="location.href = 'EditBooking?id=${l.bookingid}'">Edit</button>
                                    </td>
                                  
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        Reject
                                        <button onclick="doDelete('${l.bookingid}')">Delete</button>   
                                    </td>
                                     
                                </c:otherwise>
                            </c:choose>
                                    
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
