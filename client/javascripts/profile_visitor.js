$(document).ready(function(){
    $(".follow").click(function(){
      var link = $(this);
      $.ajax({
        url: "/user_dashboards/follow_unfollow_user",
        type: "get",
        data: {target_id: $(this).data('id'), target_type: $(this).data('type')},
        success: function(){
          if (link.text().trim() == "Follow"){
            link.text("Unfollow");
          }else{
            link.text("Follow");
          }
        }
      })
    });

    $(".follow1").click(function(){
      var link = $(this);
      $.ajax({
        url: "/user_dashboards/follow_unfollow_user",
        type: "get",
        data: {target_id: $(this).data('id'), target_type: $(this).data('type')},
        success: function(){
          if (link.find('i').hasClass('fa-thumbs-o-up')){
            link.find('i').removeClass('fa-thumbs-o-up');
            link.find('i').addClass('fa-thumbs-o-down');
          }else{
            link.find('i').removeClass('fa-thumbs-o-down');
            link.find('i').addClass('fa-thumbs-o-up');
          }
        }
      })
    });
})
