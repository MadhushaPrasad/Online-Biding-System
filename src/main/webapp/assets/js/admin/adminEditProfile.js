const editProfile = document.getElementById('editProfile');
const bntRemoveProfile = document.getElementById('bntRemoveProfile');

editProfile.addEventListener('change', function () {
    const file = document.getElementById("editProfile").files;
    try {
        if (!(file[0].name === 'undefine')) {
            if (file.length > 0) {
                const fileReader = new FileReader();

                fileReader.onload = function (event) {
                    document.getElementById("editProfileImage").setAttribute("src", event.target.result);
                    console.log(event.target.result);
                };

                fileReader.readAsDataURL(file[0]);
            }
        } else {
            console.log("Error", "You cant upload a image \n without select", "error");
        }
    } catch (err) {
        console.log("Error", "You cant upload a image \n without select", "error");
    }
});

bntRemoveProfile.addEventListener('click', function () {
    document.getElementById("editProfileImage").setAttribute("src", '../../assets/images/avatar.jpg');
});
