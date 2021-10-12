$(document).ready(function () {
    getAllItemNames();
});


// edit bid function
function editBid() {
    $('#bidTableBody tr').click(function () {
        const bidID = $($(this).children()[0]).text();
        const userID = $($(this).children()[1]).text();
        const itemID = $($(this).children()[2]).text();
        const amount = $($(this).children()[3]).text();
        console.log(itemID);
        $('#pBidID').val(bidID);
        $('#pUserID').val(userID);
        $('#itemId').prop('selectedIndex', itemID);
        $('#amount').val(amount);
    });
}

//get All categoryNames Function
function getAllItemNames() {
    console.log("get name list")
    $("#itemId").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/ItemServlet",
        method: "GET",
        dataType: "json",
        data: {
            option: "getItemID"
        }
    }).done(function (res) {
        console.log(res);
        const selectedOption = "<option selected disabled>Select A Item</option>";
        $("#itemId").append(selectedOption);
        for (const itemName of res) {
            const row = "<option value=" + itemName.itemID + ">" + itemName.itemName + "</option>";
            $("#itemId").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
}