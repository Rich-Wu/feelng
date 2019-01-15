class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    rescue ActiveRecord::RecordNotUnique
      p "Something bad happened"
    ensure
      respond_to do |format|
        format.js
      end
  end

  def view
    @user = User.find(1)
  end

  def update
    @user = User.find(1)
  end

  def destroy
    @user = User.find(1)
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
