class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def speak(data)
    ActionCable.server.broadcast('chat', "#{current_user.name}: #{data['msg']}")
  end
end
