class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.user = current_user

    respond_to do |format|
      if message.save
          #broadcasting out to messages channel including the chat_id so messages are broadcasted to specific chat only
          ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
          #message and user hold the data we render on the page using javascript
          message: message.content,
          user: message.user.first_name,
          image: message.user.image,
          created_at: message.created_at
          )
          format.js
      else
          redirect_to chats_path
      end
    end
  end
private

    def message_params
      params.require(:message).permit(:content, :chat_id, :image)
    end


end
