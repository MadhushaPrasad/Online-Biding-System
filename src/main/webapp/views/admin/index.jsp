<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

    <!-- custom css -->
    <link rel="stylesheet" href="../../assets/css/index.css"/>
    <link rel="stylesheet" href="../../assets/css/admin/buttons.css"/>

    <!-- import Bootstrap css -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"/>

    <title>Admin || Dashboard</title>
</head>
<body>
<div id="wrapper">
    <div class="top_navbar">
        <div id="hamburger">
            <div class="one"></div>
            <div class="two"></div>
            <div class="three"></div>
        </div>
        <div class="top_menu">
            <div class="logo">logo</div>
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

    <div class="main_container">

    </div>
</div>
<script src="../../assets/js/index.js"></script>
</body>
</html>
