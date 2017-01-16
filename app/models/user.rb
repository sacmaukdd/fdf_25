class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable

  mount_uploader :avatar, PictureUploader

  has_many :oders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :suggests, dependent: :destroy

  enum role: [:user, :admin]
  ratyrate_rater
end
