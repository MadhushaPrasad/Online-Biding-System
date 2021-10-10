<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 9/27/2021
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <%--    import icon--%>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

    <%--    custom css--%>
    <link rel="stylesheet" href="../../assets/css/index.css"/>
    <link rel="stylesheet" href="../../assets/css/admin/buttons.css"/>

    <%--    import Bootstrap css--%>
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"/>

    <%--    import sweet alert js--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <title>Admin || Bidder</title>
</head>
<body>
<div id="wrapper">
    <%--    header--%>
    <%@include file="includes/header.jsp" %>
    <%--    header finished--%>

    <%--    slider--%>
    <%@include file="includes/slider.jsp" %>
    <%--slider finished--%>

    <%--Bidder section--%>
    <div class="main_container">
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">Bidder</h4>
            </div>

            <div class="col-12">
                <%--Bidder form div--%>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <%--search Bidder--%>
                        <form method="" action="${pageContext.request.contextPath}/#">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="bidderId"
                                                class="form-control"
                                                placeholder="Bidder ID"
                                                name="bidderID"
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <button type="button" id="btnBidderSearch" name="searchBidderButton"
                                            class="btn btn-warning text-white"
                                            value="Search">Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12">
                        <form id="sellerForm" method="" action="${pageContext.request.contextPath}/#">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="userName"
                                                class="form-control"
                                                placeholder="User Name"
                                                name="userName"
                                        />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="fName"
                                                class="form-control"
                                                placeholder="First Name"
                                                name="firstName"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="lName"
                                                class="form-control"
                                                placeholder="Last Name"
                                                name="lastName"
                                        />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="email"
                                                id="email"
                                                class="form-control"
                                                placeholder="Email"
                                                name="email"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="tel"
                                                class="form-control"
                                                placeholder="Telephone"
                                                name="tel"
                                        />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <textarea placeholder="Address" class="form-control" id="address"
                                                  name="Address"
                                                  rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-around mt-4">
                                <button type="button" class="btn btn-primary" id="btnCreate">Create</button>
                                <button class="btn btn-warning text-white btnUpdate">update</button>
                                <button type="submit" class="btn btn-danger">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <%--            On going Bidder table div--%>
            <div class="row ml-md-2 mt-3">
                <h4 class="mt-3 mb-4">Bidder List</h4>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Bidder User Name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Telephone</th>
                        <th scope="col">Address</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="bidderTableBody">
                    </tbody>
                </table>
                <nav
                        aria-label="Page navigation example"
                        class="offset-lg-4 offset-md-3"
                >
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled">
                            <a
                                    class="page-link"
                                    href="#"
                                    tabindex="-1"
                                    aria-disabled="true"
                            >Previous</a
                            >
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script src="../../assets/js/jquery.js"></script>
<script src="../../assets/js/index.js"></script>
<script src="../../assets/js/admin/seller.js"></script>
</body>
</html>
