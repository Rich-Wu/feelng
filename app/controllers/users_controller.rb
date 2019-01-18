class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    @user.journal = Journal.new
    @user.journal.save
    rescue ActiveRecord::RecordNotUnique
      p "There is already a record of this user"
    ensure
      respond_to do |format|
        format.js
      end
  end

  def view
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(session[:id])
  end

  def destroy
    @user = User.find(session[:id])
    respond_to do |format|
      format.js
    end
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :last_name)
  end
end
