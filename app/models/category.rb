class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  scope :order_date_desc, -> {order created_at: :desc}
end
