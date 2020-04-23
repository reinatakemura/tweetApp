class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :content, presence: true, length: {maximum: 140}
  validates :user_id, presence: true

  def user
    return User.find_by(id: self.user_id)
  end

  # THUMBNAIL_SIZE = [400, 400]
  mount_uploader :image, ImageUploader

end
