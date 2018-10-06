class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  mount_uploader :picture, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many  :friends, through: :friendships, source: 'receiver'
  has_many  :friend_requests, class_name: "FriendRequest", foreign_key: 'request_sender'
  has_many  :requests_received, class_name: "FriendRequest", foreign_key: 'request_receiver'
  validate  :picture_size

  def feed
    Post.where("user_id = ?", id)
  end

  private

   # Validates the size of an uploaded picture.
   def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
