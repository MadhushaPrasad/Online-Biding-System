$(document).ready(function () {
    getAllSubCategory();
});

function getAllSubCategory() {
    console.log("get All")
    $("#subCategoryTableBody").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "GET",
        dataType: "json",
        data: {
            option: "GetAll"
        }
    }).done(function (res) {
        console.log(res);
        for (const subCategory of res) {
            const row = "<tr><td>" + subCategory.subCategoryID + "</td><td>" + subCategory.categoryID +
                "</td><td>" + subCategory.subCategoryName + "</td>" +
                "<td><i style='cursor: pointer' class='fas fa-edit btnEdit text-warning' onclick='editCategory()'></i></td>" +
                "<td><i style='cursor: pointer' class='fas fa-trash-alt btnDelte text-danger' onclick='deleteCategory()'></i></td></tr>";
            $("#subCategoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
}


$('#btnAddSub').click(function () {
    const formData = $('#subCategoryForm').serialize();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "POST",
        data: formData
    }).done(function (res) {
        console.log(res);

    }).fail(function (xhr) {
        console.log(xhr);
    });
});

