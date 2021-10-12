let hamburger = document.getElementById('hamburger');
let wrapper = document.getElementById('wrapper');
hamburger.addEventListener('click', function () {
    wrapper.classList.toggle('collapses');
});

// disable toggle collapse in mobile devices
if (window.innerWidth < 768) {
    wrapper.classList.add('collapses');
}
