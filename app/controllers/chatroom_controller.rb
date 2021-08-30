class ChatroomController < ApplicationController
  def new
    @chatroom = Chatroom.new()
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.save!
  end

  def index
    @chatroom = Chatroom.find(params[:user_id])
  end
end

private

def chatroom_params
  params.require(:chatroom).permit(:name, :venue, :user)
end
