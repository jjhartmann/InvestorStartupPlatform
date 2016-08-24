$( document ).ready(function() {
      $('body').scrollspy({
          target: '.navbar-fixed-top',
          offset: 51
          });
        $('.navbar-collapse ul li a').click(function(){
                $('.navbar-toggle:visible').click();
        });
        $('#mainNav').affix({
            offset: {
                top: 100
            }
        })
});
$(document).on("scroll", function () {
            var screenwidth = screen.width;
            if ($(document).scrollTop() > 0) {
                $("#mainNav").addClass("affix");
                $("#mainNav").removeClass("affix-top");
            }
            else {
                $("#mainNav").addClass("affix-top");
                $("#mainNav").removeClass("affix");
            }
});
