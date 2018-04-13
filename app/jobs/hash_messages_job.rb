class HashMessagesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ActionCable.server.broadcast('chat', "---- Automatic message ----")
    ActionCable.server.broadcast('chat', "---- Total messages is now: #{Message.count} ----")
    ActionCable.server.broadcast('chat', "---- Automatic message END ----")

    puts 'in job'
    puts 'in job'
    puts 'in job'
    puts 'in job'
  end
end
