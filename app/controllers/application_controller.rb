# Application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # initialize session cart
  def initialize_cart
    @cart = Cart.create_from_hash session
  end

end
