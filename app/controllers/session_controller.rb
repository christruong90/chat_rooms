class SessionController < ApplicationController

  # def new
  #
  # end
  #
  # def create
  #   @chat_room = ChatRoom.find_by_id params[:id]
  #   if @chat_room && @chat_room.authenticate(params[:password])
  #     session[:chat_room_id] = @chat_room.id
  #     redirect_to chat_room_path
  #   else
  #     flash[:alert] = 'wrong password'
  #     render :new
  #   end
  # end
  #
  # def destroy
  #   session[:chat_room_id] = nil
  #   redirect_to chat_rooms_path
  # end

end
