class Product < ApplicationRecord
  belongs_to :category

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
