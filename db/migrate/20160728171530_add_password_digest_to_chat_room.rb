class AddPasswordDigestToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :password_digest, :string
  end
end
