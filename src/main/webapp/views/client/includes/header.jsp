<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/7/2021
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light navigationBar position-sticky sticky-top">
    <div class="pl-2">
        <a class="navbar-brand font-weight-bold text-white"
           style="display:flex;align-item:center;justify-content:center;width: fit-content;height:50px;background-color:#ffffff;"
           href="${pageContext.request.contextPath}/views/index.jsp">
            <img src="http://localhost:8080/Online-Biding-System/assets/images/logo.png" alt="logo" height="50px">
        </a>
    </div>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <div class="row col-lg-12 d-flex justify-content-lg-end align-items-lg-center align-items-sm-start">
            <ul class="navbar-nav">
                <li class="nav-item active px-2">
                    <a class="nav-link font-weight-bold text-white" href="${pageContext.request.contextPath}/index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item font-weight-bold px-2">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/views/client/Product.jsp">Product</a>
                </li>
                <li class="nav-item font-weight-bold px-2">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/views/client/AboutUs.jsp">About Us</a>
                </li>
                <li class="nav-item px-2 font-weight-bold">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/views/client/ContactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item px-2 font-weight-bold">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/views/admin/index.jsp">Login</a>
                </li>
            </ul>
            <img class="mt-sm-2 mt-lg-0" id="profileImage" src="${pageContext.request.contextPath}/assets/images/me.jpg"
                 alt="profile Image">
        </div>
    </div>
</nav>