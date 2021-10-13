var signUp = $('#signUp');
var signIn = $('#signIn');
var containerDiv = $('#container');

signUp.click(function () {
    containerDiv.addClass("right-panel-active");
});
signIn.click(function () {
    containerDiv.removeClass("right-panel-active");
});

