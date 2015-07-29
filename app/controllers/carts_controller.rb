class CartsController < SessionsController
  before_filter :initialize_cart

  # adds items to session cart
  def add
    @cart.add_item params[:id]
    session[:cart] = @cart.serialize
    product = Product.find(params[:id])
    redirect_to :back, notice: "Added #{product.name} to cart."
  end

  # show cart
  def show
  end

  # creates checkout form
  def checkout
    @order_form = OrderForm.new user: current_user
  end

  # removes item from cart
  def remove_item
    #byebug
    product_id = params[:id]
    product = Product.find(product_id)
    @cart.delete_item product_id
    session[:cart] = @cart.serialize
    redirect_to :back, notice: "#{product.name} removed from your cart."
  end
end
