class User < ApplicationRecord
  has_secure_password

  has_attached_file :image, styles: {  medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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
