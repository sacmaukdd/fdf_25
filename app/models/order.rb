class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy

  enum status: [:waiting, :rejected, :accepted]
  scope :order_date_desc, ->{order created_at: :desc}
end
