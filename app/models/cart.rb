# session hash with an item array
# item is an array of cart_item (product id and quantity)
class Cart
  attr_accessor :items

  # creates cart item from session hash 
  def self.create_from_hash(hash)
    if hash['cart']
      items = hash['cart']['items'].map do |item_data|
                CartItem.new item_data['product_id'], item_data['quantity']
              end
    else
      items = []
    end
    new items
  end

  # initialize new item empty array
  def initialize(items = [])
    @items = items
  end

  # adds new items to cart or increase the quantity if item exists
  # rails session can't hold objects
  def add_item(product_id)
    item = @items.find { |i| i.product_id == product_id }

    if item
      item.qty_increment
    else
      @items << CartItem.new(product_id)
    end
  end

  # check if item array is empty
  def empty?
    @items.empty?
  end

  # count nunber of items in the cart
  def count
    @items.length
  end

  # serialize cart into a hash
  def serialize
    # creates a hash of items
    items = @items.map do |item|
      {
        product_id: item.product_id,
        quantity: item.quantity
      }
    end
    {
      items: items
    }
  end

  # calculate total price
  def total_price
    @items.inject(0) { |sum, item| sum + item.total_price }
  end

  # convert price to cents for paypal
  def price_in_cents
    (total_price * 100).round
  end

  # deletes item from cart
  def delete_item(product_id)
    @items.delete_if { |i| i.product_id == product_id }
  end

  def get_items
    byebug
    @items.collect do |item|
      product = item.product
      {
        name: product.name, 
        quantity: item.quantity, 
        amount: price_in_cents, 
      }
    end
  end

end
