class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
          format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

 def existing_chats_users
   existing_chat_users = []
     self.chats.each do |chat|
     existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
   end
   existing_chat_users.uniq
 end

end
