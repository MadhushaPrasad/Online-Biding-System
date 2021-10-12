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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/client/contactUs.css"/>

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
                <h2>Contact Us</h2>
                <h4>Have any questions?</h4>
            </div>
        </div>
        <div class="col-8 d-flex justify-content-center align-content-center">
            <img src="${pageContext.request.contextPath}/assets/images/img_5.png" alt="heroSec" height="501px">
        </div>
    </div>

    <div class="row mr-0 d-flex justify-content-center align-items-center">
        <div class="col-8">
            <form id="contactus" method="" action="${pageContext.request.contextPath}/#">
                <div class="row mb-2">
                    <div class="col-lg-6 col-sm-12">
                        <div class="input-group mb-3">
                            <input
                                    type="text"
                                    id="userName"
                                    class="form-control"
                                    placeholder="First Name"
                                    name="firstName"
                            />
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12">
                        <div class="input-group mb-3">
                            <input
                                    type="text"
                                    id="fName"
                                    class="form-control"
                                    placeholder="Last Name"
                                    name="lastName"
                            />
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-lg-12 col-sm-12">
                        <div class="input-group mb-3">
                            <input
                                    type="text"
                                    id="subject"
                                    class="form-control"
                                    placeholder="Subject"
                                    name="subject"
                            />
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-lg-12 col-sm-12">
                        <div class="input-group mb-3">
                                        <textarea placeholder="Message" class="form-control" id="message"
                                                  name="Message"
                                                  rows="3"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row d-flex justify-content-around mt-4">
                    <button type="button" class="btn" id="btnsend">Send</button>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="includes/footer.jsp" %>
</main>
</body>
</html>
