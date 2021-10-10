<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/10/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top_navbar">
    <div id="hamburger">
        <div class="one"></div>
        <div class="two"></div>
        <div class="three"></div>
    </div>
    <div class="top_menu">
        <div class="logo"><a class="navbar-brand font-weight-bold text-white"
                             href="${pageContext.request.contextPath}/views/admin/index.jsp">
            <img src="../../assets/images/logo.png" alt="logo" height="80px">
        </a></div>
        <div class="text-success font-weight-bold text-center">
            Online bidding system
        </div>
        <ul>
            <li>
                <a href="#">
                    <i class="fas fa-user"></i>
                </a>
            </li>
        </ul>
    </div>
</div>