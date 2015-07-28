# Items in order
class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def total_price
    unit_price * quantity
  end
end
