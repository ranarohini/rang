class OrdersController < SessionsController
  before_filter :initialize_cart

  #paypal express setup purchase
  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@cart.price_in_cents,
                                              ip: request.remote_ip,
                                              :return_url => url_for(action: 'review', only_path: false),
                                              cancel_return_url: root_url
                                              )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  # handle paypal gateway response and display order confirmation page
  def review
    if params[:token].nil?
      redirect_to root_path, :notice => 'Sorry! Something went wrong!' 
      return
    end

    gateway_response = EXPRESS_GATEWAY.details_for(params[:token])
    
    unless gateway_response.success?
      redirect_to root_path, :notice => "Sorry! Something went wrong with the Paypal purchase. Here's what Paypal said: #{gateway_response.message}" 
      return
    end
    @order_info = parse_order_info gateway_response, @cart
  end

  # handle purchase - TO DO
  def purchase
    # if params[:token].nil? or params[:payer_id].nil?
    #   redirect_to home_url, :notice => "Sorry! Something went wrong with the Paypal purchase. Please try again later."
    #   return
    # end

    # purchase_params = get_purchase_params(@cart, params)
    # purchase = EXPRESS_GATEWAY.purchase(@cart.price_in_cents, purchase_params)

    # if purchase.success?
    #   notice = "Thanks for shoping! Your purchase is now complete!"
    # else
    #   notice = "Sorry! Something went wrong while we were trying to complete the purchase with Paypal. Here's what Paypal said: #{purchase.message}"
    # end

    # creating order temporarily
    create
  end

  # creates order
  def create
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

  private

  # parse order info
  def parse_order_info(gateway_response, cart)
    #subtotal, shipping, total = get_totals(cart)
    {
      shipping_address: gateway_response.address,
      email: gateway_response.email,
      name: gateway_response.name,
      gateway_details: {
        :token => gateway_response.token,
        :payer_id => gateway_response.payer_id,
      },
      total: @cart.total_price,
    }
  end

  def get_purchase_params(cart, params)
    return @cart.price_in_cents, {
      :ip => request.remote_ip,
      :token => params[:token],
      :payer_id => params[:payer_id],
    }
  end
end
