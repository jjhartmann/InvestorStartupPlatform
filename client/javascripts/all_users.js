$(document).ready(function(){
  $(".btn-primary").click(function(){
    var link = $(this);
    alert(link.data('id'));
    alert(link.text());
    $.ajax({
      url: "/user_dashboards/follow_unfollow_user",
      type: "get",
      data: {target_id: $(this).data('id')},
      success: function(){
        $(this).text("following");
        alert($(this).text());
        document.location.reload();
      }
    })
  });
})
