$(document).ready(function(){
  $(".tag-3").click(function(){
    // console.log($(this));
    // console.log($(this).parents("li").data('id'));
    var link = $(this).find('li.follow');
    console.log("*"+link.text()+"*");
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).find('li.follow').data('id'), target_type: $(this).find('li.follow').data('type')},
      success: function(){
        // console.log("success");
        // console.log(link.text());
        console.log(link.text());
        console.log($('#user_'+link.data('id')).find(".tag-3 li.follow").text());
        if (link.text().trim() == "Follow"){
          link.text("Following");
        }else{
          link.text("Follow");
        }
      }
    })
  });
})
