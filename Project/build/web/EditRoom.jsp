<%-- 
    Document   : edit.jsp
    Created on : Jan 30, 2024, 2:56:56 PM
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
            <c:set var="r" value="${room}" />
            <label for="Name">Room Number</label><br>
            <input type="text"  name="name"  value="${r.roomnumber}" required readonly><br>
            <p>Gender:</p>
            <input type="radio"  name = "status" value = false ${!r.status ? "checked" : "" } required /> Unavailable      
            <input type="radio"  name = "status" value = true  ${r.status ? "checked" : "" } required /> Availabilable
            <br>
            <label for="RoomType">Choose Room Type:</label>     
            <select id="" name = "typeid" required>   
                <c:forEach items="${requestScope.roomtype}" var="type">  
                    <option value="${type.typeid}" ${type.typename == r.type.typename ? "selected" : ""}>${type.typename}</option>
                </c:forEach>
            </select>                  
            </br>
            <input type="submit" value="Submit">
            <c:if test="${requestScope.status ne null }">
                <c:out value="${requestScope.status}" escapeXml="true"></c:out>
            </c:if>
           
        </form>
        <div>
            <button onclick="location.href = 'Room'">Back to main</button>
        </div>
    </body>
</html>
