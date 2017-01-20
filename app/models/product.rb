class Product < ApplicationRecord
  belongs_to :category

  mount_uploader :picture, PictureUploader

  has_many :comments, dependent: :destroy
  has_many :order_items, dependent: :destroy

  scope :order_alphabet, -> {order name: :ASC}
  ratyrate_rateable "rate"
  scope :get_suggest_by_user, -> id_user_suggest do
    where id_user_suggest: id_user_suggest
  end
  scope :get_product_by_admin, -> {where temp: 0}
  scope :get_product_by_suggest, -> {where temp: 1}
  enum temp: [:accept, :approve]
end
