<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/7/2021
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--    import Bootstrap css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <%--import header css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/header.css"/>

    <%--import footer css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/aboutUS.css"/>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
<%--navgation bar--%>
<%@ include file="includes/header.jsp" %>
<main class="pb-1 pt-1">
    <div class="row mr-0">
        <div class="col-4 d-flex justify-content-start align-items-center">
            <div class="pl-5">
                <h2>About Us</h2>
                <h4>What Can You Expect?</h4>
            </div>
        </div>
        <div class="col-8 d-flex justify-content-center align-content-center">
            <img src="${pageContext.request.contextPath}/assets/images/img_6.png" alt="heroSec" height="501px">
        </div>
    </div>
    <div class="row mr-0 mb-4">
        <div class="col-11 m-auto">
            <h3>Website Name</h3>
        </div>
        <div class="col-11 m-auto">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
            </p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
            </p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid culpa dolores hic laboriosam
                minus quas unde! Animi aperiam commodi corporis debitis, eius laboriosam maiores, non nostrum quia
                repudiandae sed.
            </p>
        </div>
    </div>

    <div class="row mr-0 position-relative cardDiv">
        <img src="${pageContext.request.contextPath}/assets/images/img_4.png" width="1364px" alt="">
        <div class="row col-12 d-flex justify-content-center align-items-center content1 m-auto">
            <h1 class="font-weight-bold text-center text-white">
                OVER <br>
                6 MONTHS EXPERIENCE
            </h1>
        </div>
        <div class="row col-12 d-flex justify-content-around align-items-center content m-auto">
            <div class="expreDIv text-center justify-content-center align-items-center">
                <p class="font-weight-bold">62M</p>
                <p class="font-weight-bold">ITEMS AUCTIONED</p>
            </div>
            <div class="expreDIv text-center">
                <p class="font-weight-bold">$358M</p>
                <p class="font-weight-bold">IN SECURE BIDS</p>
            </div>
            <div class="expreDIv text-center">
                <p class="font-weight-bold">63M</p>
                <p class="font-weight-bold">ITEMS AUCTIONED</p>
            </div>
            <div class="expreDIv text-center">
                <p class="font-weight-bold">0.5K</p>
                <p class="font-weight-bold">AUCTION EXPERTS</p>
            </div>
        </div>
    </div>
    <div class="col-12 mr-0 text-center position-relative teamDiv">
        <h1 class="font-weight-bold">Meet The Management Team</h1>
        <p style="color: rgba(0, 0, 0, 0.25);">Our team consists of passionate and talented individuals invested in your success.</p>
        <div class="row d-flex justify-content-around">
            <div class="memberDiv">
                <div>
                    <img style="border-radius: 48px;z-index: 5" src="${pageContext.request.contextPath}/assets/images/img_7.png" height="258px" alt="">
                </div>
                <div class="text-center mt-2">
                    <h5>Madhusha Prasad</h5>
                    <ul class="row pl-0 d-flex justify-content-center">
                        <li class="nav-link"><i class="fab fa-facebook"></i></li>
                        <li class="nav-link"><i class="fab fa-linkedin"></i></li>
                        <li class="nav-link"><i class="fab fa-twitter-square"></i></li>
                    </ul>
                </div>
            </div>
            <div class="memberDiv">
                <div>
                    <img style="border-radius: 48px;z-index: 5" src="${pageContext.request.contextPath}/assets/images/img_8.png" height="258px" alt="">
                </div>
                <div class="text-center mt-2">
                    <h5>Sanuka Jayarathna</h5>
                    <ul class="row pl-0 d-flex justify-content-center">
                        <li class="nav-link"><i class="fab fa-facebook"></i></li>
                        <li class="nav-link"><i class="fab fa-linkedin"></i></li>
                        <li class="nav-link"><i class="fab fa-twitter-square"></i></li>
                    </ul>
                </div>
            </div>
            <div class="memberDiv">
                <div>
                    <img style="border-radius: 48px;z-index: 5" src="${pageContext.request.contextPath}/assets/images/img_9.png" height="258px" alt="">
                </div>
                <div class="text-center mt-2">
                    <h5>Udana Isiwari</h5>
                    <ul class="row pl-0 d-flex justify-content-center">
                        <li class="nav-link"><i class="fab fa-facebook"></i></li>
                        <li class="nav-link"><i class="fab fa-linkedin"></i></li>
                        <li class="nav-link"><i class="fab fa-twitter-square"></i></li>
                    </ul>
                </div>
            </div>
            <div class="memberDiv">
                <div>
                    <img style="border-radius: 48px;z-index: 5" src="${pageContext.request.contextPath}/assets/images/img_10.png" height="258px" alt="">
                </div>
                <div class="text-center mt-2">
                    <h5>Nethmini Tharuka</h5>
                    <ul class="row pl-0 d-flex justify-content-center">
                        <li class="nav-link"><i class="fab fa-facebook"></i></li>
                        <li class="nav-link"><i class="fab fa-linkedin"></i></li>
                        <li class="nav-link"><i class="fab fa-twitter-square"></i></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="includes/footer.jsp" %>
</main>
</body>
</html>
