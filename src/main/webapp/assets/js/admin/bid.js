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