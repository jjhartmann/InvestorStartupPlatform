$(document).ready(function(){
  $(".follow").click(function(){
    var link = $(this);
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).data('id'), target_type: $(this).data('type')},
      success: function(){
        if (link.text() == "Follow"){
          link.text("Unfollow");
        }else{
          link.text("Follow");
        }
      }
    })
  });
})
