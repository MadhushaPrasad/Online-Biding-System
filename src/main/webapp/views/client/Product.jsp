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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/product.css"/>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
<%--navgation bar--%>
<%@ include file="includes/header.jsp" %>
<main class="pb-1 pt-1" style="height: auto">
    <div class="row mr-0">
        <div class="col-4 d-flex justify-content-start align-items-center">
            <div class="pl-5">
                <h2>Product</h2>
                <h4>Do You Want submit a BID?</h4>
            </div>
        </div>
        <div class="col-8 d-flex justify-content-center align-content-center">
            <img src="${pageContext.request.contextPath}/assets/images/img_11.png" alt="heroSec" height="501px">
        </div>
    </div>
    <div class="row mr-0 mb-5 d-flex justify-content-between">
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
    </div>
    <div class="row mr-0 mb-5 d-flex justify-content-between">
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
    </div>
    <div class="row mr-0 mb-5 d-flex justify-content-between">
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
    </div>
    <div class="row mr-0 mb-5 d-flex justify-content-between">
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
    </div>
    <div class="row mr-0 mb-5 d-flex justify-content-between">
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <img class="img" src="${pageContext.request.contextPath}/assets/images/img_13.png" alt="">
            </div>
            <div class="row mt-2 mb-2 d-flex justify-content-center align-items-center text-center">
                <h5>Surface Laptop</h5>
            </div>
            <div class="row">
                <p class="pl-4 text-justify pr-4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Adipiscing eros, ac pellentesque metus, in
                    tempus faucibus eget proin. Mauris, orci ut amet egestas ac mi non molestie laoreet.
                </p>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <div class="col-6">
                    <div class="row d-flex justify-content-between align-items-center">
                        <div class="col-12 text-left">
                            <i class="fas fa-gavel" style="color: #1c7430"></i>
                            <h5 class="font-weight-bold">Current Bid</h5>
                            <p class="font-weight-bold">$876.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <h5 class="text-danger font-weight-bold">Price</h5>
                    <p class="text-danger font-weight-bold">$876.00</p>
                </div>
            </div>
            <div class="row pl-4 pr-4 d-flex justify-content-between align-items-center">
                <p class="text-danger font-weight-bold">10d:20h:10min:10s</p>
                <p class="text-success font-weight-bold">30 Bids</p>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <button class="btn font-weight-bold text-white btnSubmit">Submit a bit</button>
            </div>
        </div>
    </div>
    <%@ include file="includes/footer.jsp" %>
</main>
</body>
</html>