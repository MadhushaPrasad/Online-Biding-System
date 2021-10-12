<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Bid" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/buttons.css"/>

    <%--    import Bootstrap css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <%--    import sweet alert js--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <title>Admin || Bid</title>
</head>
<body>
<div id="wrapper">
    <%
        HttpSession session1 = request.getSession();
        String message = (String) session1.getAttribute("message");
        String type = (String) session1.getAttribute("type");
    %>
    <script>
        var message = "<%=message%>";
        var funcType = "<%= type %>";

        displayAlertUpdate(message, funcType);
        displayAlertAdd(message, funcType);
        displayAlertdelete(message, funcType);

        function displayAlertUpdate(mes, btnType) {
            if (mes === 'true' && btnType === 'update') {
                swal("Bid is Updated", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>
                
            } else if (mes === 'false' && 'update') {
                swal("Bid is not Updated", {
                    icon: "error",
                });
                <% session1.setAttribute("message",""); %>
                
            }
            
        }

        function displayAlertAdd(mes, btnType) {
            if (mes === 'true' && btnType === 'add') {
                swal("Bid is Added", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>
                
            } else if (mes === 'false' && 'add') {
                swal("Bid is not Added", {
                    icon: "error",
                });
                <% session1.setAttribute("message",""); %>
                
            }
            
        }

        function displayAlertdelete(mes, btnType) {
            if (mes === 'true' && btnType === 'delete') {
                swal("Bid is Deleted", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>

            } else if (mes === 'false' && 'add') {
                swal("Bid is not Deleted", {
                    icon: "error",
                });
                <% session1.setAttribute("message",""); %>

            }

        }
    </script>
    <%--    header--%>
    <%@include file="includes/header.jsp" %>
    <%--    header finished--%>

    <%--    slider--%>
    <%@include file="includes/slider.jsp" %>
    <%--slider finished--%>
    <%--Bid section--%>
    <div class="main_container">
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">Bid</h4>
                </h1>
            </div>

            <div class="col-12">
                <%--Bid form div--%>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <%--search Bid--%>
                        <form method="get" action="${pageContext.request.contextPath}/bid">
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
                                    <button type="submit" id="btnBidSearch" name="option"
                                            class="btn btn-warning text-white"
                                            value="search">Search
                                    </button>
                                    <button type="submit" class="btn btn-danger" name="option"
                                            value="delete">Delete
                                    </button>
                                    <button type="submit" class="btn btn-success" name="option"
                                            value="getAll">Reload Table
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12">
                        <form id="sellerForm" method="post" action="${pageContext.request.contextPath}/bid">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="pBidID"
                                                class="form-control"
                                                placeholder="Bid ID"
                                                name="bidID"
                                        />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="pUserID"
                                                class="form-control"
                                                placeholder="User ID"
                                                name="userID"
                                        />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <select class="custom-select" id="itemId" name="itemId">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">LKR</span>
                                        <input type="text" class="form-control" id="amount" name="amount"
                                               aria-label="Amount (to the nearest dollar)">
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-around mt-4">
                                <button type="submit" class="btn btn-primary" id="btnCreate" name="option"
                                        value="submit">Submit
                                </button>
                                <button type="submit" class="btn btn-warning text-white btnUpdate" name="option"
                                        value="update">update
                                </button>
                                <button type="submit" class="btn btn-danger" name="option"
                                        value="delete">Cancel
                                </button>
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
                <table class="table col-12">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Item ID</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Bid Time</th>
                        <th scope="col">Bid Date</th>
                        <th scope="col">Status</th>
                        <th scope="col"></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="bidTableBody">
                    <c:forEach items="${bidDetails}" var="bids">
                        <tr>
                            <td>${bids.bid_ID}</td>
                            <td>${bids.userID}</td>
                            <td>${bids.itemID}</td>
                            <td>${bids.amount}</td>
                            <td>${bids.bid_date}</td>
                            <td>${bids.bid_time}</td>
                            <td>${bids.status}</td>
                            <td>
                                <i style='cursor: pointer' class='fas fa-edit btnEdit text-warning'
                                   onclick="editBid()"></i></td>
                            <td>
                                <form action="delete">
                                    <i style='cursor: pointer' class='fas fa-trash-alt btnDelte text-danger'></i>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
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
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin/bid.js"></script>
</body>
</html>
