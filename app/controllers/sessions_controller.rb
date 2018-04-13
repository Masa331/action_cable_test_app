class SessionsController < ApplicationController
  def create
    if params[:name]
      user = User.find_or_create_by(name: params[:name])
      cookies[:user_id] = user.id

      redirect_to root_path
    else
      redirect_to root_path, alert: "Sign-in wasn't successful. Try again please."
    end
  end

  def destroy
    cookies.clear
    redirect_to root_path
  end
end
