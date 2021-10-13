<%@ page import="javax.swing.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login Page</title>
    <%--    <!-- Bootstrap Core CSS -->--%>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <%--    <!-- Custom Fonts -->--%>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
          rel="stylesheet" type="text/css">

    <%--    <!--    Custom Styles-->--%>
    <link href="${pageContext.request.contextPath}/assets/css/admin/login.css" rel="stylesheet">

    <%--    import sweet alert js--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%
    HttpSession session1 = request.getSession();
    String message = (String) session1.getAttribute("loignMessage");
    String type = (String) session1.getAttribute("userType");
%>
<script>
    var message = "<%=message%>";
    var funcType = "<%= type %>";

    navigatePages(message, funcType);
    console.log(message,funcType);

    function navigatePages(mes, btnType) {
        if (mes === 'LoginError') {
            swal("Please Login again", {
                icon: "error",
            });
            <% session1.setAttribute("loignMessage","LoginError"); %>

        } else if (btnType === 'Admin' && mes == 'loginSuccess') {
            window.location = "http://localhost:8080/Online-Biding-System/views/admin/dashboard.jsp"
        }
    }

</script>
<main>
    <%--    <!--signup div-->--%>
    <div class="container" id="container">
        <div class="form-container sign-up-container" style="overflow-y: scroll;">
            <form method="post" action="" style="height: auto" class="signUpForm">
                <h1 style="margin-top: 15px;">Create Account</h1>
                <span class="mb-2">or use your email for registration</span>
                <div class="row d-flex">
                    <div class="mr-2">
                        <label class="text-black-50 mb-0" for="bidder">Bidder</label>
                        <input class="mt-0 mb-0" type="radio" id="bidder" name="userType" value="Bidder" required/>
                    </div>
                    <div>
                        <label class="text-black-50 mb-0" for="seller">Seller</label>
                        <input class="mt-0 mb-0" type="radio" id="seller" name="userType" value="Seller" required/>
                    </div>

                </div>
                <input type="text"
                       placeholder="Choose A Profile"
                       onfocus="(this.type='file')"
                       required
                       id="editProfile"
                       name="file"
                       class="form-control"
                >
                <input
                        type="text"
                        id="userName"
                        class="form-control"
                        placeholder="User Name"
                        name="userName"
                        required
                />
                <input
                        type="text"
                        id="fName"
                        class="form-control"
                        placeholder="First Name"
                        name="firstName"
                        required
                />
                <input
                        type="text"
                        id="lName"
                        class="form-control"
                        placeholder="Last Name"
                        name="lastName"
                        required
                />
                <input
                        type="email"
                        id="email"
                        class="form-control"
                        placeholder="Email"
                        name="email"
                        required
                />
                <input
                        type="text"
                        id="tel"
                        class="form-control"
                        placeholder="Telephone"
                        name="tel"
                        required
                />
                <textarea placeholder="Address" class="form-control" id="address"
                          name="Address"
                          rows="3"></textarea>
                <input class="form-control" type="password" placeholder="Password" name="password"/>
                <input class="form-control" type="password" placeholder="Confirm Password" name="stConfPassword"/>
                <button style="margin-top: 5px;margin-bottom: 25px;" type="submit">Sign Up
                </button>
            </form>
        </div>


        <%--        <!--        signIN Div-->--%>
        <div class="form-container sign-in-container">
            <form action="${pageContext.request.contextPath}/login" method="post" class="loginForm">
                <h1>Sign in</h1>
                <span>or use your account</span>
                <input type="email" class="form-control" placeholder="Email" name="email" id="sEmail" required/>
                <input type="password" class="form-control" placeholder="Password" name="password" id="sPassword"
                       required/>
                <a style="cursor: pointer;">Forgot your password?</a>
                <button type="submit" id="signInCheck">Sign In</button>
            </form>
        </div>

        <%--        <!--        Info Div-->--%>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>

                <!---->
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Users!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>

            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/login.js"></script>
</body>
</html>