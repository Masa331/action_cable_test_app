receive_func = function(data) {
  $msgList = $('#msg-list')
  p = "<p>" + data + "</p>"

  $msgList.append(p)
};

connected_func = function(data) {
  console.log('lol blah blah blah');
};

App.chat = App.cable.subscriptions.create('ChatChannel', { connected: connected_func, received: receive_func })

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
