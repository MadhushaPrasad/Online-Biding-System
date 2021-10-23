$(document).ready(function () {
    getAllCategory();
});

// search category by id Function
$("#btnCategorySearch").on('click', function () {
    const categoryID = $('#categoryId').val();
    
    $("#categoryTableBody").empty();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/category",
        method: "GET",
        data: {
            categoryId: categoryID,
            option: "Search"
        },
        dataType: "json"
    }).done(function (res) {
        const row = "<tr><td>" + res.id + "</td><td>" + res.name + "</td>" +
            "<td><i style='cursor: pointer' class='fas fa-edit btnEdit text-warning' onclick='editCategory()'></i></td>" +
            "<td><i style='cursor: pointer' class='fas fa-trash-alt btnDelte text-danger' onclick='deleteCategory()'></i></td></tr>";
        $("#categoryTableBody").append(row);
    }).fail(function (xhr) {
        
    });
});

// call doGet function of category servlet
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
            const row = "<tr><td>" + category.id + "</td><td>" + category.name + "</td>" +
                "<td><i style='cursor: pointer' class='fas fa-edit btnEdit text-warning' onclick='editCategory()'></i></td>" +
                "<td><i style='cursor: pointer' class='fas fa-trash-alt btnDelte text-danger' onclick='deleteCategory()'></i></td></tr>";
            $("#categoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        
    });
}


// create category function
$('#btnCreate').click(function () {
    const formData = $('#categoryForm').serialize();
    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/category",
        method: "POST",
        data: formData
    }).done(function (res) {
        
        swal("Category is Added", {
            icon: "success",
        });
        getAllCategory();
        clearTextFields();
        getAllCategoryNames();
    }).fail(function (xhr) {
        
        swal("Something Wrong Please try again", {
            icon: "error",
        });
    });
});


// delete category function
function deleteCategory() {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this imaginary file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                let categoryID = $('#categoryId').val();

                $.ajax({
                    url: "http://localhost:8080/Online-Biding-System/category",
                    method: "DELETE",
                    contentType: "application/json",
                    data: JSON.stringify({
                        categoryId: categoryID
                    })
                }).done(function (resp) {
                    if (resp === 'false') {
                        if (categoryID === '') {
                            swal("please click edit button before delete", {
                                icon: "error",
                            });
                        }
                    } else if (resp === 'true') {
                        
                        swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        });
                        getAllCategory();
                        clearTextFields();
                        getAllCategoryNames();
                    } else {
                        swal("Something Wrong Please try again", {
                            icon: "error",
                        });
                        getAllCategory();
                        clearTextFields();
                        getAllCategoryNames();
                    }
                    // getAllCategory();
                }).fail(function (xhr) {
                    
                    swal("Poof! Your imaginary file hasn't been deleted!", {
                        icon: "error",
                    });
                });

            } else {
                swal("Your imaginary file is safe!");
            }
        });
}


// edit category function
function editCategory() {
    $('#categoryTableBody tr').click(function () {
        const categoryID = $($(this).children()[0]).text();
        const categoryName = $($(this).children()[1]).text();

        $('#categoryId').val(categoryID);
        $('#categoryInput').val(categoryName);
    });
}

// update category function
$('#btnUpdateCategory').click(function () {

    const categoryID = $("#categoryId").val();
    const categoryName = $("#categoryInput").val();

    $.ajax({
        url: "http://localhost:8080/Online-Biding-System/category",
        method: "PUT",
        contentType: "application/json",
        data: JSON.stringify({
            categoryID: categoryID,
            categoryName: categoryName,
        })
    }).done(function (resp) {
        if (resp === 'false') {
            if (categoryID === '') {
                
                swal("please click edit button before delete", {
                    icon: "error",
                });
                swal("Category is Not Updated", {
                    icon: "error",
                });
            }
        } else if (resp === 'true') {
            
            swal("Category is Updated", {
                icon: "success",
            });
            getAllCategory();
            clearTextFields();
            getAllCategoryNames();
        } else {
            swal("Something Wrong Please try again", {
                icon: "error",
            });
            getAllCategory();
            clearTextFields();
            getAllCategoryNames();
        }
        // getAllCategory();
    }).fail(function (xhr) {
        swal("Something Wrong Please try again", {
            icon: "error",
        });
    });
});

//clear text fields
function clearTextFields() {
    $("#categoryId").val('');
    $("#categoryInput").val('');
}