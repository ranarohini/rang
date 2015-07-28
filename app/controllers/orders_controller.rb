class OrdersController < SessionsController
  before_filter :initialize_cart

  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@cart.price_in_cents,
                                              ip: request.remote_ip,
                                              return_url: checkout_cart_url,
                                              cancel_return_url: root_url
                                              )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  # creates order
  def create
    # User.new(white_listed_parameters[:user]
    @order_form = OrderForm.new(
      user: current_user,
      cart: @cart)
    
    if @order_form.save
      session[:cart] = nil
      redirect_to root_path, notice: 'Thank you for shopping'
    else
      render 'carts/checkout'
    end
  end

# private

#   def white_listed_parameters
#     params
#       .require(:order_form)
#       .permit(
#          user:[
#           :first_name, :last_name, :email, :contact_number, :address_1, :address_2, :city, :state, :country, :postcode 
#         ])
#   end
end
