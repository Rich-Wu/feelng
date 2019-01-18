class JournalsController < ApplicationController
  def view
    @entries = Journal.find_by(user_id: session[:id]).entries
    if !Journal.find_by(user_id: session[:id])
      redirect_to root_path
    end
  end
end
