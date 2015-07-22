class CartsController < ApplicationController
  before_filter :initialize_cart

  def add
    @cart.add_item params[:id]
    session[:cart] = @cart.serialize
    product = Product.find(params[:id])
    redirect_to :back, notice: "Added #{product.name} to cart."
  end

  def show   
  end

  def checkout
  end

  def remove_item
    product_id = params[id]
    session[:cart].delete product_id.to_i
  end

end