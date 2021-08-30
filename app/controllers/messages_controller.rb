class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.date = Time.now
    @message.save!
  end

  private

  def message_params 
    params.require(:messages).permit(:chatroom, :user, :content)
  end
end
