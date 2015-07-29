# Items in cart
class CartItem
  attr_accessor :product_id, :quantity

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  # increments product quantity in cart
  def qty_increment
    @quantity += 1
  end

  # fetch product
  def product
    Product.find(product_id)
  end

  def total_price
    product.price * quantity
  end

  def getproductid
    @product_id
  end
end
