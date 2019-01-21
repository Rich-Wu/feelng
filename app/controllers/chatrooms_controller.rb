class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(mood: params[:mood])
    @message = Message.new
  end
end
