class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user.password == params[:password]
      session[:id] = user.id
    end
  end

  def logout
    session[:id] = nil
    redirect_to root_path
  end
end
