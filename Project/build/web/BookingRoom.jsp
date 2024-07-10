<%-- 
    Document   : BookingRoom
    Created on : Mar 13, 2024, 8:00:24 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel Booking Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    form {
        max-width: 400px;
        margin: 20px auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    label {
        font-weight: bold;
    }
    input[type="text"],
    input[type="number"],
    input[type="date"] {
        width: 100%;
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
        background-color: #4caf50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<form  method="post">
    
    <label for="room_type" value="${requestScope.roomtype}">Room Type: ${requestScope.roomtype}</label>   
    <br>
    <label for="num_rooms">Number of Rooms:</label>
   <select name="roomnumber">  
       <c:forEach items="${requestScope.room}" var="r">
        <option value="${r.roomnumber}">${r.roomnumber}</option>
       </c:forEach>
    </select>
    <br>
    <label for="check_in">Check-in Date:</label>
    <input type="date" id="check_in" name="check_in">

    <label for="check_out">Check-out Date:</label>
    <input type="date" id="check_out" name="check_out">
    <input type="submit" value="Book Now">
    <c:if test="${not empty requestScope.roomnumber}">
    <p>Room ${requestScope.roomnumber} was booked in approx ${requestScope.checkin} to ${requestScope.checkout}</p>
    <p>Please choose agains </p>  
    </c:if>
      ${requestScope.status}
    
</form>
<center>
    <button style="width: 20%;color: black" onclick="location.href = 'home'">Back to home</button>
     </center>
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

    