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

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
<main>
    <%--navgation bar--%>
    <%@ include file="includes/header.jsp" %>


    <%@ include file="includes/footer.jsp" %>
</main>

<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
</body>
</html>
