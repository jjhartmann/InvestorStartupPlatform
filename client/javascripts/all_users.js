$(document).ready(function(){
  $(".tag-btn-view").click(function(){
    var link = $(this).find('div.follow');
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).find('div.follow').data('id'), target_type: $(this).find('div.follow').data('type')},
      success: function(){}
    })
  });
})
