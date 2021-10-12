<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/10/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar z-index">
    <ul>
        <li>
            <a class="active" href="${pageContext.request.contextPath}/views/admin/index.jsp" id="dashboard">
                <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                <span class="title">DashBoard</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/seller.jsp" id="seller">
                <span class="icon"><i class="fas fa-user-tie"></i></span>
                <span class="title">Seller</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/bidder.jsp" id="bidder">
                <span class="icon"><i class="fas fa-child"></i></span>
                <span class="title">Bidder</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/category.jsp" id="category">
                <span class="icon"><i class="fas fa-blog"></i></span>
                <span class="title">Category</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/item.jsp" id="item">
                <span class="icon"><i class="fas fa-box"></i></span>
                <span class="title">Item</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/bid.jsp" id="bid">
                <span class="icon"><i class="fas fa-gavel"></i></span>
                <span class="title">Bid</span>
            </a>
        </li>
    </ul>
</div>