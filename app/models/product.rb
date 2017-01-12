class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :picture, PictureUploader

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :order_items, dependent: :destroy

  scope :order_alphabet, -> {order name: :ASC}
end
