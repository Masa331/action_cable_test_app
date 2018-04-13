class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def speak(data)
    msg = Message.create!(user: current_user, content: data['msg'])

    HashMessagesJob.set(wait: 5.second).perform_later

    ActionCable.server.broadcast('chat', "#{current_user.name}: #{msg.content}")
  end
end
