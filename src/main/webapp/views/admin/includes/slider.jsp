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
            <a href="${pageContext.request.contextPath}/views/admin/index.jsp" class="active">
                <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                <span class="title">DashBoard</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/seller.jsp">
                <span class="icon"><i class="fas fa-user-tie"></i></span>
                <span class="title">Seller</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/bidder.jsp">
                <span class="icon"><i class="fas fa-child"></i></span>
                <span class="title">Bidder</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/category.jsp">
                <span class="icon"><i class="fas fa-blog"></i></span>
                <span class="title">Category</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/item.jsp">
                <span class="icon"><i class="fas fa-box"></i></span>
                <span class="title">Item</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/views/admin/bid.jsp">
                <span class="icon"><i class="fas fa-gavel"></i></span>
                <span class="title">Bid</span>
            </a>
        </li>
    </ul>
</div>