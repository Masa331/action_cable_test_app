module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      puts 'someone connected'
      self.current_user = find_verified_user
      logger.add_tags current_user.name
    end

    def disconnect
      puts 'someone disconnected'
    end

    private

    def find_verified_user
      if verified_user = User.find(cookies[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
