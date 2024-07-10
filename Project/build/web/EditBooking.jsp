<%-- 
    Document   : EditBooking
    Created on : Mar 14, 2024, 10:29:21 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Apply styles to body */
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            /* Apply styles to form */
            form {
                max-width: 600px; /* Sửa lại giá trị 600px để phù hợp với thiết kế của bạn */
                width: 100%;
                margin: 20px auto; /* Đặt margin-left và margin-right là auto để canh giữa form */
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }


            /* Apply styles to input fields */
            input[type="text"],
            input[type="date"],
            select {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box; /* Ensure padding is included in the width */
            }

            /* Apply styles to radio buttons */
            input[type="radio"] {
                margin-right: 5px;
            }

            /* Apply styles to submit button */
            input[type="submit"],
            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                margin-top: 10px;
            }

            input[type="submit"]:hover,
            button:hover {
                background-color: #0056b3;
            }

            /* Apply styles to status message */
            .status {
                margin-top: 10px;
                padding: 10px;
                background-color: #d4edda;
                border: 1px solid #c3e6cb;
                border-radius: 5px;
                color: #155724;
            }

            /* Apply styles to back button */
            button.back {
                background-color: #6c757d;
            }

            button.back:hover {
                background-color: #5a6268;
            }


        </style>
    </head>
    <body>
        <form method="post">
            <c:set var="b" value="${booking}" /> 
            <c:forEach items="${roomtype}" var ="rt">
                <c:if test="${rt.typeid == b.room.type.typeid}">
                    <input type="text" name = "roomtype" value="${rt.typename}" required readonly>
                </c:if>
            </c:forEach>
            <input type="text" name = "room" value="${b.room.roomnumber}" required readonly>
            <input type="date" name = "checkin" id="check_in" value="${b.checkin}" required>
            <input type="date" name = "checkout" id="check_out" value="${b.checkout}" required> 
            <button type="submit">Submit</button>
            <c:if test="${requestScope.status ne null }">
                <c:out value="${requestScope.status}" escapeXml="true"></c:out>
            </c:if>
            <c:if test="${not empty requestScope.roomnumber}">
                <p>Room ${requestScope.roomnumber} was booked in approx ${requestScope.checkin} to ${requestScope.checkout}</p>
                <p>Please choose agains </p>  
            </c:if>
        </form>
        <div>
            <button onclick="location.href = 'Booking'">Back to main</button>
        </div>
        <script>
                       // Get today's date
            var today = new Date();

// Format the date to YYYY-MM-DD (required by input type="date")
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
var yyyy = today.getFullYear();

today = yyyy + '-' + mm + '-' + dd;

// Set the min attribute of the date input field to today's date

// Assuming you have checkInDate and checkOutDate defined elsewhere
document.getElementById("check_in").setAttribute("min", today);

document.getElementById("check_in").addEventListener("change", function() {
    var checkInDate = new Date(this.value);
    var nextDay = new Date(checkInDate);
    nextDay.setDate(checkInDate.getDate() + 1);
    var nextDayFormatted = nextDay.toISOString().split('T')[0];
    document.getElementById("check_out").setAttribute("min", nextDayFormatted);
});

        </script>
    </body>
</html>
