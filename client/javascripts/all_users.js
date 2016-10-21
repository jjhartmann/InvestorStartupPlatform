$(document).ready(function(){
  $(".tag-btn-view").click(function(){
    // console.log($(this));
    // console.log($(this).parents("li").data('id'));
    var link = $(this).find('div.follow');
    console.log("*"+link.text()+"*");
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).find('div.follow').data('id'), target_type: $(this).find('div.follow').data('type')},
      success: function(){
        // console.log("success");
        // console.log(link.text());
        console.log(link.text());
        console.log($('#user_'+link.data('id')).find(".tag-3 div.follow").text());
        if (link.text().trim() == "Follow"){
          link.text("Following");
        }else{
          link.text("Follow");
        }
      }
    })
  });
})
