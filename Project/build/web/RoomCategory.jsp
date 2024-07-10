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
        <title>Room Type</title>
        <!-- Include necessary CSS files for styling -->
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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure you want to delete this record?")) {
                    window.location.href = "DeleteRoomType?pid=" + id;
                }
            }
        </script>
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
            <h2>Room Type List</h2>
            <form action="SearchRoomType" method="post">
                <input type="text" name="key" placeholder="Search room type">
                <button type="submit">Search</button>
            </form>
            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th>PricePerNight</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${requestScope.list}" var="b">
                        <tr>
                            <td>${b.typename}</td>
                            <td><img width="200px" height="200px" src="${b.image}" alt=""></td>
                            <td>${b.getDescription()}</td>
                            <td>${b.getPricePerNight()}</td>               
                            <td>  
                                <button onclick="location.href = 'EditRoomType?id=${b.typeid}'">Edit</button> 
                                <button onclick="doDelete('${b.typeid}')">Delete</button>  
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <c:if test="${empty requestScope.list}">
                <p style="font-size: 45px">No information!<p>
                </c:if>

        </div>
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddRoomType" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Room Type</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input name="description" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
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
