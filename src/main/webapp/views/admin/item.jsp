<%--
  Created by IntelliJ IDEA.
  User: Madhusha Prasad
  Date: 9/28/2021
  Time: 12:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Item" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <%--    import icon--%>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

    <%--    custom css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/buttons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/item.css"/>

    <%--    import Bootstrap css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <%--    import sweet alert js--%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <title>Admin || Item</title>
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
                swal("Item is Updated", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>

            } else if (mes === 'false' && 'update') {
                swal("Item is not Updated", {
                    icon: "error",
                });
                <% session1.setAttribute("message",""); %>

            }

        }

        function displayAlertAdd(mes, btnType) {
            if (mes === 'true' && btnType === 'add') {
                swal("Item is Added", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>

            } else if (mes === 'false' && 'add') {
                swal("Item is not Added", {
                    icon: "error",
                });
                <% session1.setAttribute("message",""); %>

            }

        }

        function displayAlertdelete(mes, btnType) {
            if (mes === 'true' && btnType === 'delete') {
                swal("Item is Deleted", {
                    icon: "success",
                });
                <% session1.setAttribute("message",""); %>

            } else if (mes === 'false' && 'add') {
                swal("Item is not Deleted", {
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

    <%--Item section--%>
    <div class="main_container">
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">Item</h4>
            </div>

            <div class="col-12">
                <%--Item form div--%>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <%--search Item--%>
                        <form method="GET" action="${pageContext.request.contextPath}/ItemServlet">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="itemID"
                                                class="form-control"
                                                placeholder="Item ID"
                                                name="itemID"
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <button type="submit" id="btnItemSearch" name="option"
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
                        <form method="POST" action="${pageContext.request.contextPath}/ItemServlet">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="itemContainer">

                                        <img id="itemImage">
                                        <input type="text"
                                               placeholder="Choose"
                                               onfocus="(this.type='file')"
                                               required
                                               id="itemImageInput"
                                               name="itemImage"
                                        >
                                        <button type="button" id="itemImageRemove">Remove</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="pItemID"
                                                class="form-control"
                                                placeholder="Item ID"
                                                name="itemID"
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
                                        <select class="custom-select" id="categoryIDList" name="categoryID">
                                            <option selected disabled>Select A Category</option>
                                            <option value="1">Laptop</option>
                                            <option value="2">Mobile Phone</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="itemName"
                                                class="form-control"
                                                placeholder="Item Name"
                                                name="itemName"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <textarea placeholder="Item description" class="form-control" id="description"
                                              name="description"
                                              rows="3"></textarea>
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
                                        value="submit">Create
                                </button>
                                <button type="submit" class="btn btn-warning text-white btnUpdate" name="option"
                                        value="update">update
                                </button>
                                <button type="submit" class="btn btn-danger" name="option" value="delete">Cancel
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <%--  Item table div--%>
            <div class="row ml-md-2 mt-3">
                <h4 class="mt-3 mb-4">Item List</h4>
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Category ID</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Image</th>
                        <th scope="col">Status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="itemTableBody">
                    <c:forEach items="${itemDetails}" var="item">
                        <tr>
                            <td>${item.itemID}</td>
                            <td>${item.category_ID}</td>
                            <td>${item.userID}</td>
                            <td>${item.name}</td>
                            <td>${item.description}</td>
                            <td>${item.price}</td>
                            <td>${item.image}</td>
                            <td>${item.status}</td>
                            <td>
                                <i style='cursor: pointer' class='fas fa-edit btnEdit text-warning'
                                   onclick="editItem()"></i>
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
<script src="${pageContext.request.contextPath}/assets/js/admin/item.js"></script>
</body>
</html>
