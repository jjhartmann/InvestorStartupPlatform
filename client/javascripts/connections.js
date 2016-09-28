$(document).ready(function(){
  // $("#messageModal").on('shown.bs.modal',function(){
  //   $(this).find('input[type="submit"]').text('<i class="fa fa-paper-plane" aria-hidden="true"></i>');
  // });
  $(".destory .fa-comments").click(function(){
    $("#message_target_id").val($(this).closest('li').attr('id'));
    $("#messageModal").find('h4').css('text-transform','none');
    $("#messageModal").find(".modal-title").text("Message "+$(this).parent().parent().parent().find(".name-enetrprise a").text());
    $("#messageModal").find(".head-tab").text($(this).parent().parent().parent().find(".name-enetrprise a").text());
  });
});
