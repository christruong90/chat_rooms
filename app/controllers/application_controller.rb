class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception

  def emojify(content)
    content.to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = ::Emoji.find_by_alias($1)
        "<span class='emoji'>#{emoji.raw}</span>"
      else
        match
      end
    end.html_safe if content.present?
  end
  helper_method :emojify

  def authenticate_chatroom!
    redirect_to new_session_path, notice: 'please login to chatroom' unless chat_room_signed_in?
  end

  def chat_room_signed_in?
    current_chat_room.present?
  end
  helper_method :chat_room_signed_in?

  def current_chat_room
    #@current_chat_room ||= ChatRoom.find_by_id[:chat_room_id]
  end
  helper_method :current_chat_room

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
