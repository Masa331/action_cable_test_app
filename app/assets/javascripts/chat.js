receive_func = function(data) {
  $msgList = $('#msg-list')
  p = "<p>" + data + "</p>"

  $msgList.append(p)
};

App.chat = App.cable.subscriptions.create('ChatChannel', { received: receive_func })

$(document).ready(function() {
  form = $('#msg-form');
  input = $('input', form)[0];

  form.on('submit', function(e) {
    e.preventDefault();
    value = input.value;
    input.value = '';

    App.chat.perform('speak', { msg: value });
  });
});
