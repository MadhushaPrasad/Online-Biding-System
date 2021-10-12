<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<h1>Hello</h1>
<a href="${pageContext.request.contextPath}/views/admin/category.jsp">Category</a>

<form action="upload" method="post" enctype="multipart/form-data">
    <div class="sellerContainer">

        <img id="editProfileImage">
        <input type="text"
               placeholder="Choose"
               onfocus="(this.type='file')"
               required
               id="editProfile"
               name="file"
        >
        <button type="submit" id="bntRemoveProfile">Remove</button>
    </div>
</form>
</body>
</html>