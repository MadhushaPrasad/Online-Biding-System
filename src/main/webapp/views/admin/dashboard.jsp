<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/13/2021
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

    <!-- custom css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/buttons.css"/>

    <!-- import Bootstrap css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <title>Admin || Dashboard</title>
</head>
<body>
<div id="wrapper">
    <%
        HttpSession session1 = request.getSession();
        String message = (String) session1.getAttribute("message");
        String type = (String) session1.getAttribute("userType");
    %>

    <%--    header--%>

    <%@include file="includes/header.jsp" %>
    <%--    header finished--%>

    <%--    slider--%>
    <%@include file="includes/slider.jsp" %>
    <%--slider finished--%>
    <div class="main_container">
        <div class="item">
            <div class="row"></div>
            <div class="col-12">
                <h2>Seller Details</h2>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Seller User Name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telephone</th>
                        <th scope="col">Address</th>
                        <th scope="col">Image</th>
                        <th scope="col">type</th>
                        <th scope="col">status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="sellerTableBody">
                    <c:forEach items="${userDetails}" var="User">
                        <tr>
                            <td>${User.userID}</td>
                            <td>${User.userName}</td>
                            <td>${User.f_Name}</td>
                            <td>${User.l_Name}</td>
                            <td>${User.email}</td>
                            <td>${User.telephone}</td>
                            <td>${User.address}</td>
                            <td><img src="${pageContext.request.contextPath}/assets/uploadImg/${User.img}"
                                     alt="userProfile" height="50px"></td>
                                <%--                            <td>${User.password}</td>--%>
                            <td>${User.type}</td>
                            <td>${User.status}</td>
                            <td>
                                <i style='cursor: pointer' class='fas fa-edit btnEdit text-warning'
                                   onclick="editSeller()"></i></td>
                            <td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

            <div class="col-12">
                <h2>Bidder Details</h2>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Seller User Name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telephone</th>
                        <th scope="col">Address</th>
                        <th scope="col">Image</th>
                        <th scope="col">type</th>
                        <th scope="col">status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="sellerTableBody">
                    <c:forEach items="${userDetails}" var="User">
                        <tr>
                            <td>${User.userID}</td>
                            <td>${User.userName}</td>
                            <td>${User.f_Name}</td>
                            <td>${User.l_Name}</td>
                            <td>${User.email}</td>
                            <td>${User.telephone}</td>
                            <td>${User.address}</td>
                            <td><img src="${pageContext.request.contextPath}/assets/uploadImg/${User.img}"
                                     alt="userProfile" height="50px"></td>
                                <%--                            <td>${User.password}</td>--%>
                            <td>${User.type}</td>
                            <td>${User.status}</td>
                            <td>
                                <i style='cursor: pointer' class='fas fa-edit btnEdit text-warning'
                                   onclick="editSeller()"></i></td>
                            <td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>

            <div class="col-12">
                <h2>Item Details</h2>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Seller User Name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telephone</th>
                        <th scope="col">Address</th>
                        <th scope="col">Image</th>
                        <th scope="col">type</th>
                        <th scope="col">status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="sellerTableBody">
                    <c:forEach items="${userDetails}" var="User">
                        <tr>
                            <td>${User.userID}</td>
                            <td>${User.userName}</td>
                            <td>${User.f_Name}</td>
                            <td>${User.l_Name}</td>
                            <td>${User.email}</td>
                            <td>${User.telephone}</td>
                            <td>${User.address}</td>
                            <td><img src="${pageContext.request.contextPath}/assets/uploadImg/${User.img}"
                                     alt="userProfile" height="50px"></td>
                                <%--                            <td>${User.password}</td>--%>
                            <td>${User.type}</td>
                            <td>${User.status}</td>
                            <td>
                                <i style='cursor: pointer' class='fas fa-edit btnEdit text-warning'
                                   onclick="editSeller()"></i></td>
                            <td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/dashboard.js"></script>
</body>
</html>