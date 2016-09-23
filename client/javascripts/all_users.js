$(document).ready(function(){
  $(".btn-primary").click(function(){
    var link = $(this);
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).data('id')},
      success: function(){
        if (link.text() == "follow"){
          link.text("following");
        }else{
          link.text("follow");
        }
        // document.location.reload();
      }
    })
  });
})
