$(document).ready(function () {
    getAllSubCategory();
    getAllCategoryNames();
});


//get All SubCategory Function
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
                "<td><i style='cursor: pointer' class='fas fa-edit btnSubCatEdit text-warning' onclick='editSubCategory()'></i></td>" +
                "<td><i style='cursor: pointer' class='fas fa-trash-alt btnSubCatDelte text-danger' onclick='deleteSubCategory()'></i></td></tr>";
            $("#subCategoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
}


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


//create subcategory function
$('#btnAddSub').click(function () {
    const formData = $('#subCategoryForm').serialize();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "POST",
        data: formData
    }).done(function (res) {
        console.log(res);
        clearSubCategoryTextFields();
        getAllSubCategory();
    }).fail(function (xhr) {
        console.log(xhr);
    });
});

//clear text fields
function clearSubCategoryTextFields() {
    $('#categoryIDList').prop('selectedIndex', 0);
    $("#subCategoryNameField").val('');
    $("#subCategoryIdFeild").val('');
}

// edit subCategory function
function editSubCategory() {
    $('#subCategoryTableBody tr').click(function () {
        const subCategoryID = $($(this).children()[0]).text();
        const categoryID = $($(this).children()[1]).text();
        const subCategoryName = $($(this).children()[2]).text();

        $('#subCategoryIdFeild').val(subCategoryID);
        $('#categoryIDList').prop('selectedIndex', categoryID);
        $('#subCategoryNameField').val(subCategoryName);
    });
}

//subcategory delete function
function deleteSubCategory() {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this imaginary file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                let subCategoryID = $('#subCategoryIdFeild').val();
                $.ajax({
                    url: "http://localhost:8080/Online-Biding-System/subCategory",
                    method: "DELETE",
                    contentType: "application/json",
                    data: JSON.stringify({
                        subCategory: subCategoryID
                    })
                }).done(function (resp) {
                    if (resp === 'false') {
                        console.log(resp);
                        if (subCategoryID === '') {
                            console.log("please click edit button before delete");
                            swal("please click edit button before delete", {
                                icon: "error",
                            });
                        }
                    } else if (resp === 'true') {
                        console.log(resp);
                        swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        });
                        getAllSubCategory();
                        clearSubCategoryTextFields();
                        getAllCategoryNames();
                    } else {
                        swal("Something Wrong Please try again", {
                            icon: "error",
                        });
                        console.log(resp);
                        getAllSubCategory();
                        clearSubCategoryTextFields();
                        getAllCategoryNames();
                    }
                    // getAllCategory();
                }).fail(function (xhr) {
                    console.log("please click edit button before delete");
                    swal("Poof! Your imaginary file hasn't been deleted!", {
                        icon: "error",
                    });
                });

            } else {
                swal("Your imaginary file is safe!");
            }
        });
}

//update subCategory function
$('#btnSubCategoryUpdate').click(function () {

    const subCategoryID = $("#subCategoryIdFeild").val();
    const categoryID = $("#categoryIDList").val();
    const subCategoryName = $("#subCategoryNameField").val();
    console.log(subCategoryID);

    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "PUT",
        contentType: "application/json",
        data: JSON.stringify({
            subCategoryID: subCategoryID,
            categoryID: categoryID,
            subCategoryName: subCategoryName,
        })
    }).done(function (resp) {
        if (resp === 'false') {
            if (subCategoryID === '') {
                console.log("please click edit button before delete");
                swal("please click edit button before delete", {
                    icon: "error",
                });
                swal("Sub Category is Not Updated", {
                    icon: "error",
                });
            }
        } else if (resp === 'true') {
            console.log(resp);
            swal("Sub Category is Updated", {
                icon: "success",
            });
            clearSubCategoryTextFields();
            getAllSubCategory();
        } else {
            swal("Something Wrong Please try again", {
                icon: "error",
            });
            clearSubCategoryTextFields();
            getAllSubCategory();
        }
        // getAllCategory();
    }).fail(function (xhr) {
        swal("Something Wrong Please try again", {
            icon: "error",
        });
    });
});

//search category function
$('#btnSubCatSearch').click(function () {
    const subCategoryID = $("#subCategoryIdFeild").val();
    $("#subCategoryTableBody").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/subCategory",
        method: "GET",
        data: {
            subCategoryId: subCategoryID,
            option: "Search"
        },
        dataType: "json"
    }).done(function (res) {
        const row = "<tr><td>" + res.subCategoryID + "</td><td>" + res.categoryID +
            "</td><td>" + res.subCategoryName + "</td>" +
            "<td><i style='cursor: pointer' class='fas fa-edit btnSubCatEdit text-warning' onclick='editSubCategory()'></i></td>" +
            "<td><i style='cursor: pointer' class='fas fa-trash-alt btnSubCatDelte text-danger' onclick='deleteSubCategory()'></i></td></tr>";
        $("#subCategoryTableBody").append(row);
    }).fail(function (xhr) {
        console.log(xhr);
    });
});
