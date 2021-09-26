$(document).ready(function () {
    getAllCategory();
});

// search category by id Function
$("#subCatSearch").on('click', function () {
    const categoryID = $('#categoryId').val();
    const typesValue = $("#subCatSearch").val();
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
        for (const category of res) {
            const row = "<tr><td>" + category.id + "</td><td>" + category.name + "</td>" +
                "<td><i style='cursor: pointer' class='fas fa-edit btnEdit text-warning' onclick='editCategory()'></i></td>" +
                "<td><i style='cursor: pointer' class='fas fa-trash-alt btnDelte text-danger' onclick='deleteCategory()'></i></td></tr>";
            $("#categoryTableBody").append(row);
        }
    }).fail(function (xhr) {
        console.log(xhr);
    });
});

// call doGet function of category servlet
function getAllCategory() {
    console.log("get All")
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
        console.log(xhr);
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
        console.log(res);
        swal("Category is Added", {
            icon: "success",
        });
        getAllCategory();
    }).fail(function (xhr) {
        console.log(xhr);
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

                console.log(categoryID);
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
                        getAllCategory();
                    } else {
                        swal("Something Wrong Please try again", {
                            icon: "error",
                        });
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


// edit category function
function editCategory() {
    $('#categoryTableBody tr').click(function () {
        const categoryID = $($(this).children()[0]).text();
        const categoryName = $($(this).children()[1]).text();

        $('#categoryId').val(categoryID);
        $('#categoryInput').val(categoryName);
    });
}