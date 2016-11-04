$(document).ready(function(){
  $(".close-open").click(function(){
    if($(this).parent('.tabing').hasClass('open')){
      $(".tabing").removeClass("open");
      $(".side-deatail").removeClass("side-bar-set");
    }
    else{
      $(".tabing").addClass("open");
      $(".side-deatail").addClass("side-bar-set");
    }
  });
  // $(".profile-set").click(function(){
  //   $("#home").show();
  //   $(".tabing").hide();
  //   $(".short-profile").hide();
  //   $(".side-bar-set, .side-deatail").css("transition", "none");
  //   $(".profile-set").addClass("active");
  //   $(".container.side-deatail").css("width", "100%");
  //   $(".profile-tabs").css("margin-top", "80px");
  //   $(".tab-content").children('div').removeClass("active");
  //   $(".tabing .nav-pills").children('li').removeClass("active");
  // });
  // $(".navbar-brand").click(function(){
  //   $(".tabing").show();
  //   $("#home").hide();
  //   $(".short-profile").show();
  //   $(".profile-set").removeClass("active");
  //   $(".container.side-deatail").removeAttr("style");
  //   $(".profile-tabs").removeAttr("style");
  //   $("#menu4").addClass("active");
  //   $(".tabing .nav-pills").children('li:first-child').addClass("active");
  // });
  $(document).ready(function(){
    $(".checkbox input").click(function(){
      if($( ".checkbox input" ).is(':checked')){
        $(".checkbox").addClass('checked-box');
      }
      else{
        $(".checkbox").removeClass('checked-box');
      }
    });
  });

  $('.all-notification-close.dismiss-notification').click(function(){
    var data_id = $(this).find('i').data('id');
    $.ajax({
      type: "POST",
      url: '/notifications/' + data_id + '/dismiss',
      success: function(data){        
      }
    });
  });
  $('.alert.header-alert').delay(2000).fadeOut(500);

  $('#all-notification-close-all').click(function(){
    var data_id = 0;
    $.ajax({
      type: "POST",
      url: '/notifications/' + data_id + '/dismiss_all',
      success: function(data){
      }
    });

    // Remove all notification ids
    var allNotes = $('*[id*=notifications]:visible');
    allNotes.each(function(note){
      allNotes[note].remove();
    });
  });
});
