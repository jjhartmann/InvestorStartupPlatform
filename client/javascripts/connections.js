$(document).ready(function(){
  $(".destory .fa-comments").click(function(){
    $("#message_target_id").val($(this).closest('li').attr('id'));
  });
});
