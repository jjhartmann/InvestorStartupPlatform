App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    $("#message_content").val('')
    id = $("#messages").data('id')
    return $('#messages').append(this.renderMessage(data, id));
  },

  renderMessage: function(data, id) {
    if (data.user_id == id){
      return '<li class="rlt"><div class="message-trip"><div class="tap-sticker">' + data.message + '<span class="timer">' + data.created_at + '</span><span class="timer"><i class="fa fa-user" aria-hidden="true"></i>'+ data.user +'</span></div></div><div class="circle-message"><img src="'+data.image+'"/></div></li>';
    }
    else{
      return '<li><div class="circle-message"><img src="'+data.image+'"/></div><div class="message-trip"><div class="tap-sticker">' + data.message + '<span class="timer">' + data.created_at + '</span><span class="timer"><i class="fa fa-user" aria-hidden="true"></i>'+ data.user +'</span></div></div></li>'
    }
  }
});
