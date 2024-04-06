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