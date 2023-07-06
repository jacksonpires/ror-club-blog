var postGridIsMobile = false;
var postGridMobileResolution = 912;
var slick;

window.addEventListener('load', function(event) {
  var windowWidth = window.innerWidth;
  if (windowWidth >= postGridMobileResolution) {
    deactivatePostGridMobile();
    postGridIsMobile = false;
  } else {
    activatePostGridMobile();
    postGridIsMobile = true;
  }
});

addEventListener('resize', (event) => {
  postGridCheckMobile();
});

function postGridCheckMobile() {
  var windowWidth = window.innerWidth;
  if (!postGridIsMobile && windowWidth <= postGridMobileResolution) {
    postGridIsMobile = true;
    activatePostGridMobile();
  }
  if (postGridIsMobile && windowWidth >= postGridMobileResolution) {
    postGridIsMobile = false;
    deactivatePostGridMobile();
  }
}

function deactivatePostGridMobile() {
  if (slick) {
    $('#postGridHome').slick('unslick');
    slick = undefined;
  }
}

function activatePostGridMobile() {
  slick = $('#postGridHome').slick({
    centerMode: true,
    slidesToShow: 3,
    centerPadding: '60px',
    slidesToScroll: 1,
    dots: true,
    appendDots: "#postGridHomeBullets",
    arrows: false,
    swipeToSlide: true,
    variableWidth: true
  });
}
