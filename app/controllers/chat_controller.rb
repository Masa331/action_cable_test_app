class ChatController < ApplicationController
  layout 'chat'

  def index
    ActionCable.server.broadcast('chat', "#{current_user.name} joined chat")
  end
end
