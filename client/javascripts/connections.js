$(document).ready(function(){
  // $("#messageModal").on('shown.bs.modal',function(){
  //   $(this).find('input[type="submit"]').text('<i class="fa fa-paper-plane" aria-hidden="true"></i>');
  // });
  $(".message_modal").click(function(){
    $("#message_target_id").val($(this).data('id'));
    $("#messageModal").find('h4').css('text-transform','none');
    $("#messageModal").find(".modal-title").text("Message "+$(this).data('name'));
    $("#messageModal").find(".head-tab").text($(this).data('name'));
  });
});
