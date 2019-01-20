class ChatRooms Channel < ApplicationCable::Channel
    def subscribed
        stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    end

    def unsubscribed 

    end

    def send_message(data)
    end
end