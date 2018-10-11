class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  has_many :posts, dependent: :destroy
  mount_uploader :picture, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

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

   # Converts email to all lower-case.
   def downcase_email
    self.email = email.downcase
  end
end
