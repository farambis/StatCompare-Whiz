// Show or hide the Back to Top button
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('#back-to-top').fadeIn();
    } else {
      $('#back-to-top').fadeOut();
    }
  });
  
  // Scroll to the top of the page when the Back to Top button is clicked
  $('#back-to-top').click(function() {
    $('html, body').animate({ scrollTop: 0 }, 600);
    return false;
  });

// JS code for the home page
var home_page_acc = document.getElementsByClassName('accordion_label');
for (i = 0; i < home_page_acc.length; i++) {
  home_page_acc[i].addEventListener('click', function () {
    this.classList.toggle('active_accordion')
    
    var acc_content = this.nextElementSibling;
    if (acc_content.style.maxHeight) {
      acc_content.style.maxHeight = null;
    } else {
      acc_content.style.maxHeight = acc_content.scrollHeight + 'px';
    }
  });
}