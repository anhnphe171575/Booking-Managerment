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
            function doDelete(id) {
                if (confirm("Are you sure you want to delete this record?")) {
                    window.location.href = "DeleteRoom?pid=" + id;
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
            <h2>Room List</h2>
             <form action="SearchRoom" method="post">
                <input type="text" name="key" placeholder="Search room number">
                <button type="submit">Search</button>
            </form>
            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Room</span></a>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Room Number</th>
                        <th>Type Name</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listr}" var="b">
                        <tr>
                            <td>${b.roomnumber}</td>
                            <td>${b.type.typename}</td>
                            <c:choose>
                                <c:when test="${b.status}">
                                    <td>  
                                        Available                      
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>                                      
                                        Unavailable     
                                    </td>
                                </c:otherwise>
                            </c:choose>
                                        
                            <td>  
                               <button onclick="location.href = 'EditRoom?id=${b.roomnumber}'">Edit</button> 
                               <button onclick="doDelete('${b.roomnumber}')">Delete</button>                               
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <c:if test="${empty requestScope.listr}">
                <p style="font-size: 45px">No information!<p>
                </c:if>
        </div>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddRoom" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Room</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Room Number</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Status</label><br>
                               <input type="radio"  name = "status" value =false required /> Unavailable      
                               <input type="radio"  name = "status" value =true required /> Availabilable
                            </div>
                                 
                                <div class="form-group">
                                    <label for="job1">Choose Room Type</label><br>
                                   <select id="typeid" name = "typeid" required> 
                                          <c:forEach items="${requestScope.listrt}" var = "rt">
                                    <option value="${rt.typeid}">
                                        <c:out value="${rt.typename}" />
                                    </option>
                                         </c:forEach>
                                   </select>

                                </div>  
                      
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <!-- Include necessary JavaScript files for Bootstrap and jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
