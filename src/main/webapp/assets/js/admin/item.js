$(document).ready(function () {
    getAllSubCategory();
    getAllCategoryNames();
});

//get All categoryNames Function
function getAllCategoryNames() {
    console.log("get name list")
    $("#categoryIDList").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "GET",
        dataType: "json",
        data: {
            option: "getCategoryID"
        }
    }).done(function (res) {
        console.log(res);
        const selectedOption = "<option selected disabled>Select A Category</option>";
        $("#categoryIDList").append(selectedOption);
        for (const categoryName of res) {
            const row = "<option value=" + categoryName.categoryID + ">" + categoryName.categoryName + "</option>";
            $("#categoryIDList").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
}