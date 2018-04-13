class ApplicationController < ActionController::Base
  def current_user
    if cookies[:user_id]
      @user ||= User.find(cookies[:user_id])
    else
      nil
    end
  end
  helper_method :current_user
end
