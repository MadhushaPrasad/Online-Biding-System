function editSeller() {
    $('#sellerTableBody tr').click(function () {
        const sellerID = $($(this).children()[0]).text();
        const sellerUserName = $($(this).children()[1]).text();
        const firstName = $($(this).children()[2]).text();
        const lastName = $($(this).children()[3]).text();
        const email = $($(this).children()[4]).text();
        const tel = $($(this).children()[5]).text();
        const address = $($(this).children()[6]).text();
        const img = $($(this).children()[7]).text();

        $('#pSellerID').val(sellerID);
        $('#sellerID').val(sellerID);
        $('#userName').val(sellerUserName);
        $('#fName').val(firstName);
        $('#lName').val(lastName);
        $('#email').val(email);
        $('#tel').val(tel);
        $('#address').val(address);
    });
}