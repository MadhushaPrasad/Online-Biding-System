<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 10/7/2021
  Time: 9:57 PM
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

    <%--import footer css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/product.css"/>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
<%
    HttpSession session1 = request.getSession();
    String message = (String) session1.getAttribute("message");
    String type = (String) session1.getAttribute("type");
%>
<script>
    var message = "<%=message%>";
    var funcType = "<%= type %>";

    navigatePages(message, funcType);

    function navigatePages(mes, btnType) {
        if (mes === 'LoginError') {
            swal("Please Login again", {
                icon: "Error",
            });
            <% session1.setAttribute("message",""); %>

        }

    }

</script>
<%--navgation bar--%>
<%@ include file="views/client/includes/header.jsp" %>
<main class="pb-1 pt-1 main">
    <div class="row mr-0">
        <div class="col-6 d-flex justify-content-center align-items-center">
            <div>
                <h4>Find Next Generation</h4>
                <h2>A Better Way
                    To Buy Property</h2>
                <h6>Bid in private, from the comfort of your home.</h6>
                <a class="btn btnGetStart text-white">Get Start</a>
            </div>
        </div>
        <div class="col-6 justify-content-center align-content-center">
            <img src="${pageContext.request.contextPath}/assets/images/img.png" alt="heroSec" height="501px">
        </div>
    </div>
    <div class="row mr-0">
        <div class="col-12 pl-5 mb-3 mr-0">
            <div class="ml-5">
                <h2>How It Works</h2>
                <h4>Easy 3 steps to win</h4>
            </div>
        </div>
        <div class="row col-12 pl-5 d-flex justify-content-around align-items-center mb-2 mr-0">
            <div class="ourWorks d-flex justify-content-center align-items-center">
                <img src="${pageContext.request.contextPath}/assets/images/img_1.png" height="243px" alt="">
            </div>
            <div class="ourWorks d-flex justify-content-center align-items-center">
                <img src="${pageContext.request.contextPath}/assets/images/img_2.png" height="243px" alt="">
            </div>
            <div class="ourWorks d-flex justify-content-center align-items-center">
                <img src="${pageContext.request.contextPath}/assets/images/img_3.png" height="243px" alt="">
            </div>
        </div>
        <div class="row col-12 pl-5 d-flex justify-content-around align-items-center mb-2 mr-0">
            <div class="ourWorksTitle text-center text-white">
                <h3>Sign Up</h3>
                <h4>No Credit Card <br>
                    Required</h4>
            </div>
            <div class="ourWorksTitle text-center text-white">
                <h3>Bid</h3>
                <h4>Bidding is free <br>
                    Only pay if you win</h4>
            </div>
            <div class="ourWorksTitle text-center text-white">
                <h3>Win</h3>
                <h4>Fun-Excitement <br>
                    Great deals</h4>
            </div>
        </div>
    </div>
    <div class="row mr-0 bgImage">
        <img src="${pageContext.request.contextPath}/assets/images/img_4.png" width="1364px" alt="">
    </div>

    <div class="row mr-0 text-center mt-5 mb-5">
        <div class="col-12">
            <h1 class="font-weight-bold">Featured Items</h1>
            <h5 class="font-weight-bold" style="color: rgba(0, 0, 0, 0.2);">Bid and win great deals,Our auction process
                is simple, efficient, and transparent.</h5>
        </div>
    </div>

    <%--    litem List Div--%>
    <div class="row d-flex justify-content-between align-items-center pb-5 mt-5 mr-0">
        <div style="width: 100%" class="row mr-0 mb-5 d-flex justify-content-between">
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
        <div style="width: 100%" class="row mr-0 mb-5 d-flex justify-content-between">
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
        <div style="width: 100%" class="row mr-0 mb-5 d-flex justify-content-between">
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
        <div style="width: 100%" class="row mr-0 mb-5 d-flex justify-content-between">
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
    </div>

    <div class="row mr-0">
        <img src="${pageContext.request.contextPath}/assets/images/img_4.png" width="1364px" alt="">
        <div class="row col-12 pr-3 content">
            <div class="col-8 text-white">
                <h1 class="pl-5">Register For Free & Start <br>Bidding Now!</h1><br>
                <h6 class="pl-5">From cars to diamonds to iPhones, we have it all.</h6>
            </div>
            <div class="col-4 d-flex align-items-center justify-content-end">
                <a class="btn btnGetRegister text-white mr-5 pr-5">Get Start</a>
            </div>
        </div>
    </div>


    <%@ include file="views/client/includes/footer.jsp" %>
</main>

<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
</body>
</html>
