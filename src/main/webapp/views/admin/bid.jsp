<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 9/28/2021
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

    <title>Admin || Bid</title>
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

    <div class="sidebar">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/views/admin/index.jsp">
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
                <a href="#">
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
                <a href="#">
                    <span class="icon"><i class="fas fa-box"></i></span>
                    <span class="title">Item</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/views/admin/bid.jsp" class="active">
                    <span class="icon"><i class="fas fa-gavel"></i></span>
                    <span class="title">Bid</span>
                </a>
            </li>
        </ul>
    </div>
    <%--Bid section--%>
    <div class="main_container">
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">Bid</h4>
            </div>

            <div class="col-12">
                <%--Bid form div--%>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <%--search Bid--%>
                        <form method="" action="${pageContext.request.contextPath}/#">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="bidID"
                                                class="form-control"
                                                placeholder="Bid ID"
                                                name="bidID"
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <button type="button" id="btnBidSearch" name="searchBidButton"
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
                                        <select class="custom-select" id="department" name="itemId">
                                            <option selected>Item Name</option>
                                            <option value="1">Laptop</option>
                                            <option value="2">Mobile Phone</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">LKR</span>
                                        <input type="text" class="form-control"
                                               aria-label="Amount (to the nearest dollar)">
                                        <span class="input-group-text">.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-around mt-4">
                                <button type="button" class="btn btn-primary" id="btnCreate">Submit</button>
                                <button class="btn btn-warning text-white btnUpdate">update</button>
                                <button type="submit" class="btn btn-danger">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <%--  Bid table div--%>
            <div class="row ml-md-2 mt-3">
                <h4 class="mt-3 mb-4">Bid List</h4>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Item ID</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Bid Time</th>
                        <th scope="col">Bid Date</th>
                        <th scope="col">Status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="bidTableBody">
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
<script src="../../assets/js/admin/bid.js"></script>
</body>
</html>
