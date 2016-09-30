$(document).ready(function(){
  $(".follow").click(function(){
    var link = $(this);
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).data('id'), target_type: $(this).data('type')},
      success: function(){
        console.log("success");
        console.log(link.text());
        console.log($('#user_'+link.data('id')).find(".tag-3 a").text());
        if (link.text() == "Follow"){
          link.text("Following");
        }else{
          link.text("Follow");
        }
      }
    })
  });
})
