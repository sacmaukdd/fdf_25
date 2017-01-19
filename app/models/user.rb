class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable

  mount_uploader :avatar, PictureUploader

  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :suggests, dependent: :destroy

  enum role: [:user, :admin]
  ratyrate_rater

  def is_user? user
    self == user
  end
end
