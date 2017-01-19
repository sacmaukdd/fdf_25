class Accounting
  class << self
    def cart_total_cost items
      items.inject(0){|sum, item| sum + (item[0].price * item[1])}
    end

    def item_total_cost price, quantity
      price * quantity
    end

    def order_cost order_items
      order_items.inject(0){|sum, item| sum + item.total_price}
    end
  end
end
