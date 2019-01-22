class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(@mood)
    @message = Message.new
    if @chatroom
      puts "nice"
    else
      @chatroom.create(:mood => @mood.to_s)
    end
  end
end
