<%-- 
    Document   : Home
    Created on : Mar 8, 2024, 11:00:17 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Montana</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="manifest" href="site.webmanifest"> -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->
        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            /* Định dạng cho mục tìm kiếm */
            .search-form {
                margin-left: 10px; /* Khoảng cách giữa mục tìm kiếm và các mục liên kết khác */
            }

            /* Định dạng cho ô nhập văn bản trong biểu mẫu */
            .search-form input[type="text"] {
                width: 150px; /* Độ rộng của ô nhập văn bản */
                padding: 5px; /* Khoảng cách bên trong ô nhập văn bản */
                border: 1px solid #ccc; /* Viền ô nhập văn bản */
                border-radius: 10px; /* Bo tròn góc của ô nhập văn bản */
            }

            /* Định dạng cho nút tìm kiếm */
            .search-form button[type="submit"] {
                padding: 5px 10px; /* Khoảng cách bên trong nút tìm kiếm */
                background-color: #007bff; /* Màu nền của nút tìm kiếm */
                color: #fff; /* Màu chữ của nút tìm kiếm */
                border: none; /* Loại bỏ viền của nút tìm kiếm */
                border-radius: 3px; /* Bo tròn góc của nút tìm kiếm */
                cursor: pointer; /* Biến con trỏ thành dấu nhấn khi di chuột qua nút tìm kiếm */
            }

            /* Định dạng khi di chuột qua nút tìm kiếm */
            .search-form button[type="submit"]:hover {
                background-color: #0056b3; /* Màu nền thay đổi khi di chuột qua nút tìm kiếm */
            }



        </style>
    </head>

    <body>
        <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid p-0">
                        <div class="row align-items-center no-gutters">
                            <div class="col-xl-5 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="home">home</a></li>
                                            <li><a href="#features_room">rooms</a></li>
                                            <li><a href="#">About</a></li>                                    
                                            <li><a href="#">Contact</a></li>                                          
                                                <c:if test="${empty sessionScope.name}">
                                                <li><a href="Login">Login</a></li>
                                                <li><a href="Register">Register</a></li>
                                                </c:if>
                                                <c:if test="${not empty sessionScope.name}">
                                                <li><a href="Logout">Logout</a></li>
                                                </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo-img">
                                    <a href="home">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-4 d-none d-lg-block">
                                <div class="book_room">
                                    <div class="socail_links">
                                        <ul>
                                            <li>
                                                <c:if test="${not empty sessionScope.name}" >
                                                    <c:set value="${sessionScope.name}" var= "s"></c:set>
                                                    <c:set value="${sessionScope.permission}" var= "v"></c:set>
                                                    <c:choose>
                                                        <c:when test="${v == false}">
                                                            <a href="InfoGuest">
                                                                <i>Hi ${s}</i>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="Room">
                                                                <i>Hi ${s}</i>
                                                            </a>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </c:if>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-facebook-square"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <form action="SearchHome" method="post">
                                                    <input type="text" name="key" placeholder="Search room type">
                                                    <button type="submit">Search</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->

        <!-- slider_area_start -->
        <div class="slider_area">
            <div class="slider_active owl-carousel">
                <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Montana Resort</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Life is Beautiful</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Montana Resort</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider_text text-center">
                                    <h3>Life is Beautiful</h3>
                                    <p>Unlock to enjoy the view of Martine</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="about_area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-5">
                        <div class="about_info">
                            <div class="section_title mb-20px">
                                <span>About Us</span>
                                <h3>A Luxuries Hotel <br>
                                    with Nature</h3>
                            </div>
                            <p>Suscipit libero pretium nullam potenti. Interdum, blandit phasellus consectetuer dolor ornare
                                dapibus enim ut tincidunt rhoncus tellus sollicitudin pede nam maecenas, dolor sem. Neque
                                sollicitudin enim. Dapibus lorem feugiat facilisi faucibus et. Rhoncus.</p>
                            <a href="#" class="line-button">Learn More</a>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7">
                        <div class="about_thumb d-flex">
                            <div class="img_1">
                                <img src="img/about/about_1.png" alt="">
                            </div>
                            <div class="img_2">
                                <img src="img/about/about_2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="features_room" id="features_room">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section_title text-center mb-100">
                            <span>Featured Rooms</span>
                            <h3>Choose a Better Room</h3>
                        </div>
                    </div>
                </div>
            </div>
            <center>
            <c:if test="${empty requestScope.ListRoom}">
                <p style="font-size: 45px">No information!<p>
            </c:if>
                    </center>
            <c:forEach items="${requestScope.ListRoom}" var="l">
                <c:forEach items="${requestScope.NumberRoom}" var="n">
                    <c:if test="${n.key == l.typename}">
                        <div class="rooms_here">                                       
                            <div class="single_rooms">
                                <div class="room_thumb">

                                    <img width="566.4px" height="377.6px" src="${l.image}" alt="">
                                    <div class="room_heading d-flex justify-content-between align-items-center">
                                        <div class="room_heading_inner">
                                            <span> ${n.value}/rooms</span>                              
                                            <span>From ${l.getPricePerNight()}/night</span>
                                            <span>${l.getDescription()}</span> 
                                            <h3>${l.typename}</h3>                             
                                        </div>
                                        <a href="BookingGuest?id=${l.typeid}" class="line-button">book now</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>
        <!-- features_room_end -->

        <!-- forQuery_start -->
        <div class="forQuery">
            <div class="container">
                <div class="row">
                    <div class="col-xl-10 offset-xl-1 col-md-12">
                        <div class="Query_border">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-xl-6 col-md-6">
                                    <div class="Query_text">
                                        <p>For Reservation 0r Query?</p>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-6">
                                    <div class="phone_num">
                                        <a href="#" class="mobile_no">+84 0862126326</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- forQuery_end-->

        <!-- instragram_area_start -->
        <div class="instragram_area">
            <div class="single_instagram">
                <img src="img/instragram/1.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="img/instragram/2.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="img/instragram/3.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="img/instragram/4.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
            <div class="single_instagram">
                <img src="img/instragram/5.png" alt="">
                <div class="ovrelay">
                    <a href="#">
                        <i class="fa fa-instagram"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- instragram_area_end -->

        <!-- footer -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    address
                                </h3>
                                <p class="footer_text"> 61-63 Hoàng Kế Viêm, Bắc Mỹ Phú, Ngũ Hành Sơn, Đà Nẵng </p>
                                <a href="#" class="line-button">Get Direction</a>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Reservation
                                </h3>
                                <p class="footer_text">+84 0862126326 <br>
                                    reservation@montana.com</p>
                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 col-lg-2">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Navigation
                                </h3>
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">Rooms</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">News</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-lg-4">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Newsletter
                                </h3>
                                <form action="#" class="newsletter_form">
                                    <input type="text" placeholder="Enter your mail">
                                    <button type="submit">Sign Up</button>
                                </form>
                                <p class="newsletter_text">Subscribe newsletter to get updates</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>          
        </footer>





        <!-- form itself end -->

        <!-- JS here -->
        <script src="js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/ajax-form.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/scrollIt.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/nice-select.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/gijgo.min.js"></script>

        <!--contact js-->
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>

        <script src="js/main.js"></script>

        <script>
            // Get today's date
            var today = new Date();

            // Format the date to YYYY-MM-DD (required by input type="date")
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;

            // Set the min attribute of the date input field to today's date
            document.getElementById("datepicker").setAttribute("min", today);
        </script>

    </body>

</html>
