$(document).ready(function () {
    getAllCategory();
});
// search Function
$("#subCatSearch").on('click', function () {
    const categoryID = $('#subCategoryId').val();
    const typesValue = $("#subCatSearch").val();
    $("#categoryTableBody").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/category",
        method: "GET",
        data: {
            subCategoryId: categoryID,
            option: "Search"
        },
        dataType: "json"
    }).done(function (res) {
        for (const category of res) {
            const row = "<tr><td>" + category.id + "</td><td>" + category.name + "</td></tr>";
            $("#categoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
});

function getAllCategory() {
    $("#categoryTableBody").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/category",
        method: "GET",
        dataType: "json",
        data: {
            option: "GetAll"
        }
    }).done(function (res) {
        for (const category of res) {
            const row = "<tr><td>" + category.id + "</td><td>" + category.name + "</td></tr>";
            $("#categoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
}