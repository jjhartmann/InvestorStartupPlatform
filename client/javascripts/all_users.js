$(document).ready(function(){
  $(".btn-primary").click(function(){
    var link = $(this);
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).data('id'), target_type: $(this).data('type')},
      success: function(){
        console.log("success");
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
