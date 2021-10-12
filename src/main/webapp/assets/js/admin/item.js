$(document).ready(function () {
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

// edit bid function
function editItem() {
    $('#itemTableBody tr').click(function () {
        const itemID = $($(this).children()[0]).text();
        const categoryID = $($(this).children()[1]).text();
        const userID = $($(this).children()[2]).text();
        const itemName = $($(this).children()[3]).text();
        const description = $($(this).children()[4]).text();
        const price = $($(this).children()[5]).text();
        const image = $($(this).children()[6]).text();
        const status = $($(this).children()[7]).text();
        console.log(itemID);
        $('#pItemID').val(itemID);
        $('#pUserID').val(userID);
        $('#itemName').val(itemName);
        $('#description').val(description);
        $('#amount').val(price);
        $('#itemImageInput').val(image);
        $('#categoryIDList').prop('selectedIndex', categoryID);
    });
}
