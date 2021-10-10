<%@ page import="javax.json.JsonObject" %>
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

    <title>Admin || Category</title>
</head>
<body>
<div id="wrapper">
    <%--    header--%>
    <%@include file="includes/header.jsp" %>
    <%--    header finished--%>

    <%--    slider--%>
    <%@include file="includes/slider.jsp" %>
    <%--slider finished--%>

    <%--category section--%>
    <div class="main_container">
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">Category</h4>
            </div>

            <div class="col-12">
                <%--Category form div--%>
                <div class="row mt-3">
                    <div class="col-lg-12">
                        <%--search category--%>
                        <form method="" action="${pageContext.request.contextPath}/category">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="categoryId"
                                                class="form-control"
                                                placeholder="Category ID"
                                                name="categoryId"
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <button type="button" id="btnCategorySearch" name="searchCategoryButton"
                                            class="btn btn-warning text-white"
                                            value="Search">Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12">
                        <form id="categoryForm" method="" action="">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="categoryInput"
                                                class="form-control"
                                                placeholder="Category Name"
                                                name="categoryNameInput"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-around mt-4">
                                <button type="button" class="btn btn-primary" id="btnCreate">Create</button>
                                <button type="button" class="btn btn-warning text-white" id="btnUpdateCategory">update
                                </button>
                                <button type="submit" class="btn btn-danger">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <%--            On GOing Category table div--%>
            <div class="row ml-md-2 mt-3">
                <h4 class="mt-3 mb-4">Ongoing Category</h4>
                <table class="table col-12">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Category Name</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="categoryTableBody">
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
        <div class="item">
            <div class="item">
                <h4 class="title font-weight-bold">SubCategory</h4>
            </div>

            <div class="col-12">
                <%--Sub Category form div--%>
                <div class="row mt-3">
                    <div class="col-12">
                        <form method="" action="">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-2">
                                        <input
                                                type="text"
                                                id="subCategoryIdFeild"
                                                class="form-control"
                                                placeholder="Sub Category ID"
                                                name="subCategory"
                                        />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <button type="button" class="btn btn-warning text-white" id="btnSubCatSearch">
                                        Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-12">
                        <form id="subCategoryForm" method="" action="">
                            <div class="row mb-2">
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <select class="custom-select" id="categoryIDList" name="categoryID">
                                            <option id="selected" selected>Select A Category</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                    <div class="input-group mb-3">
                                        <input
                                                type="text"
                                                id="subCategoryNameField"
                                                class="form-control"
                                                placeholder="Sub Category Name"
                                                name="subCategoryName"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-around mt-4">
                                <button type="button" class="btn btn-primary" id="btnAddSub">Create</button>
                                <button type="button" class="btn btn-warning text-white" id="btnSubCategoryUpdate">
                                    update
                                </button>
                                <button type="submit" class="btn btn-danger">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <%--On Going Sub Category table div--%>
            <div class="row ml-md-2 mt-3">
                <h4 class="mt-3 mb-4">Ongoing Sub Category</h4>
                <table class="table col-12">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Category Name</th>
                        <th scope="col">Sub Category Name</th>
                    </tr>
                    </thead>
                    <tbody id="subCategoryTableBody">

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
<script src="../../assets/js/admin/category.js"></script>
<script src="../../assets/js/admin/subCategory.js"></script>
</body>
</html>
