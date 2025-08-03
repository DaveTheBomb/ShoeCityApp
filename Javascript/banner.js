
function startBannerSlider(){
    const bannerWrapper = document.getElementById("bannerWrapper");
    const btnLeft = document.getElementById("btnLeft");
    const btnRight = document.getElementById("btnRight");

    const bannerItems = document.querySelectorAll(".bannerItem");
    const totalSlides = bannerItems.length;
    let currentSlide = 0;





    function updateSliderPosition() {
        const percentage = -(25 * currentSlide);
        bannerWrapper.style.transform = `translateX(${percentage}%)`;
        updateButtons();
    }

    function updateButtons() {
        btnLeft.disabled = currentSlide === 0;
        btnRight.disabled = currentSlide === totalSlides - 1;

        btnLeft.style.opacity = currentSlide === 0 ? 0.3 : 0.5;
        btnRight.style.opacity = currentSlide === totalSlides - 1 ? 0.3 : 0.5;
    }

    btnRight.addEventListener("click", () => {
        if (currentSlide < totalSlides - 1) {
            currentSlide++;
            updateSliderPosition();
        }
    });

    btnLeft.addEventListener("click", () => {
        if (currentSlide > 0) {
            currentSlide--;
            updateSliderPosition();
        }
    });

    // Initialize
    updateSliderPosition();

}