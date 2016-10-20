//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('NotificationChannel', {
  received: function(data,id) {
    return $('.notification-box ul').find('li[data-notification-id="'+ data.notification.id+'"]').html(this.renderMessage(data)), $('.notification-box ul').find('li[data-notification-id="'+ data.notification.id+'"]').addClass(data.notification_li_class);
  },
  renderMessage: function(data){
    var accept_reject = ""
      if (data.notification.notification_type == "Meeting"){
        if (data.acceptance_status == "requested"){

          accept_reject = '<div class="btn-yes-no">'+
                              '<a data-remote="true" href="/meetings/accept_request?notification_id='+ data.notification.id+'&amp;status=1"><div class="btn btn-green"><i aria-hidden="true" class="fa fa-check"></i>Accept</div></a>'+
                              '<a data-remote="true" href="/meetings/accept_request?notification_id='+ data.notification.id+'&amp;status=0"><div class="btn btn-green red"><i aria-hidden="true" class="fa fa-times"></i>Ignore</div></a>'+
                            '</div>'
        }
      }
      // return "123"
    return '<div class="profile"><div class="circle-pic"><img src="/assets/img-3.png"/></div></div><div class="notes-track"><div class="main-pro-name">'+ data.notification.notification_text +'</div><span class="time-des"><i aria-hidden="true" class="fa fa-clock-o"></i>' + data.notification_created_time + '</span></div><div class="all-notification-close dismiss-notification"><i aria-hidden="true" class="fa fa-times" data-id="' + data.notification.id + '"></i></div>'+accept_reject
  }
});
